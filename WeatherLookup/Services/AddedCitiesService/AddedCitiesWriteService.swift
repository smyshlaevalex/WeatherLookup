//
//  AddedCitiesWriteService.swift
//  WeatherLookup
//
//  Created by Alexander Smyshlaev on 16/07/2019.
//  Copyright © 2019 Alexander Smyshlaev. All rights reserved.
//

import Foundation

protocol AddedCitiesWriteService {
    func addCity(_ city: String)
    func removeCity(_ city: AddedCity)
    func updateCities()
}
