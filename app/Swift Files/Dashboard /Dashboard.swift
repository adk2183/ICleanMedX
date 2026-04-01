//
//  Dashboard.swift
//  ICleanMedX app
//
//  Created by Alan Kim on 2/20/26.
//

import SwiftUI
import AVFoundation

struct DashboardView: View {
    @State private var sessionActive = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                
                // Title
                Text("Device Dashboard")
                    .font(.largeTitle)
                    .bold()
                    .padding(.horizontal)
                
                // Top row - two cards side by side
                HStack(spacing: 12) {
                    
                    // Start/End Session Card
                    Button(action: {
                        sessionActive.toggle()
                    }) {
                        VStack(alignment: .leading, spacing: 8) {
                            Text(sessionActive ? "End Current Session" : "Start New Session")
                                .font(.headline)
                                .bold()
                            Text(sessionActive ? "Complete usage log and update status" : "Record Usage for Compliance Tracking")
                                .font(.caption)
                            Image(systemName: sessionActive ? "stop.circle" : "play.fill")
                                .font(.title).frame(width: 30, height: 30)
                        }
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity, minHeight: 160, alignment: .leading)
                        .background(sessionActive ? Color.red : Color.cyan)
                        .cornerRadius(16)
                    }
                    
                    // Daily Overview Card
                    Button(action: {
                        // navigate to daily overview
                    }) {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Daily Overview")
                                .font(.headline)
                                .bold()
                            Text("View today's usage at a glance")
                                .font(.caption)
                            Spacer()
                            Image(systemName: "chart.bar.fill")
                                .font(.title)
                        }
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity, minHeight: 160, alignment: .leading)
                        .background(Color.purple.opacity(0.7))
                        .cornerRadius(16)
                    }
                }
                .padding(.horizontal)
                
                // Cleaning Log Card
                NavigationLink(destination: CleaningLog()) {
                        HStack {
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Cleaning Log")
                                    .font(.headline)
                                    .bold()
                                Text("View Your Sanitation History")
                                    .font(.caption)
                            }
                            Spacer()
                            Image(systemName: "calendar")
                                .font(.largeTitle)
                        }
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity, minHeight: 100, alignment: .leading)
                        .background(Color.purple.opacity(0.6))
                        .cornerRadius(16)
                }
                .padding(.horizontal)
                
                // Register New Device Card
                NavigationLink(destination: ScannerView()) {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Register New Device")
                            .font(.headline)
                            .bold()
                        Text("Add a new device to your inventory")
                            .font(.caption)
                        Spacer()
                        Image(systemName: "plus.circle.fill")
                            .font(.title)
                    }
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity, minHeight: 120, alignment: .leading)
                    .background(Color.orange.opacity(0.6))
                    .cornerRadius(16)
                }
                .padding(.horizontal)
            }
            .padding(.top)
        }
    }
}

#Preview  {
    DashboardView()
}
