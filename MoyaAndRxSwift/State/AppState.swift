//
//  AppState.swift
//  MoyaAndRxSwift
//
//  Created by iDeveloper2 on 24/04/18.
//  Copyright © 2018 iDeveloper2. All rights reserved.
//

import Foundation
import ReSwift

enum Result {
    case loading
    case failed
    case finished(LocationPlaces)
}

extension Result: Equatable {
    static func ==(lhs: Result, rhs: Result) -> Bool {
        switch (lhs, rhs) {
        case (.loading, .loading):
            return true
        case let (.finished(a), .finished(b)):
            return a == b
        case (.failed, .failed):
            return true
        default:
            return false
        }
    }
}

struct FetchedPlacesState: StateType {
    var places: Result = .loading
}

extension FetchedPlacesState: Equatable {
    static func ==(lhs: FetchedPlacesState, rhs: FetchedPlacesState) -> Bool {
        return lhs.places == rhs.places
    }
}
