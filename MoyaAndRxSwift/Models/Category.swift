//
//  Category.swift
//  MoyaAndRxSwift
//
//  Created by iDeveloper2 on 21/04/18.
//  Copyright © 2018 iDeveloper2. All rights reserved.
//

import Foundation
import Mapper

struct Category: Mappable {
    let name:String
    
    init(map: Mapper) throws {
        name = try map.from("name")
    }
}
