//
//  Groups.swift
//  MoyaAndRxSwift
//
//  Created by iDeveloper2 on 21/04/18.
//  Copyright © 2018 iDeveloper2. All rights reserved.
//

import Foundation
import Mapper

struct Group: Mappable {
    let items:[Place]
    
    init(map: Mapper) throws {
        try items = map.from("items")
    }
}
