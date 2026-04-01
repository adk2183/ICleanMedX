//
//  DeviceDataManager.swift
//  ICleanMedX
//
//  Created by Alan Kim on 4/1/26.
//

import Foundation
import FirebaseFirestore
import SwiftUI

class DeviceDataManager: ObservableObject {
    @Published var dayColors: [String: Color] = [:]
    @Published var usageByDate: [String: Int] = [:]
    @Published var patientsMet: [String: Int] = [:]
    
    private let db = Firestore.firestore()
    
    func fetchData() {
        db.collection("stethoscopes").document("STETH-001").getDocument { snapshot, error in
            
            guard let data = snapshot?.data() // guard ensures data is not nil (equivalent to NULL) 
            else {
                print("there is an error accessing the database.")
                return
            }
                
            let usageByDate = data["Usage by Date"] as? [String: Int] ?? [:]
            let patientsMet = data["Patients Met"] as? [String: Int] ?? [:]
            
            print("usage By Date: \(usageByDate)")
            print("patients Met: \(patientsMet)")
            
            var colors: [String: Color] = [:]
            
            let allDates = Set(usageByDate.keys).union(patientsMet.keys)
            
            for date in allDates {
                let usage = usageByDate[date] ?? 0
                let patients = patientsMet[date] ?? 0
                
                if patients == 0 {
                    colors[date] = .gray
                } else if usage >= patients {
                    colors[date] = .green
                } else {
                    colors[date] = .red
                }
            }
            
            DispatchQueue.main.async { // try to understand the point of DispatchQueue.main.async
                // update while on the main thread
                self.dayColors = colors // triggers the @Published broadcast
                self.usageByDate = usageByDate
                self.patientsMet = patientsMet
            }
        }
    }
}
