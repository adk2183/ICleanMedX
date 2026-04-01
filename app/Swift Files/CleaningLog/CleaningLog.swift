//
//  Calendar.swift
//  ICleanMedX app
//
//  Created by Alan Kim on 2/25/26.
//

import SwiftUI

// will later create a swift file that retrieves from firebase

struct CleaningLog: View {
    @StateObject private var dataManager = DeviceDataManager()
    @State private var selectedDate = Date()
    @State private var calendarLogic = CalendarLogic()
    
    
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text("Cleaning Log")
                    .font(.largeTitle)
                    .bold()
                    .padding(.horizontal)
                
                Rectangle()
                    .fill(Color.black.opacity(0.3))
                    .frame(height: 1)
                    .padding(.horizontal)
                            
                let columns = Array(repeating: GridItem(.fixed(44), spacing: 8), count: 7)

                LazyVGrid(columns: columns, spacing: 8) {
                    
                    let weekdays = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
                    let paddingDays = calendarLogic.getFirstWeekday() - 1
                    let totalDays = paddingDays + calendarLogic.daysInMonth()
                    
                    // weekday row
                    ForEach(weekdays, id: \.self) { day in
                        Text(day)
                            .font(.system(size: 13, weight: .bold))
                            .foregroundColor(.gray)
                            .frame(height: 30)
                    }
                    

                    // retrieve current month & year
                    let month = Calendar.current.component(.month, from: Date())
                    let year = Calendar.current.component(.year, from: Date())
                    
                    ForEach(0..<totalDays, id: \.self) { index in
                        if index < paddingDays {
                            Color.clear.frame(width: 40, height: 40)
                        } else {
                            let day = index - paddingDays + 1
                            let dateString = String(format: "%04d-%02d-%02d", year, month, day)
                            
                            DayCell( // constructing DayCell will the appropriate vals.
                                day: day,
                                color: dataManager.dayColors[dateString] ?? .gray,
                                usageCount: dataManager.usageByDate[dateString] ?? 0,
                                patientsMet: dataManager.patientsMet[dateString] ?? 0
                            )
                        }
                    }
                }
                Rectangle()
                    .fill(Color.black.opacity(0.3))
                    .frame(height: 1)
                    .padding(.horizontal)
            }
        }
        .padding(.top)
        .onAppear {
            dataManager.seedTestData()
            dataManager.fetchData()
        }
    }
}


#Preview  {
    CleaningLog()
}
