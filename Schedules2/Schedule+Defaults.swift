//
//  Schedule+Defaults.swift
//  Schedules2
//
//  Created by Oscar Newman on 8/18/16.
//  Copyright © 2016 Oscar Newman. All rights reserved.
//

import Foundation

extension Schedule {
    
    static let normal = Schedule(name: "normal", periods: [
        Period(type: .First,    start: Time(hour: 08, minute: 10), end: Time(hour: 09, minute: 40)),
        Period(type: .Second,   start: Time(hour: 09, minute: 45), end: Time(hour: 11, minute: 20)),
        Period(type: .Lunch,    start: Time(hour: 11, minute: 20), end: Time(hour: 12, minute: 10)),
        Period(type: .Third,    start: Time(hour: 12, minute: 15), end: Time(hour: 13, minute: 45)),
        Period(type: .FIT,      start: Time(hour: 13, minute: 50), end: Time(hour: 14, minute: 15)),
        Period(type: .Fourth,   start: Time(hour: 14, minute: 20), end: Time(hour: 15, minute: 50)),

    ])
    
    static let forum = Schedule(name: "forum", periods: [
        Period(type: .First,    start: Time(hour: 08, minute: 10), end: Time(hour: 09, minute: 40)),
        Period(type: .Second,   start: Time(hour: 09, minute: 45), end: Time(hour: 11, minute: 20)),
        Period(type: .Lunch,    start: Time(hour: 11, minute: 20), end: Time(hour: 12, minute: 10)),
        Period(type: .Third,    start: Time(hour: 12, minute: 15), end: Time(hour: 13, minute: 45)),
        Period(type: .Forum,    start: Time(hour: 13, minute: 50), end: Time(hour: 14, minute: 15)),
        Period(type: .Fourth,   start: Time(hour: 14, minute: 20), end: Time(hour: 15, minute: 50))
        ])
    
    
    static let split = Schedule(name: "split", periods: [
        Period(type: .First,    start: Time(hour: 08, minute: 10), end: Time(hour: 08, minute: 55)),
        Period(type: .Second,   start: Time(hour: 09, minute: 00), end: Time(hour: 10, minute: 30)),
        Period(type: .First,    start: Time(hour: 10, minute: 35), end: Time(hour: 11, minute: 20)),
        Period(type: .Lunch,    start: Time(hour: 11, minute: 20), end: Time(hour: 12, minute: 10)),
        Period(type: .Third,    start: Time(hour: 12, minute: 15), end: Time(hour: 13, minute: 45)),
        Period(type: .FIT,      start: Time(hour: 13, minute: 50), end: Time(hour: 14, minute: 15)),
        Period(type: .Fourth,   start: Time(hour: 14, minute: 20), end: Time(hour: 15, minute: 50))
    ])
    
    static let lateStart = Schedule(name: "late start", periods: [
        Period(type: .Second,   start: Time(hour: 10, minute: 10), end: Time(hour: 11, minute: 25)),
        Period(type: .First,    start: Time(hour: 11, minute: 30), end: Time(hour: 12, minute: 40)),
        Period(type: .Lunch,    start: Time(hour: 12, minute: 40), end: Time(hour: 13, minute: 15)),
        Period(type: .Third,    start: Time(hour: 13, minute: 20), end: Time(hour: 14, minute: 30)),
        Period(type: .Fourth,   start: Time(hour: 14, minute: 35), end: Time(hour: 15, minute: 50))
    ])
    
    static let pepRally = Schedule(name: "pep rally", periods: [
        Period(type: .First,    start: Time(hour: 08, minute: 10), end: Time(hour: 09, minute: 35)),
        Period(type: .Second,   start: Time(hour: 09, minute: 40), end: Time(hour: 11, minute: 05)),
        Period(type: .PepRally, start: Time(hour: 11, minute: 05), end: Time(hour: 11, minute: 50)),
        Period(type: .Third,    start: Time(hour: 11, minute: 55), end: Time(hour: 13, minute: 20)),
        Period(type: .Lunch,    start: Time(hour: 13, minute: 20), end: Time(hour: 14, minute: 20)),
        Period(type: .Fourth,   start: Time(hour: 14, minute: 25), end: Time(hour: 15, minute: 50))
    ])
    

    
}