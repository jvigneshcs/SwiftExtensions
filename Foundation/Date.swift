//
//  Date.swift
//  Extensions
//
//  Created by Vignesh J on 2/14/19.
//  Copyright © 2019 VigneshJeyaraj. All rights reserved.
//

import Foundation

extension Date {
    
    var startOfWeek: Date? {
        let gregorian = Calendar(identifier: .gregorian)
        guard let sunday = gregorian.date(from: gregorian.dateComponents([.yearForWeekOfYear, .weekOfYear], from: self)) else { return nil }
        return gregorian.date(byAdding: .day, value: 1, to: sunday)
    }
    
    var endOfWeek: Date? {
        let gregorian = Calendar(identifier: .gregorian)
        guard let sunday = gregorian.date(from: gregorian.dateComponents([.yearForWeekOfYear, .weekOfYear], from: self)) else { return nil }
        return gregorian.date(byAdding: .day, value: 8, to: sunday)
    }
    
    func isBefore(_ date: Date) -> Bool {
        let timeInterval = date.timeIntervalSince(self)
        return timeInterval >= 0
    }
    
    func date(withTimeZoneAbbreviation abbreviation: String) -> Date? {
        if let timeZone = TimeZone(abbreviation: abbreviation) {
            return date(with: timeZone)
        }
        return nil
    }
    
    func date(with timeZone: TimeZone) -> Date? {
        if timeZone == TimeZone.current {
            return self
        }
        let seconds = timeZone.secondsFromGMT(for: self) - TimeZone.current.secondsFromGMT(for: self)
        return Date(timeInterval: TimeInterval(seconds), since: self)
    }
    
    func string(format: String, locale: Locale, dateFormatter: DateFormatter = DateFormatter(), timeZone: TimeZone = TimeZone.current) -> String {
        dateFormatter.locale = locale
        dateFormatter.dateFormat = format
        dateFormatter.timeZone = timeZone
        return string(with: dateFormatter)
    }
    
    func string(with dateFormatter: DateFormatter) -> String {
        return dateFormatter.string(from: self)
    }
    
    func year() -> Int {
        let calendar = Calendar.current
        return calendar.component(.year, from: self)
    }
    
    func month() -> Int {
        let calendar = Calendar.current
        return calendar.component(.month, from: self)
    }
    
    func adding(minutes: Int , datees : Date) -> Date {
        return Calendar.current.date(byAdding: .minute,value: minutes,to: datees)!
    }
}
