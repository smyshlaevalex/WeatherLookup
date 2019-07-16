//
//  CityWeatherListInteractorInput.swift
//  WeatherLookup
//
//  Created by Alexander Smyshlaev on 15/07/2019.
//  Copyright © 2019 Alexander Smyshlaev. All rights reserved.
//

import Foundation

protocol CityWeatherListInteractorInput {
    var presenter: CityWeatherListInteractorOutput? { get set }
    
    init(weatherService: WeatherService, addedCitiesService: AddedCitiesService)
    
    func beginUpdatingWeather()
    func endUpdatingWeather()
    
    func reloadWeather(forCities cities: [String])
    func loadAllAddedCities()
    func loadAllNonAddedCities()
    
    func addCity(_ city: String)
    func removeCity(city: AddedCity)
    func updateCities()
}
