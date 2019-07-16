//
//  AddedCity+CoreDataProperties.swift
//  WeatherLookup
//
//  Created by Alexander Smyshlaev on 16/07/2019.
//  Copyright © 2019 Alexander Smyshlaev. All rights reserved.
//
//

import Foundation
import CoreData

extension AddedCity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<AddedCity> {
        return NSFetchRequest<AddedCity>(entityName: "AddedCity")
    }

    @NSManaged public var identifier: String!
    @NSManaged public var lastTemperature: NSNumber?
    
    convenience init(context: NSManagedObjectContext, identifier: String, lastTemperature: Double?) {
        self.init(context: context)
        
        self.identifier = identifier
        self.lastTemperature = lastTemperature as NSNumber?
    }
}
