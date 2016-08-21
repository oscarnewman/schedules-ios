//
//  Time.swift
//  Schedules2
//
//  Created by Oscar Newman on 8/18/16.
//  Copyright © 2016 Oscar Newman. All rights reserved.
//

import Foundation

struct Time {
    
    var hour: Int
    var minute: Int
    
    var string: String {
        let formattedMinute = String(format: "%02d", minute)
        if hour == 12 {
            return "\(hour):\(formattedMinute)pm"
        } else if hour == 0 {
            return "12:\(formattedMinute)am"
        } else {
            var ampm = "am"
            if hour >= 12 { ampm = "pm" }
            
            return "\(hour%12):\(formattedMinute)\(ampm)"
        }
    }
    
    func isIn(period: Period) -> Bool {
        return self >= period.start && self < period.end
    }
    
    func timeUntil(time: Time) -> Int {
        let now = hour * 60 + minute
        let then = time.hour * 60 + time.minute
        
        let difference = then - now
        if difference < 0 { return 0 }
        
        return difference
    }
    
    static func current() -> Time{
        let date = NSDate()
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components([.Hour, .Minute], fromDate: date)
        let time = Time(hour: components.hour, minute: components.minute)
        
        return time
    }
    
}

