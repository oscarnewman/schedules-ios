//
//  Time+Comparable.swift
//  Schedules2
//
//  Created by Oscar Newman on 8/18/16.
//  Copyright © 2016 Oscar Newman. All rights reserved.
//

import Foundation

extension Time: Comparable {}

func ==(lhs: Time, rhs: Time) -> Bool {
    return lhs.hour == rhs.hour && lhs.minute == rhs.minute
}

func <(lhs: Time, rhs: Time) -> Bool {
    if lhs.hour == rhs.hour {
        return lhs.minute < rhs.minute
    } else {
        return lhs.hour < rhs.hour
    }
}

func <=(lhs: Time, rhs: Time) -> Bool {
    if lhs.hour == rhs.hour {
        return lhs.minute <= rhs.minute
    } else {
        return lhs.hour <= rhs.hour
    }
}

func >=(lhs: Time, rhs: Time) -> Bool {
    if lhs.hour == rhs.hour {
        return lhs.minute >= rhs.minute
    } else {
        return lhs.hour >= rhs.hour
    }
}

func >(lhs: Time, rhs: Time) -> Bool {
    if lhs.hour == rhs.hour {
        return lhs.minute > rhs.minute
    } else {
        return lhs.hour > rhs.hour
    }
}
