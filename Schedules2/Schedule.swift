//
//  Schedule.swift
//  Schedules2
//
//  Created by Oscar Newman on 8/18/16.
//  Copyright © 2016 Oscar Newman. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

struct Schedule {
    
    var name: String
    var periods: [Period]
    
    func currentPeriod() -> Period? {
        
        guard isSchoolDay() else { return periods.first! }
        guard !isPassingPeriod() else { return currentPassingPeriod() }
        
        let time = Time.current()
        
        for period in periods {
            if time.isIn(period) {
                return period
            }
        }
        
        return nil
    }
    
    func nextPeriod() -> Period? {
        let time = Time.current()
        
        guard isSchoolDay() else { return nil }
        
        guard !isPassingPeriod() else {
            for period in periods {
                if time < period.start {
                    // return the first period that starts after the current time
                    return period
                }
            }
            return nil
        }
        
        for (index, period) in periods.enumerate() {
            if time.isIn(period) {
                if index + 1 >= periods.count { return nil }
                return periods[index + 1]
            }
        }
        
        return nil
    }
    
    func timeLeft() -> Int {
        guard isSchoolDay() else { return 0 }
        
        let time = Time.current()
        return time.timeUntil(currentPeriod()!.end)
    }
    
    
    internal func isPassingPeriod() -> Bool {
        let time = Time.current()
        
        guard periods.count > 0 else { return false }
        
        if isSchoolDay() {
            for period in periods {
                if time.isIn(period) {
                    // We're in a normal period
                    return false
                }
            }
            // Not in any period, but within the school day
            return true
        }
        
        // Outside the school day
        return false
    }
    
    internal func currentPassingPeriod() -> Period? {
        let time = Time.current()
        
        guard isPassingPeriod() else {
            return nil
        }
        
        // Dont iterate though last because there's no passing period after it
        for i in 0..<periods.count {
            let period = periods[i]
            let nextPeriod = periods[i + 1]
            
            if time >= period.end && time < nextPeriod.start {
                return Period(type: .Passing, start: period.end, end: nextPeriod.start)
            }
        }
        
        return nil
    }
    
    internal func isSchoolDay() -> Bool {
        let time = Time.current()
        guard periods.count > 0 else { return false }
        
        return time >= periods.first!.start && time < periods.last!.end
    }
    
}

// Static funcs
extension Schedule {
    
    static func current() -> Schedule? {
        let date = NSDate()
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components(.Weekday, fromDate: date)
        let weekday = components.weekday
        
        switch weekday {
        case 1: // Sunday
            return nil
        case 2: // Monday
            return Schedule.forum
        case 3: // Tuesday
            return Schedule.normal
        case 4: // Wednesday
            return Schedule.normal
        case 5: // Thursday
            return Schedule.normal
        case 6: // Friday
            return Schedule.normal
        case 7: // Saturday
            return Schedule.normal
        default:
            return nil
        }
    }
    
}

// Reactive
extension Schedule {
    static func getCurrent() -> Observable<Schedule?> {
        let schedule = Schedule.current()
        return Observable.create { observer in
            observer.on(.Next(schedule))
            observer.on(.Completed)
            
            return NopDisposable.instance
            
        }
    }
}
