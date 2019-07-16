//
//  CoreDataStack.swift
//  WeatherLookup
//
//  Created by Alexander Smyshlaev on 16/07/2019.
//  Copyright © 2019 Alexander Smyshlaev. All rights reserved.
//

import CoreData

class CoreDataStack {
    enum Name: String {
        case main = "Main"
    }
    
    let name: Name
    
    init(named name: Name) {
        self.name = name
    }
    
    lazy var container: NSPersistentContainer = {
        let container = NSPersistentContainer(name: name.rawValue)
        container.loadPersistentStores { _, _ in }
        
        container.viewContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        
        return container
    }()
    
    var context: NSManagedObjectContext {
        return container.viewContext
    }
    
    func saveContext() {
        if context.hasChanges {
            try? context.save()
        }
    }
}
