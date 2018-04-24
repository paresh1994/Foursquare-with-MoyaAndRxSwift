//
//  PlaceTip.swift
//  MoyaAndRxSwift
//
//  Created by iDeveloper2 on 21/04/18.
//  Copyright © 2018 iDeveloper2. All rights reserved.
//

import Foundation
import Mapper

struct PlaceTip: Mappable {
    let text:String
    
    init(map: Mapper) throws {
        text = try map.from("text")
    }
}
