//
//  HomeViewModel.swift
//  WeatherSwiftUI
//
//  Created by Zoltán Hidegkuti on 2022. 09. 07..
//

import Foundation
import Combine
import SwiftUI

class HomeViewModel: ObservableObject {
    @Environment(\.managedObjectContext) var moc
    
    // MARK: View model outputs
    @Published public var searchText: String = ""
    @Published public var dailyWeatherForecast: WeatherForecast? = nil
    @Published public var hourlyWeatherForecast: [WeatherForecastDetail]? = []
    @Published public var citiesList: [String] = ["Budapest", "London", "Paris"]
    @Published public var currentWeatherData: WeatherDetail? = nil
    @Published public var savedWeatherData: WeatherData? = nil
    @Published public var emptySavedWeatherData: WeatherData? = nil
    
    // MARK: Private methods
    private var cancellables = Set<AnyCancellable>()
    private let weatherDataService = WeatherDataService.shared
    private let dailyForecastService = DailyWeatherForecastService.shared
    
    // MARK: Init
    init() {
        addSubscribers()
    }
    
    
    // MARK: Private methods
    private func addSubscribers() {

        weatherDataService.$weatherData
            .sink { [weak self] (returnedWeather) in
                self?.currentWeatherData = returnedWeather
            }
            .store(in: &cancellables)
        
        dailyForecastService.$weatherForecastData
            .sink { [weak self] (returnedWeather) in
                
                self?.dailyWeatherForecast = returnedWeather
            }
            .store(in: &cancellables)
        
        dailyForecastService.$weatherForecastData
            .sink { [weak self] (returnedWeather) in
                
                self?.hourlyWeatherForecast = returnedWeather?.dailyList
            }
            .store(in: &cancellables)
    }
}
