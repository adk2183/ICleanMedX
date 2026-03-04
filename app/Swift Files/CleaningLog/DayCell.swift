//
//  DayCell.swift
//  ICleanMedX app
//
//  Created by Alan Kim on 2/25/26.
//  How the cells would look.

import SwiftUI
struct DayCell: View {
    var day: Int
    var usageCount: Int
    
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
                    .fill(
                        usageCount > 0
                            ? Color.blue.opacity(0.15 + intensity * 0.7)
                            : Color.gray.opacity(0.1)
                    )
            )
    }
}

#Preview  {
    VStack {
        let columns = Array(repeating: GridItem(.flexible()), count: 7)
        
        let weekdays = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]

        LazyVGrid(columns: columns, spacing: 8) {
            
            ForEach(weekdays, id: \.self) { day in
                Text(day)
                    .font(.system(size: 13, weight: .bold))
                    .foregroundColor(.gray)
                    .frame(height: 30)
            }
        
            ForEach(1...30, id: \.self) { day in
                DayCell(day: day, usageCount: day)
            }
        }
        .padding()
    }
}
