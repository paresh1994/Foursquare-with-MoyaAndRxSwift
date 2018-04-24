//
//  UserLocationService.swift
//  MoyaAndRxSwift
//
//  Created by iDeveloper2 on 21/04/18.
//  Copyright © 2018 iDeveloper2. All rights reserved.
//

import CoreLocation
import RxSwift

protocol LocationManager {
    var delegate: CLLocationManagerDelegate? { get set }
    func requestWhenInUseAuthorization()
    func requestLocation()
}

extension CLLocationManager: LocationManager {}

protocol UserLocationDatasource {
    func getUserLocation() -> Observable<CLLocation>
}

class UserLocationService: NSObject, UserLocationDatasource {
    
    fileprivate var locationManager: LocationManager
    fileprivate var subject = PublishSubject<CLLocation>()
    
    init(locationManager: LocationManager) {
        self.locationManager = locationManager
        super.init()
        self.locationManager.delegate = self
    }
    
    func getUserLocation() -> Observable<CLLocation> {
        self.locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        return subject
    }
}

extension UserLocationService: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        subject.onNext(locations[0])
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        subject.onError(error)
    }
}
