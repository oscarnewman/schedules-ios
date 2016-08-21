//
//  DevicesEndpoint.swift
//  Schedules2
//
//  Created by Oscar Newman on 8/17/16.
//  Copyright © 2016 Oscar Newman. All rights reserved.
//

import Foundation
import Moya

enum Devices {
    case Store(token: String, name: String)
}

extension Devices: TargetType {
    var baseURL: NSURL { return NSURL(string: "https://schedules.lasa2017.com/api")! }
    
    var path: String {
        switch self {
        case .Store(_,_):
            return "/devices"
        }
    }
    
    var parameters: [String: AnyObject]? {
        switch self {
        case .Store(let token, let name):
            return [
                "token": token,
                "name": name
            ]
        }
    }

    
    var method: Moya.Method { return .POST }
    var multipartBody: [MultipartFormData]? { return nil }
    
    var sampleData: NSData {
        switch self {
        case .Store:
            return "{\"token\":\"xxxxxxxxx\",}".dataUsingEncoding(NSUTF8StringEncoding)!
        }
    }
}