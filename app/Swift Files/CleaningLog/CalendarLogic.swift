//
//  CalendarLogic.swift
//  ICleanMedX app
//
//  Created by Alan Kim on 2/25/26.
//


import Foundation

struct CalendarLogic {
    
    func getFirstWeekday() -> Int { //returns number from 1 - 7 (1 = Sunday, 7 = Saturday)
        let today = Date()
        let year = Calendar.current.component(.year, from: today)
        let month = Calendar.current.component(.month, from: today)
        let firstDayOfMonth = Calendar.current.date(from: DateComponents(year: year, month: month, day: 1))!
        let weekday = Calendar.current.component(.weekday, from: firstDayOfMonth) // give me number
        return weekday
    }
    
    func daysInMonth() -> Int {
        let today = Date()
        let range = Calendar.current.range(of: .day, in: .month, for: today)!
        return range.count
    }
    
}
