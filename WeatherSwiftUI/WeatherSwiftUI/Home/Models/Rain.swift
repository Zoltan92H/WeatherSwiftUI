//
//  Rain.swift
//  WeatherSwiftUI
//
//  Created by Zoltán Hidegkuti on 2022. 09. 07..
//

import Foundation

class Rain: Codable {
    
    let probability: Float
    
    enum CodingKeys: String, CodingKey {
        case probability = "1h"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.probability = try container.decodeIfPresent(Float.self, forKey: .probability) ?? 0.0
    }
    
}
