//
//  PaginatedResponse.swift
//  Schedules2
//
//  Created by Oscar Newman on 8/17/16.
//  Copyright © 2016 Oscar Newman. All rights reserved.
//

import Mapper

struct Pagination<T: Mappable>: Mappable {
    
    var currentPage: Int
    var lastPage: Int
    var nextPageUrl: NSURL?
    var prevPageUrl: NSURL?
    var data: [T]
    
    init(map: Mapper) throws {
        try currentPage = map.from("current_page")
        try lastPage = map.from("last_page")
        nextPageUrl = map.optionalFrom("next_page_url")
        prevPageUrl = map.optionalFrom("prev_page_url")
        
        try data = map.from("data")
    }
    
}