//
//  CoreDataContainer.swift
//  SberbankTest
//
//  Created by Влад Калаев on 04/07/2019.
//  Copyright © 2019 Влад Калаев. All rights reserved.
//

import Foundation
import CoreData

class CoreDataService {
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "SberbankTest")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    
    // MARK: - Core Data save
    
    func saveToCoreData(text: String, lang: String, translate: String) {
        
        let managedContext = persistentContainer.viewContext
        let entitie = NSEntityDescription.entity(forEntityName: "Translate", in: managedContext)
        
        let translation = NSManagedObject(entity: entitie ?? NSEntityDescription(), insertInto: managedContext)
        translation.setValue(lang, forKey: "language")
        translation.setValue(text, forKey: "textTranslated")
        translation.setValue(translate, forKey: "textTranslation")
        
        do {
            try managedContext.save()
            print("translation saved !")
        } catch let error as NSError {
            print("NOT save, why ? \(error). \(error.userInfo)")
        }
    }
    
    // MARK: - Core Data fetch
    
    func fetchObjectBy(word: String) -> TranslateEtities? {
        let managedContext = persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Translate")
        fetchRequest.predicate = NSPredicate(format: "textTranslated == %@", word)
        
        guard let fetchedTranslations = try? managedContext.fetch(fetchRequest) else { return nil }
        
        var objects = [TranslateEtities]()
        
        for object in fetchedTranslations {
            let text = object.value(forKey: "language") as? String
            let lang = object.value(forKey: "textTranslated") as? String
            let translate = object.value(forKey: "textTranslation") as? String
            let transletedText = TranslateEtities(name: text ?? String(), translation: translate ?? String(), lang: lang ?? String())
            objects.append(transletedText)
        }
        return(objects.first)
    }
    

    
    
}


