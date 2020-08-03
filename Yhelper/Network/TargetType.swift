//
//  TargetType.swift
//  Yhelper
//
//  Created by Kaleb Riley on 8/3/20.
//  Copyright © 2020 tyko9. All rights reserved.
//

import Foundation
import Alamofire

protocol TargetType {
    var baseURL: String { get }
    var route: String { get }
    var method: HTTPMethod { get }
    var params: Parameters { get }
}

extension TargetType {
    var key: String {
        return "aN1ZinaTXxCBjrn04N_fqb93eWtSnRc0qJMYy95pW1QXupxhvtRohix8aG5H1kur43eg1Emy4TofeCSufOIkPoeW-Q9skd8bMk5Mhi1mPaGoP3s-vCDFzAgVOo0lX3Yx"
    }
    
    var headers: HTTPHeaders {
        return ["Authorization": "Bearer \(key)"]
    }
    
    func endpoint() -> String {
        return baseURL + route
    }
}
