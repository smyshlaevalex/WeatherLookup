//
//  CityWeatherListDefaultPresenter.swift
//  WeatherLookup
//
//  Created by Alexander Smyshlaev on 15/07/2019.
//  Copyright © 2019 Alexander Smyshlaev. All rights reserved.
//

import Foundation

class CityWeatherListDefaultPresenter: CityWeatherListPresenter {
    var router: CityWeatherListRouter?
    var interactor: CityWeatherListInteractorInput?
    weak var view: CityWeatherListViewController?
    
    private var addedCities = [AddedCity]()
    
    func viewDidAppear() {
        interactor?.loadAllAddedCities()
        interactor?.beginUpdatingWeather()
    }
    
    func didPullRefreshControl() {
        reloadWeatherData()
    }
    
    func didTapRemoveForRow(atIndex index: Int) {
        let addedCity = addedCities[index]
        addedCities.remove(at: index)
        interactor?.removeCity(city: addedCity)
    }
    
    func cityCount() -> Int {
        return addedCities.count
    }
    
    func cityNameAtIndex(_ index: Int) -> String {
        let addedCity = addedCities[index]
        return City.nameForCity(withIdentifier: addedCity.identifier)
    }
    
    func weatherDataAtIndex(_ index: Int) -> WeatherData? {
        let weatherData: WeatherData?
        
        if let temperature = addedCities[index].lastTemperature {
            weatherData = WeatherData(temperature: temperature.doubleValue)
        } else {
            weatherData = nil
        }
        
        return weatherData
    }
    
    func showCitiesList() {
        interactor?.loadAllNonAddedCities()
    }
    
    func addCity(_ city: String) {
        interactor?.addCity(city)
        
        reloadWeatherData()
    }
    
    private func reloadWeatherData() {
        let cities = addedCities.map { $0.identifier! }
        interactor?.reloadWeather(forCities: cities)
    }
}

extension CityWeatherListDefaultPresenter: CityWeatherListInteractorOutput {
    func didLoadAllAddedCities(_ cities: [AddedCity]) {
        addedCities = cities
        view?.reloadData()
    }
    
    func didReloadWeather(_ weather: [WeatherData?]) {
        for (addedCity, weatherData) in zip(addedCities, weather) {
            if let weatherData = weatherData {
                addedCity.lastTemperature = weatherData.temperature as NSNumber
            }
        }
        
        interactor?.updateCities()
        
        view?.endRefreshing()
        view?.reloadData()
    }
    
    func didLoadAllNonAddedCities(cities: [String]) {
        router?.showCitiesList(cities: cities)
    }
}
