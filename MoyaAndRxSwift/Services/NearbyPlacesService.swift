//
//  NearbyPlacesService.swift
//  MoyaAndRxSwift
//
//  Created by iDeveloper2 on 24/04/18.
//  Copyright © 2018 iDeveloper2. All rights reserved.
//

import Foundation
import RxSwift
import CoreLocation
import Moya_ModelMapper
import Moya

struct NearbyPlacesService {

    private let placesDataSource: PlacesDatasource
    private let userLocationDataSource: UserLocationDatasource
    
    init(placesDataSource: PlacesDatasource, userLocationDataSource: UserLocationDatasource) {
        self.placesDataSource = placesDataSource
        self.userLocationDataSource = userLocationDataSource
    }
    
    func fetchNearbyPlaces() -> Observable<LocationPlaces> {
        return userLocationDataSource.getUserLocation()
            .flatMap({ (userLocation: CLLocation) ->
                Observable<LocationPlaces> in
                return self.placesDataSource.placesAround(latitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude)
                
            })
    }
}
