//
//  PhotoGroup.swift
//  MoyaAndRxSwift
//
//  Created by iDeveloper2 on 21/04/18.
//  Copyright © 2018 iDeveloper2. All rights reserved.
//

import Foundation
import Mapper

struct PhotoGroup: Mappable {
    
    let items:[PhotoItem]
    
    init(map: Mapper) throws {
        items = try map.from("items")
    }
}
