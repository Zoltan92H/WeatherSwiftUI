//
//  NetworkingManager.swift
//  WeatherSwiftUI
//
//  Created by Zoltán Hidegkuti on 2022. 09. 08..
//

import Foundation
import Combine

public enum API {
    // MARK: Data structures
    public struct Configuration {
        public let baseURL: String
        public let apiKey: String
    }

    public enum APIError: Error {
            case badURLResponse(request: URLRequest)
            case unknown
            
        case noResponse
        case jsonDecodingError(error: Error)
        case networkError(error: Error)
        public var errorDescription: String? {
            switch self {
            case .badURLResponse(request: let request): return "[🔥] Bad response from URL: \(request)"
            case .noResponse: return "[🔥] No response"
            case .jsonDecodingError(error: let error): return "[🔥] JSON decoding error \(error)"
            case .networkError(error: let error): return "[🔥] Network error \(error)"
            case .unknown: return "[⚠️] Unknown error occured"
            }
        }

    }

    public enum Endpoint {
        case forecast
        case weather
        
        public func path() -> String {
            switch self {
            case .forecast:
                return "forecast"
            case .weather:
                return "weather"
            }
        }
    }

    // MARK: Public interface
    public static func request(for endpoint: Endpoint, param: String, configuration: Configuration) -> URLRequest {
        return URLRequest(url: URL(string: "\(configuration.baseURL)/\(endpoint)?\(param)&APPID=\(configuration.apiKey)&units=metric")!)
    }

    public static func fetch(request: URLRequest) -> AnyPublisher<Data, Error> {
        return URLSession.shared.dataTaskPublisher(for: request)
            .subscribe(on: DispatchQueue.global(qos: .default))
            .tryMap({ try handleURLResponse(output: $0, request: request) })
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    // MARK: Helper static methods
    public static func handleURLResponse(output: URLSession.DataTaskPublisher.Output, request: URLRequest) throws -> Data {
        guard let response = output.response as? HTTPURLResponse,
              response.statusCode >= 200 && response.statusCode < 300 else {
            throw APIError.badURLResponse(request: request)
        }
        return output.data
    }
    
    public static func handleCompletion(completion: Subscribers.Completion<Error>) {
        switch completion {
        case .finished:
            break
        case .failure(let error):
            print(error.localizedDescription)
        }
    }
}
