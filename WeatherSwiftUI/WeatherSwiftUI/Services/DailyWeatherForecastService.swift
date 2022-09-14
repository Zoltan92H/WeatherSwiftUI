//
//  DailyWeatherForecastService.swift
//  WeatherSwiftUI
//
//  Created by Zoltán Hidegkuti on 2022. 09. 09..
//

import Foundation
import Combine

// MARK: - Weather data service
class DailyWeatherForecastService {
    
    static let shared = DailyWeatherForecastService(configuration: DependencyManager.shared.apiConfiguration)
    
    // MARK: Public properties
    @Published var searchedCity = "Budapest" {
        didSet {
            getWeather(endpoint: .forecast, city: searchedCity)
        }
    }
    @Published public var weatherForecastData: WeatherForecast? = nil
    
    // MARK: Private properties
    private let configuration: API.Configuration
    private var weatherSubscription: AnyCancellable?
    private let decoder = JSONDecoder()
   
    // MARK: Init
    public init(configuration: API.Configuration) {
        self.configuration = configuration
        getWeather(endpoint: API.Endpoint.forecast, city: searchedCity)
    }
    
    // MARK: Public methods
    public func getWeather(endpoint: API.Endpoint, city: String) {
        let request = API.request(for: endpoint, param: "q=\(city)", configuration: configuration)
        
        weatherSubscription = API.fetch(request: request)
            .decode(type: WeatherForecast.self, decoder: JSONDecoder())
            .sink(receiveCompletion: API.handleCompletion, receiveValue: { [weak self] (returnedWeather) in
                self?.weatherForecastData = returnedWeather
                self?.weatherSubscription?.cancel()
            })
        
    }
}
