//
//  MainViewModel.swift
//  Yhelper
//
//  Created by Kaleb Riley on 8/2/20.
//  Copyright © 2020 tyko9. All rights reserved.
//

import Foundation

class MainViewModel {
    var businesses: [BusinessViewModel] = []
    
    init(response: BusinessResponse) {
        
        businesses = response.businesses.compactMap { BusinessViewModel(business: $0, photos: nil)}
        
        // NOTE: Theres an API limit on fetching single businesses so I will load the default business image instead of the photos associated with the business.
        
//        for business in response.businesses {
//            Network.shared.request(target: BusinessTarget.by(id: business.id)) { (result: Result<SingleBusiness, Error>) in
//                switch result {
//                case .success(let singleBusiness):
//                    self.businesses.append(BusinessViewModel(business: business, photos: singleBusiness.photos))
//                case .failure(_):
//                    // NOTE: There's a limit on how many times you can call this api so the default failure will also append the business
//                    self.businesses.append(BusinessViewModel(business: business, photos: nil))
//                }
//            }
//        }
    }
}
