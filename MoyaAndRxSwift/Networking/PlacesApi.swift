//
//  PlacesApi.swift
//  MoyaAndRxSwift
//
//  Created by iDeveloper2 on 21/04/18.
//  Copyright © 2018 iDeveloper2. All rights reserved.
//

import Foundation
import Moya

enum PlacesApi {
    case recommended(latitude: Double, longitude: Double)
}

extension PlacesApi: TargetType {
    
    var baseURL: URL {
        return URL(string: "https://api.foursquare.com/v2")!
    }
    
    var path: String {
        switch self {
        case .recommended:
            return "/venues/explore"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .recommended:
            return .get
        }
    }
    
    var sampleData: Data {
        switch self {
        case .recommended:
            return stubbedResponse(fileName: "venues")
        }
    }
    
    var task: Task {
        switch self {
        case let .recommended(latitude, longitude):
            let parameters = requestParameters(latitude: latitude, longitude: longitude)
            return .requestParameters(parameters: parameters, encoding: URLEncoding.queryString)
        
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
    
    private func requestParameters(latitude:Double, longitude:Double) -> [String: Any] {
        return [
            "v": "20180424",
            "venuePhotos": 1,
            "limit": 10,
            "ll": String(format: "%f,%f", latitude, longitude),
            "client_id": ServicesConstant.foursquareClientId,
            "client_secret": ServicesConstant.foursquareClientSecret]
    }
    
    private func stubbedResponse(fileName:String) -> Data {
        let url = Bundle.main.url(forResource: fileName, withExtension: "json")
        return (try! Data(contentsOf: url!))
        
    }
}
