//
//  CityWeatherListPresenter.swift
//  WeatherLookup
//
//  Created by Alexander Smyshlaev on 15/07/2019.
//  Copyright © 2019 Alexander Smyshlaev. All rights reserved.
//

import Foundation

protocol CityWeatherListPresenter: class {
    var router: CityWeatherListRouter? { get set }
    var interactor: CityWeatherListInteractorInput? { get set }
    var view: CityWeatherListViewController? { get set }
    
    func viewDidAppear()
    func didPullRefreshControl()
    func didTapRemoveForRow(atIndex index: Int)
    
    func cityCount() -> Int
    func cityNameAtIndex(_ index: Int) -> String
    func weatherDataAtIndex(_ index: Int) -> WeatherData?
    
    func showCitiesList()
    
    func addCity(_ city: String)
}
