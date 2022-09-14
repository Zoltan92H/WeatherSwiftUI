//
//  Clouds.swift
//  WeatherSwiftUI
//
//  Created by Zoltán Hidegkuti on 2022. 09. 07..
//

import Foundation

struct Cloud: Codable {

    let all: Int
    
    static func emptyInit() -> Cloud {
        return Cloud(all: 0)
    }
}

