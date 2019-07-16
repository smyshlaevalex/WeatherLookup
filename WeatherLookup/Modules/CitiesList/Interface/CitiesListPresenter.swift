//
//  CitiesListPresenter.swift
//  WeatherLookup
//
//  Created by Alexander Smyshlaev on 16/07/2019.
//  Copyright © 2019 Alexander Smyshlaev. All rights reserved.
//

import Foundation

protocol CitiesListPresenter: class {
    var router: CitiesListRouter? { get set }
    var interactor: CitiesListInteractorInput? { get set }
    var view: CitiesListViewController? { get set }
    
    init(cities: [String])
    
    func cityCount() -> Int
    func cityNameAtIndex(_ index: Int) -> String
    
    func didSelectRow(atIndex index: Int)
}
