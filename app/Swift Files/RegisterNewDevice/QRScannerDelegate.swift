//
//  QRScannerDelegate.swift
//  ICleanMedX
//
//  Created by Alan Kim on 3/21/26.
//

import AVFoundation

class QRScannerDelegate: NSObject, ObservableObject, AVCaptureMetadataOutputObjectsDelegate {
    @Published var scannedCode: String?
    
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        guard let first = metadataObjects.first as? AVMetadataMachineReadableCodeObject else { return }
        guard let code = first.stringValue else { return }
        scannedCode = code
    }
}
