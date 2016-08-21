//
//  Stylesheet.swift
//  Schedules2
//
//  Created by Oscar Newman on 8/18/16.
//  Copyright © 2016 Oscar Newman. All rights reserved.
//

import UIKit

struct Stylesheet {
    
    static let primaryColor = UIColor(red:0.612, green:0.153, blue:0.686, alpha:1.000)
    
    enum Category {
        case News
        case Announcement
        
        var color: UIColor {
            switch self {
            case .News:
                return UIColor(red:0.012, green:0.663, blue:0.957, alpha:1.000)
            case .Announcement:
                return UIColor(red:0.761, green:0.094, blue:0.357, alpha:1.000)
            }
        }
    }
    
}
