//
//  CityWeatherListViewController.swift
//  WeatherLookup
//
//  Created by Alexander Smyshlaev on 15/07/2019.
//  Copyright © 2019 Alexander Smyshlaev. All rights reserved.
//

import Foundation

protocol CityWeatherListViewController: class {
    var presenter: CityWeatherListPresenter? { get set }
    
    func reloadData()
    func endRefreshing()
}
