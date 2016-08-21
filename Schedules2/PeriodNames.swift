//
//  PeriodNames.swift
//  Schedules2
//
//  Created by Oscar Newman on 8/18/16.
//  Copyright © 2016 Oscar Newman. All rights reserved.
//

import Foundation


enum PeriodType {
    case First
    case Second
    case Third
    case Fourth
    case FIT
    case Lunch
    case Forum
    case PepRally
    case Passing
    
    func name(day: Day) -> String {
        
        if self == .FIT {
            return "FIT"
        } else if self == .Lunch {
            return "Lunch"
        } else if self == .Forum {
            return "Forum"
        } else if self == .PepRally {
            return "Pep Rally"
        } else if self == .Passing {
            return "Passing"
        }
        
        // Day Dependent
        if day == .A {
            // A Day
            switch self {
            case .First:
                return "0A"
            case .Second:
                return "A1"
            case .Third:
                return "A2"
            case .Fourth:
                return "A3"
            default:
                return "0A"
            }
            
        } else if day == .B {
            // B Day
            switch self {
            case .First:
                return "0B"
            case .Second:
                return "B5"
            case .Third:
                return "B6"
            case .Fourth:
                return "B7"
            default:
                return "0B"
            }
        } else  {
            // Either Day
            switch self {
            case .First:
                return "0A/0B"
            case .Second:
                return "1/5"
            case .Third:
                return "2/6"
            case .Fourth:
                return "3/7"
            default:
                return "0A/0B"
            }
        }
        
    }
}