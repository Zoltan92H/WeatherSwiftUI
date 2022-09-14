//
//  WeatherDetail.swift
//  WeatherSwiftUI
//
//  Created by Zoltán Hidegkuti on 2022. 09. 07..
//

import Foundation

struct WeatherDetail: Codable, Identifiable {
    
    let id: Int
    
    let name: String
    let dt: TimeInterval
    var date: Date {
        return Date(timeIntervalSince1970: dt)
    }
    
    let base: String
    let visibility: Int?
    let clouds: Cloud
    
    struct Coordinates: Codable {
        let lon: Float
        let lat: Float
    }
    
    let coord: Coordinates
    let weather: [Weather]
    
    /*struct Main: Codable {
        
        let temp: Double
        let pressure: Float
        let humidity: Int
        let temp_min: Double
        let feels_like: Double
        
        let temp_max: Double
    }*/
    
    let main: Main
    
    struct Sys: Codable, Identifiable {
        let id: Int
        let type: Int?
        let message: Float?
        let country: String
        let sunrise: TimeInterval
        let sunset: TimeInterval
    }
    
    let sys: Sys
}

