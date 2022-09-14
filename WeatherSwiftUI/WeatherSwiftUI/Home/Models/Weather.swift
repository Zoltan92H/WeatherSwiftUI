//
//  Weather.swift
//  WeatherSwiftUI
//
//  Created by Zoltán Hidegkuti on 2022. 09. 07..
//

import Foundation

struct Weather: Codable, Identifiable {
    
    let id: Int
    let main: String
    let description: String
    let icon: String
}
