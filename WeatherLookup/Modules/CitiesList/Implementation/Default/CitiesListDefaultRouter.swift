//
//  CitiesListDefaultRouter.swift
//  WeatherLookup
//
//  Created by Alexander Smyshlaev on 16/07/2019.
//  Copyright © 2019 Alexander Smyshlaev. All rights reserved.
//

import UIKit

class CitiesListDefaultRouter: CitiesListRouter {
    weak var presenter: CitiesListPresenter?
    weak var viewController: UIViewController?
    
    private let completion: (String) -> Void
    
    required init(completion: @escaping (String) -> Void) {
        self.completion = completion
    }
    
    func dismiss(withCity city: String) {
        completion(city)
        viewController?.navigationController?.popViewController(animated: true)
    }
}
