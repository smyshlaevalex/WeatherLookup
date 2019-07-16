//
//  CitiesListRouter.swift
//  WeatherLookup
//
//  Created by Alexander Smyshlaev on 16/07/2019.
//  Copyright © 2019 Alexander Smyshlaev. All rights reserved.
//

import UIKit

protocol CitiesListRouter {
    var presenter: CitiesListPresenter? { get set }
    var viewController: UIViewController? { get set }
    
    init(completion: @escaping (String) -> Void)
    
    func dismiss(withCity city: String)
}
