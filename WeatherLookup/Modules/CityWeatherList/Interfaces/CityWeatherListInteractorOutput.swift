//
//  CityWeatherListInteractorOutput.swift
//  WeatherLookup
//
//  Created by Alexander Smyshlaev on 15/07/2019.
//  Copyright © 2019 Alexander Smyshlaev. All rights reserved.
//

import Foundation

protocol CityWeatherListInteractorOutput: class {
    func didLoadAllAddedCities(_ cities: [AddedCity])
    func didReloadWeather(_ weather: [WeatherData?])
    func didLoadAllNonAddedCities(cities: [String])
}
