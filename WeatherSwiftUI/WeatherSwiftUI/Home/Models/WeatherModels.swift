//
//  WeatherModels.swift
//  WeatherSwiftUI
//
//  Created by Zoltán Hidegkuti on 2022. 09. 07..
//

import Foundation

struct WeatherModels: Identifiable {
    let id = UUID()
    let weatherDetails: WeatherDetail
}
