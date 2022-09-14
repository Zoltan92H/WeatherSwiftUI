//
//  WeatherForecast.swift
//  WeatherSwiftUI
//
//  Created by Zoltán Hidegkuti on 2022. 09. 07..
//

import Foundation

struct WeatherForecast: Codable, Identifiable {
    
    let id = UUID()
    
    var list: [WeatherForecastDetail]?
    
    var dailyList: [WeatherForecastDetail] {
        var result: [WeatherForecastDetail] = []
        guard var before = list?.first else {
            return result
        }
        
        if before.dt.dateFromMilliseconds().dayOfTheWeek != Date().dayOfTheWeek {
            result.append(before)
        }

        for weather in list ?? [] {
            if weather.dt.dateFromMilliseconds().dayOfTheWeek != before.dt.dateFromMilliseconds().dayOfTheWeek {
                result.append(weather)
            }
            before = weather
        }

        return result
    }
}
