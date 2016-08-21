//
//  ArticlesEndpoint.swift
//  Schedules2
//
//  Created by Oscar Newman on 8/17/16.
//  Copyright © 2016 Oscar Newman. All rights reserved.
//

import Foundation
import Moya

enum Articles {
    case Index
}

extension Articles: TargetType {
    var baseURL: NSURL { return NSURL(string: "https://schedules.lasa2017.com/api")! }
    
    var path: String {
        switch self {
        case .Index:
            return "/articles"
        }
    }
    
    var method: Moya.Method { return .GET }
    var parameters: [String: AnyObject]? { return nil }
    var multipartBody: [MultipartFormData]? { return nil }
    
    var sampleData: NSData {
        switch self {
        case .Index:
            return "{\n   \"total\": 2,\n   \"per_page\": 10,\n   \"current_page\": 1,\n   \"last_page\": 4,\n   \"next_page_url\": \"http://api.schedules.lasa2017.com/articles?page=2\",\n   \"prev_page_url\": null,\n   \"from\": 1,\n   \"to\": 15,\n   \"data\":[\n        {\n            \"title\": \"Students Violently Overthrow Administration\"\n            \"author\": \"Oscar Newman\"\n            \"body\": \"This is the body. It should really be longer, but it isn't.\"\n            \"date\": \"2016-08-12 18:19:27\"\n        },\n        {\n            \"title\": \"You Wont Believe What the District Did This Time\"\n            \"author\": \"Quinn Simpson\"\n            \"body\": \"This is an entirely different body.\"\n            \"date\": \"2016-08-12 18:19:27\"\n        }\n   ]\n}".dataUsingEncoding(NSUTF8StringEncoding)!
        }
    }
}