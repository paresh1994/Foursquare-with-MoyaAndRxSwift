//
//  Injector.swift
//  MoyaAndRxSwift
//
//  Created by iDeveloper2 on 24/04/18.
//  Copyright © 2018 iDeveloper2. All rights reserved.
//

import Foundation
import ReSwift
import Moya
import Moya_ModelMapper
import Swinject
import CoreLocation

struct Injector {

    private let container: Container = Container()
    
    init() {
        setup()
    }
    
    func resolve<Service>(_ serviceType: Service.Type) -> Service? {
        return container.resolve(serviceType)
    }
    
    private func setup() {
        setupControllers()
        setupLocationDependencies()
        setupProvider()
        setupNearbyPlacesService()
        setupReducer()
    }
    
    fileprivate func setupControllers() {
        container.register(PlacesViewController.self) { _ in
            return PlacesViewController(nibName: "PlacesViewController", bundle: nil)
        }
    }
    
    fileprivate func setupLocationDependencies() {
        container.register(LocationManager.self) { _ in
            CLLocationManager()
        }
        container.register(UserLocationDatasource.self) { resolve in
            UserLocationService.init(locationManager: resolve.resolve(LocationManager.self)!)
        }
    }
    
    fileprivate func setupProvider() {
        container.register(MoyaProvider<PlacesApi>.self) { _ in
            MoyaProvider<PlacesApi>()
        }
    }
    
    fileprivate func setupNearbyPlacesService() {
        container.register(PlacesDatasource.self) {resolver in
            PlacesService.init(provider: resolver.resolve(MoyaProvider<PlacesApi>.self)!)
        }
        
        container.register(NearbyPlacesService.self) { resolver in
            NearbyPlacesService.init(placesDataSource: resolver.resolve(PlacesDatasource.self)!, userLocationDataSource: resolver.resolve(UserLocationDatasource.self)!)
        }
        
    }
    
    fileprivate func setupReducer() {
        container.register(AppReducer.self) { resolver in
            AppReducer.init(resolver.resolve(NearbyPlacesService.self)!)
        }
    }
}
