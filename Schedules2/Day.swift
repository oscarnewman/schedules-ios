//
//  Day.swift
//  Schedules2
//
//  Created by Oscar Newman on 8/18/16.
//  Copyright © 2016 Oscar Newman. All rights reserved.
//

import Foundation

enum Day: String {
    case A = "A"
    case B = "B"
    case Either = ""
    
    static func current() -> Day {
        let date = NSDate()
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components(.Weekday, fromDate: date)
        let weekday = components.weekday
        
        switch weekday {
        case 1: // Sunday
            return .Either
        case 2: // Monday
            return .A
        case 3: // Tuesday
            return .B
        case 4: // Wednesday
            return .A
        case 5: // Thursday
            return .B
        case 6: // Friday
            return .Either
        case 7: // Saturday
            return .A
        default:
            return .Either
        }

    }
}
