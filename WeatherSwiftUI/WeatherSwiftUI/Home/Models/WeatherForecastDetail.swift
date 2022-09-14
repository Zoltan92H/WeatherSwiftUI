//
//  WeatherForecastDetail.swift
//  WeatherSwiftUI
//
//  Created by Zoltán Hidegkuti on 2022. 09. 07..
//

import Foundation

struct WeatherForecastDetail: Codable {
    
    let id = UUID()
    
    let dt: Int
    let dt_txt: String
    let clouds: Cloud
    let weather: [Weather]
    var rain: Rain?
    
    struct Main: Codable {
        let temp: Double
        var temp_min: Double
        var temp_max: Double
        let pressure: Float
        let sea_level: Float
        let grnd_level: Float
        let humidity: Int
        let temp_kf: Double
    }
    
    var main: Main
}

extension WeatherForecastDetail: Equatable {
    static func == (lhs: WeatherForecastDetail, rhs: WeatherForecastDetail) -> Bool {
        return Date(timeIntervalSince1970: TimeInterval(lhs.dt)).dayOfTheWeek == Date(timeIntervalSince1970: TimeInterval(rhs.dt)).dayOfTheWeek
    }
}
