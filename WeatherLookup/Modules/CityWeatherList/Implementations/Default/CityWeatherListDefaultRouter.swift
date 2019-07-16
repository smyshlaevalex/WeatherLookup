//
//  CityWeatherListDefaultRouter.swift
//  WeatherLookup
//
//  Created by Alexander Smyshlaev on 15/07/2019.
//  Copyright © 2019 Alexander Smyshlaev. All rights reserved.
//

import UIKit

class CityWeatherListDefaultRouter: CityWeatherListRouter {
    weak var presenter: CityWeatherListPresenter?
    weak var viewController: UIViewController?
    
    func showCitiesList(cities: [String]) {
        let citiesModuleViewController = CitiesListModule().buildDefault(cities: cities) { [weak self] in
            self?.presenter?.addCity($0)
        }
        
        viewController?.navigationController?.pushViewController(citiesModuleViewController, animated: true)
    }
}
