//
//  BusinessesTarget.swift
//  Yhelper
//
//  Created by Kaleb Riley on 8/3/20.
//  Copyright © 2020 tyko9. All rights reserved.
//

import Foundation
import Alamofire

enum BusinessTarget: TargetType {
    case by(id: String)
    case reviews(businessId: String)
    case search(term: String? = "", long: String, lat: String)
    
    var baseURL: String {
        return "https://api.yelp.com/v3"
    }
    
    var route: String {
        switch self {
        case .by(id: let id):
            return "/businesses/\(id)"
        case .reviews(businessId: let id):
            return "/businesses/\(id)/reviews"
        case .search(term: _, long: _, lat: _):
            return "/businesses/search"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .by(id: _):
            return .get
        case .reviews(businessId: _):
            return .get
        case .search(term: _, long: _, lat: _):
            return .get
        }
    }
    
    var params: Parameters {
        switch self {
        case .by(id: _):
            return [:]
        case .reviews(businessId: _):
            return [:]
        case .search(term: let term, long: let long, lat: let lat):
            return ["longitude": long, "latitude": lat, "term": term ?? ""]
        }
    }
    
    
}
