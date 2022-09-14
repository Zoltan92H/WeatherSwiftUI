//
//  WeatherDataService.swift
//  WeatherSwiftUI
//
//  Created by Zoltán Hidegkuti on 2022. 09. 08..
//

import Foundation
import Combine

// MARK: - Weather data service
class WeatherDataService {
        
    static let shared = WeatherDataService(configuration: DependencyManager.shared.apiConfiguration)
    
    // MARK: Public properties
    @Published var searchedCity = "Budapest" {
        didSet {
            getWeather(endpoint: .weather, city: searchedCity)
        }
    }
    @Published public var weatherData: WeatherDetail? = nil
    
    // MARK: Private properties
    private let configuration: API.Configuration
    private var weatherSubscription: AnyCancellable?
    private let decoder = JSONDecoder()
    
    // MARK: Init
    public init(configuration: API.Configuration) {
        self.configuration = configuration
        getWeather(endpoint: API.Endpoint.weather, city: searchedCity)
    }
    
    // MARK: Public methods
    public func getWeather(endpoint: API.Endpoint, city: String) {
        let request = API.request(for: endpoint, param: "q=\(city)", configuration: configuration)
        
        weatherSubscription = API.fetch(request: request)
            .decode(type: WeatherDetail.self, decoder: JSONDecoder())
            .sink(receiveCompletion: API.handleCompletion, receiveValue: { [weak self] (returnedWeather) in
                self?.weatherData = returnedWeather
                self?.weatherSubscription?.cancel()
            })
    }
}
