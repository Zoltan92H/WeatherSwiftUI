//
//  WeatherMainValues.swift
//  WeatherSwiftUI
//
//  Created by Zoltán Hidegkuti on 2022. 09. 10..
//

import Foundation

struct Main: Codable {
    let temp, feelsLike: Double
    var tempMin, tempMax: Double
    let pressure, humidity: Int

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure
        case humidity
    }
    
    static func emptyInit() -> Main {
        return Main(
            temp: 0.0,
            feelsLike: 0.0,
            tempMin: 0,
            tempMax: 0.9,
            pressure: 0,
            humidity: 0
        )
    }
}

