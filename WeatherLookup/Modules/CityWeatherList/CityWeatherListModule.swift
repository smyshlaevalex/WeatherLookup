//
//  CityWeatherListModule.swift
//  WeatherLookup
//
//  Created by Alexander Smyshlaev on 15/07/2019.
//  Copyright © 2019 Alexander Smyshlaev. All rights reserved.
//

import UIKit

class CityWeatherListModule {
    func buildDefault(weatherService: WeatherService,
                      addedCitiesService: AddedCitiesService) -> UIViewController {
        let viewController = CityWeatherListDefaultViewController()
        let presenter = CityWeatherListDefaultPresenter()
        let interactor = CityWeatherListDefaultInteractor(weatherService: weatherService, addedCitiesService: addedCitiesService)
        let router = CityWeatherListDefaultRouter()
        
        viewController.presenter = presenter
        
        presenter.router = router
        presenter.interactor = interactor
        presenter.view = viewController
        
        interactor.presenter = presenter
        
        router.presenter = presenter
        router.viewController = viewController
        
        return UINavigationController(rootViewController: viewController)
    }
}
