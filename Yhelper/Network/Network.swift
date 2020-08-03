//
//  Network.swift
//  Yhelper
//
//  Created by Kaleb Riley on 8/1/20.
//  Copyright © 2020 tyko9. All rights reserved.
//

import Alamofire
import Foundation

struct Network {
    static let shared = Network()
    
    func request<T: Decodable>(target: TargetType, completion: @escaping (Result<T, Error>) -> Void) {
        AF.request( target.endpoint(), method: target.method, parameters: target.params, headers: target.headers)
            .responseDecodable(of: T.self) { response in
                debugPrint(response)
                
                switch response.result {
                case .success(let object):
                    completion(.success(object))
                case .failure(let error):
                    completion(.failure(error))
                }
        }
    }
    
    func request(target: TargetType, completion: (Result<String, Error>) -> Void) {
        AF.request( target.endpoint(), method: target.method, parameters: target.params, headers: target.headers)
            .responseJSON { resonse in
                debugPrint(resonse)
        }
    }
}

