//
//  ScannerView.swift
//  ICleanMedX
//
//  Created by Alan Kim on 3/21/26.
//

import SwiftUI
import AVFoundation

struct ScannerView: View {
    @State private var session: AVCaptureSession = AVCaptureSession()
    @State private var scannedCode: String = ""
    @StateObject private var qrDelegate = QRScannerDelegate()
    @State private var qrOutput: AVCaptureMetadataOutput = AVCaptureMetadataOutput()
    
    var body: some View {
        VStack {
            Text("Scan Device QR Code")
                .font(.headline)
                .padding()
            
            CameraView(frameSize: UIScreen.main.bounds.size, session: $session)
                .ignoresSafeArea()
        }
        .onAppear {
            setupCamera()
        }
        .onChange(of: qrDelegate.scannedCode) { newValue in
            if let scannedCode = newValue {
                
                if scannedCode.hasPrefix("STETH-") {
                    print("correct QR code: \(scannedCode)")
                    
                }
                qrDelegate.scannedCode = nil
            }
            

            // also check if scannedCode brings with STETH- prefix.
            // this ensures we are in the right QR code 
        }
    }
    
    func setupCamera() {
        guard let device = AVCaptureDevice.default(for: .video) else { return }
        guard let input = try? AVCaptureDeviceInput(device: device) else { return }
        
        session.beginConfiguration()
        session.addInput(input)
        session.addOutput(qrOutput)
        qrOutput.metadataObjectTypes = [.qr]
        qrOutput.setMetadataObjectsDelegate(qrDelegate, queue: .main)
        session.commitConfiguration()
        
        DispatchQueue.global(qos: .background).async {
            session.startRunning()
        }
    }
}
