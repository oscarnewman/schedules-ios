//
//  Article.swift
//  Schedules2
//
//  Created by Oscar Newman on 8/17/16.
//  Copyright © 2016 Oscar Newman. All rights reserved.
//

import Mapper

struct Article: Mappable {
    
    let title: String
    let body: String
    let author: String
    let category: String
    let date: NSDate
    
    init(map: Mapper) throws {
        try title = map.from("title")
        try body = map.from("body")
        try author = map.from("author")
        try category = map.from("category")
        try date = map.from("created_at")
        
    }
}