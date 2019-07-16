//
//  CitiesListModule.swift
//  WeatherLookup
//
//  Created by Alexander Smyshlaev on 16/07/2019.
//  Copyright © 2019 Alexander Smyshlaev. All rights reserved.
//

import UIKit

class CitiesListModule {
    func buildDefault(cities: [String], completion: @escaping (String) -> Void) -> UIViewController {
        let viewController = CitiesListDefaultViewController()
        let presenter = CitiesListDefaultPresenter(cities: cities)
        let interactor = CitiesListDefaultInteractor()
        let router = CitiesListDefaultRouter(completion: completion)

        viewController.presenter = presenter

        presenter.router = router
        presenter.interactor = interactor
        presenter.view = viewController

        interactor.presenter = presenter

        router.presenter = presenter
        router.viewController = viewController

        return viewController
    }
}
