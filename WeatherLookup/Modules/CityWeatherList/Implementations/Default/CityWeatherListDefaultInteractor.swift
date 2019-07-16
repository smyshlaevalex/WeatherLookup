//
//  CityWeatherListDefaultInteractor.swift
//  WeatherLookup
//
//  Created by Alexander Smyshlaev on 15/07/2019.
//  Copyright © 2019 Alexander Smyshlaev. All rights reserved.
//

import Foundation

class CityWeatherListDefaultInteractor: CityWeatherListInteractorInput {
    weak var presenter: CityWeatherListInteractorOutput?
    
    private let weatherService: WeatherService
    private let addedCitiesService: AddedCitiesService
    
    private var timer: Timer?
    
    required init(weatherService: WeatherService, addedCitiesService: AddedCitiesService) {
        self.weatherService = weatherService
        self.addedCitiesService = addedCitiesService
    }
    
    func beginUpdatingWeather() {
        timer = Timer.scheduledTimer(withTimeInterval: 10, repeats: true, block: { [weak self] _ in
            guard let sSelf = self else {
                return
            }
            
            let addedCities = sSelf.allAddedCities()
            let cities = addedCities.map { $0.identifier! }
            
            sSelf.reloadWeather(forCities: cities)
        })
    }
    
    func endUpdatingWeather() {
        timer?.invalidate()
        timer = nil
    }
    
    func reloadWeather(forCities cities: [String]) {
        let dispatchGroup = DispatchGroup()
        let dispatchSemephore = DispatchSemaphore(value: 1)
        
        var weatherDataList = [WeatherData?](repeating: nil, count: cities.count)
        
        for (index, city) in cities.enumerated() {
            dispatchGroup.enter()
            weatherService.temperatureInCity(named: city).didFulfill.delegate(to: self) { target, result in
                dispatchSemephore.wait()
                switch result {
                case .success(let weatherData):
                    weatherDataList[index] = weatherData
                case .failure(_):
                    weatherDataList[index] = nil
                }
                dispatchSemephore.signal()
                
                dispatchGroup.leave()
            }
        }
        
        dispatchGroup.notify(queue: .main) {
            self.presenter?.didReloadWeather(weatherDataList)
        }
    }
    
    func loadAllAddedCities() {
        let addedCities = allAddedCities()
        presenter?.didLoadAllAddedCities(addedCities)
    }
    
    func loadAllNonAddedCities() {
        let nonAddedCities = addedCitiesService.allNonAddedCities()
        presenter?.didLoadAllNonAddedCities(cities: nonAddedCities)
    }
    
    func addCity(_ city: String) {
        addedCitiesService.addCity(city)
        loadAllAddedCities()
    }
    
    func removeCity(city: AddedCity) {
        addedCitiesService.removeCity(city)
    }
    
    func updateCities() {
        addedCitiesService.updateCities()
    }
    
    private func allAddedCities() -> [AddedCity] {
        return addedCitiesService.allAddedCities().sorted {
            $0.identifier < $1.identifier
        }
    }
}
