//
//  VenueAPIClient.swift
//  Unit5GroupProjectOne
//
//  Created by C4Q on 1/21/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit
import Alamofire
class VenueAPIClient {
    private init() {}
    static let manager = VenueAPIClient()
    private let keyAPI = "ZQSWSRCGU33XMP2KNS2BWUNUICV4JJQYQ2NJNUNRTT4SXEZT"
    func getVenues(withSearchTerm searchTerm: String,
                   lat latitude: Double,
                   lon longitude: Double,
                   completion: @escaping ([Venue]) -> Void,
                   errorHandler: @escaping (Error) -> Void) {
        let urlWeatherBase = "https://api.foursquare.com/v2/venues/search?"
        
        let params: [String: Any] = [
            "query": searchTerm,
            "ll": "\(latitude),\(longitude)",
            "oauth_token": keyAPI,
            "v": "20180118"
        ]
        
        Alamofire.request(urlWeatherBase, method: .get, parameters: params, encoding: URLEncoding.default, headers: nil).responseJSON{ response in
            
            switch response.result{
            case .success:
                if let data = response.data {
                    do {
                        let result = try JSONDecoder().decode(AllVenue.self, from: data)
                        completion(result.responseVenue.venues)
                    } catch let error {
                        print("Error decoding: \(error.localizedDescription)")
                        errorHandler(AppError.couldNotParseJSON(rawError: error))
                    }
                }
                
            // MARK: do whatever you want
            case .failure(let error):
                
                if let error = error as? URLError {
                    if error.code == URLError.notConnectedToInternet {
                        errorHandler(AppError.noInternetConnection)
                    }
                }
                
                errorHandler(AppError.other(rawError: error))
            }
        }
    }
}

