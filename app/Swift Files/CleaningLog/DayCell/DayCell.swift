//
//  DayCell.swift
//  ICleanMedX app
//
//  Created by Alan Kim on 2/25/26.
//  How the cells would look.

import SwiftUI
struct DayCell: View {
    var day: Int
    var color: Color
    var usageCount: Int
    var patientsMet: Int
    
    var intensity: Double {
        min(Double(usageCount) / 15.0, 1.0)
    }
    
    var body: some View {
        Text("\(day)")
            .font(.system(size: 16, weight: .bold))
            .foregroundColor(.white)
            .frame(width: 44, height: 44)
            .background(
                Circle()
                    .fill(color == .gray ? Color.gray : color.opacity(intensity))
            )
    }
}


