//
//  AddedCitiesDataBaseService.swift
//  WeatherLookup
//
//  Created by Alexander Smyshlaev on 16/07/2019.
//  Copyright © 2019 Alexander Smyshlaev. All rights reserved.
//

import CoreData

class AddedCitiesDataBaseService {
    private let stack: CoreDataStack
    
    init(stack: CoreDataStack) {
        self.stack = stack
    }
}

extension AddedCitiesDataBaseService: AddedCitiesReadService {
    func allAddedCities() -> [AddedCity] {
        let request: NSFetchRequest<AddedCity> = AddedCity.fetchRequest()
        
        return (try? stack.context.fetch(request)) ?? []
    }
    
    func allNonAddedCities() -> [String] {
        let request: NSFetchRequest<AddedCity> = AddedCity.fetchRequest()
        let addedCities = (try? stack.context.fetch(request)) ?? []
        
        return City.allCities.filter { city in
            addedCities.allSatisfy { $0.identifier != city }
        }
    }
}

extension AddedCitiesDataBaseService: AddedCitiesWriteService {
    func addCity(_ city: String) {
        _ = AddedCity(context: stack.context,
                      identifier: city,
                      lastTemperature: nil)
        
        stack.saveContext()
    }
    
    func removeCity(_ city: AddedCity) {
        stack.context.delete(city)
        stack.saveContext()
    }
    
    func updateCities() {
        stack.saveContext()
    }
}
