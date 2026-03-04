//
//  ContentView.swift
//  ICleanMedX app
//
//  Created by Alan Kim on 2/19/26.
//

import SwiftUI
import FirebaseFirestore

struct ContentView: View {
    @State private var usages = 67
    
    var body: some View {
        ZStack {
            Color(.black).ignoresSafeArea()
            
            Text("Usages: \(usages)")
                .font(.largeTitle)
                .bold()
                .foregroundColor(.white) // font
        }
        .onAppear {
            let db = Firestore.firestore()
            db.collection("stethoscopes").document("STETH-001").getDocument { doc, err in
                if let data = doc?.data() {
                    usages = data["Total Usages"] as? Int ?? 0
                    // look into total and if it canot be cast to int set value to 0
                }
            }
        }
    }
}
