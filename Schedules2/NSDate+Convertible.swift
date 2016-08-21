//
//  NSDate+Convertible.swift
//  Schedules2
//
//  Created by Oscar Newman on 8/17/16.
//  Copyright © 2016 Oscar Newman. All rights reserved.
//

import Foundation
import Mapper

extension NSDate: Convertible {
    
    public static func fromMap(value: AnyObject?) throws -> NSDate {
        guard let dateString = value as? String else {
            throw MapperError.ConvertibleError(value: value, type: String.self)
        }
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        guard let date = dateFormatter.dateFromString(dateString) else {
            throw MapperError.ConvertibleError(value: dateString, type: NSDate.self)
        }
        
        return date
    }
    
}
