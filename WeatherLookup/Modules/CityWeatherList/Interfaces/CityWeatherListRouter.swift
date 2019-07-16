//
//  CityWeatherListRouter.swift
//  WeatherLookup
//
//  Created by Alexander Smyshlaev on 15/07/2019.
//  Copyright © 2019 Alexander Smyshlaev. All rights reserved.
//

import UIKit

protocol CityWeatherListRouter {
    var presenter: CityWeatherListPresenter? { get set }
    var viewController: UIViewController? { get set }
    
    func showCitiesList(cities: [String])
}
