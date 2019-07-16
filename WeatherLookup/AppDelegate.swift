//
//  AppDelegate.swift
//  WeatherLookup
//
//  Created by Alexander Smyshlaev on 15/07/2019.
//  Copyright © 2019 Alexander Smyshlaev. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window
        
        let weatherService = WeatherAPIService()
        let addedCitiesService = AddedCitiesDataBaseService(stack: CoreDataStack(named: .main))
        window.rootViewController = CityWeatherListModule().buildDefault(weatherService: weatherService, addedCitiesService: addedCitiesService)
        
        window.makeKeyAndVisible()
        
        return true
    }
}

