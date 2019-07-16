//
//  WeatherData.swift
//  WeatherLookup
//
//  Created by Alexander Smyshlaev on 15/07/2019.
//  Copyright © 2019 Alexander Smyshlaev. All rights reserved.
//

import Foundation

struct WeatherData {
    let temperature: Double
}

extension WeatherData: Decodable {
    enum CodingKeys: CodingKey {
        case main
    }
    
    enum MainCodingKeys: CodingKey {
        case temp
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let mainContainer = try container.nestedContainer(keyedBy: MainCodingKeys.self, forKey: .main)
        
        temperature = try mainContainer.decode(Double.self, forKey: .temp)
    }
}
