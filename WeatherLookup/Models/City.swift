//
//  City.swift
//  WeatherLookup
//
//  Created by Alexander Smyshlaev on 15/07/2019.
//  Copyright © 2019 Alexander Smyshlaev. All rights reserved.
//

import Foundation

enum City {
    static func nameForCity(withIdentifier identifier: String) -> String {
        let name: String
        switch identifier {
        case "Krasnoyarsk,ru":
            name = "Krasnoyarsk"
        case "Moscow,ru":
            name = "Moscow"
        case "Saint+Petersburg,ru":
            name = "Saint Petersburg"
        case "Novosibirsk,ru":
            name = "Novosibirsk"
        default:
            fatalError("City with non existant identifier")
        }
        
        return name
    }
    
    static let allCities = [
        "Krasnoyarsk,ru",
        "Moscow,ru",
        "Saint+Petersburg,ru",
        "Novosibirsk,ru"
    ]
}
