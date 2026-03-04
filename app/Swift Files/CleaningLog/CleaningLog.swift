//
//  Calendar.swift
//  ICleanMedX app
//
//  Created by Alan Kim on 2/25/26.
//

import SwiftUI

// will later create a swift file that retrieves from firebase

func createDataSet() -> [String: Int] {
    var data: [String: Int] = [:]
    for i in 1 ... 31 {
        // transform i into a string
        // make sure to pad out the left side
        // if there is extra space.
        let date = String(format: "2026-03-%02d" , i)
        data[date] = i - 1
    }
    return data
}

struct CleaningLog: View {
    @State private var selectedDate = Date()
    @State private var calendarLogic = CalendarLogic()
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text("Cleaning Log")
                    .font(.largeTitle)
                    .bold()
                    .padding(.horizontal)
                            
                let columns = Array(repeating: GridItem(.fixed(44), spacing: 8), count: 7)

                LazyVGrid(columns: columns, spacing: 8) {
                    
                    let data = createDataSet()
                    let weekdays = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
                    let paddingDays = calendarLogic.getFirstWeekday() - 1
                    let totalDays = paddingDays + calendarLogic.daysInMonth()
                    
                    ForEach(weekdays, id: \.self) { day in
                        Text(day)
                            .font(.system(size: 13, weight: .bold))
                            .foregroundColor(.gray)
                            .frame(height: 30)
                    }
                    
                    ForEach(0..<totalDays, id: \.self) { index in
                        if index < paddingDays {
                            Color.clear.frame(width: 40, height: 40)
                        } else {
                            let day = index - paddingDays + 1
                            let dateString = String(format: "2026-03-%02d", day)
                            DayCell(day: day, usageCount: data[dateString] ?? 0)
                        }
                    }
                }
            }
        }
        .padding(.top)
    }
}



#Preview  {
    CleaningLog()
}
