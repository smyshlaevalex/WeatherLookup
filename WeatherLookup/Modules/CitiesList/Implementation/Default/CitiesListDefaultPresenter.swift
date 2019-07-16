//
//  CitiesListDefaultPresenter.swift
//  WeatherLookup
//
//  Created by Alexander Smyshlaev on 16/07/2019.
//  Copyright © 2019 Alexander Smyshlaev. All rights reserved.
//

import Foundation

class CitiesListDefaultPresenter: CitiesListPresenter {
    var router: CitiesListRouter?
    var interactor: CitiesListInteractorInput?
    weak var view: CitiesListViewController?
    
    private let cities: [String]
    
    required init(cities: [String]) {
        self.cities = cities
    }
    
    func cityCount() -> Int {
        return cities.count
    }
    
    func cityNameAtIndex(_ index: Int) -> String {
        let city = cities[index]
        return City.nameForCity(withIdentifier: city)
    }
    
    func didSelectRow(atIndex index: Int) {
        let city = cities[index]
        router?.dismiss(withCity: city)
    }
}

extension CitiesListDefaultPresenter: CitiesListInteractorOutput {
    
}
