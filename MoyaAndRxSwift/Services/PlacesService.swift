//
//  PlacesService.swift
//  MoyaAndRxSwift
//
//  Created by iDeveloper2 on 21/04/18.
//  Copyright © 2018 iDeveloper2. All rights reserved.
//

import Foundation
import RxSwift
import Moya
import Moya_ModelMapper

protocol PlacesDatasource {
    func placesAround(latitude:Double, longitude:Double) -> Observable<LocationPlaces>
}

struct PlacesService: PlacesDatasource {
    
    private var provider: MoyaProvider<PlacesApi>
    
    init(provider: MoyaProvider<PlacesApi>) {
        self.provider = provider
    }
    
    func placesAround(latitude: Double, longitude: Double) -> Observable<LocationPlaces> {
        return self.provider.rx.request(.recommended(latitude: latitude, longitude: longitude))
        .map(to: LocationPlaces.self, keyPath: "response")
        .asObservable()
    }
}
