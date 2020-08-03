//
//  BusinessViewModel.swift
//  Yhelper
//
//  Created by Kaleb Riley on 8/2/20.
//  Copyright © 2020 tyko9. All rights reserved.
//

import Foundation

class BusinessViewModel {
    let name: String
    let rating: Double
    let address: String
    let categories: [String]
    let displayCategories: String
    let isClosedDisplay: String
    let isClosed: Bool
    let photos: [String]?
    let displayImageURL: String
    let coordinate: BussinessCoordinates
    let displayDistance: String
    
    init(business: Business, photos: [String]?) {
        self.name = business.name
        self.rating = business.rating
        self.isClosed = business.is_closed
        self.isClosedDisplay = business.is_closed ? "CLOSED" : "OPEN"
        self.address = business.location.display_address.joined(separator: " ")
        self.categories = business.categories.compactMap { $0.title }
        self.displayCategories = categories.joined(separator: ", ")
        self.photos = photos
        self.displayImageURL = business.image_url
        self.coordinate = business.coordinates
        self.displayDistance = String(String( (business.distance / 1000.0) / 0.621371).prefix(3)).appending("mi")
    }
}
