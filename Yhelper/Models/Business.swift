//
//  Business.swift
//  Yhelper
//
//  Created by Kaleb Riley on 8/2/20.
//  Copyright © 2020 tyko9. All rights reserved.
//

import Foundation
import CoreLocation

struct BusinessResponse: Codable {
    let businesses: [Business]
}

struct Business: Codable {
    let id: String
    let name: String
    let image_url: String
    let rating: Double
    let coordinates: BussinessCoordinates
    let is_closed: Bool
    let distance: Double
    let categories: [Category]
    let location: Address
}

struct BussinessCoordinates: Codable {
    let latitude: Double
    let longitude: Double
}

struct Category: Codable {
    let alias: String
    let title: String
}

struct Address: Codable {
    let display_address: [String]
}

struct SingleBusiness: Codable {
    let photos: [String]?
}
