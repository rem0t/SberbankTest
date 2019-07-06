//
//  CoreDataContainer.swift
//  SberbankTest
//
//  Created by Влад Калаев on 04/07/2019.
//  Copyright © 2019 Влад Калаев. All rights reserved.
//

import Foundation
import CoreData

class CoreDataContainer {
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "SberbankTest")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
}


