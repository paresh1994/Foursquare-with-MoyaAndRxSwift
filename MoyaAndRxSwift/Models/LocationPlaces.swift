//
//  LocationPlaces.swift
//  MoyaAndRxSwift
//
//  Created by iDeveloper2 on 21/04/18.
//  Copyright © 2018 iDeveloper2. All rights reserved.
//

import Foundation
import Mapper

class LocationPlaces: Mappable {
    let place:[Place]
    let headerFullLocation:String
    
    required init(map: Mapper) throws {
        let groups:[Group] = try map.from("groups")
        place = groups.first?.items ?? []
        
        try headerFullLocation = map.from("headerFullLocation")
    }
    
    init() {
        place = []
        headerFullLocation = ""
    }
}

extension LocationPlaces: Equatable {
    static func ==(lhs: LocationPlaces, rhs: LocationPlaces) -> Bool {
        return lhs.place == rhs.place &&
        lhs.headerFullLocation == rhs.headerFullLocation
    }
}
