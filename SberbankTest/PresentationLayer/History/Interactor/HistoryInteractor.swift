//
//  HistoryInteractor.swift
//  SberbankTest
//
//  Created by Влад Калаев on 03/07/2019.
//  Copyright © 2019 Влад Калаев. All rights reserved.
//

import Foundation
import CoreData

class HistoryInteractor: HistoryInteractorInputProtocol
{
    
    weak var presenter: HistoryInteractorOutputProtocol?
    
    func fetchSavedTranslates() {
        presenter?.translates(translations: fetchTranslations())
    }
    
    func fetchTranslations() -> [TranslateEtities] {
        let managedContext = CoreDataContainer().persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Translate")
        
        let fetchTranslations = try! managedContext.fetch(fetchRequest)
        
        var objects = [TranslateEtities]()
        
        for object in fetchTranslations {
            let text = object.value(forKey: "language") as! String
            let lang = object.value(forKey: "textTranslated") as! String
            let translate = object.value(forKey: "textTranslation") as! String
            let transletedText = TranslateEtities(name: text, translation: translate, lang: lang)
            objects.append(transletedText)
        }
        return(objects)
    }
    
    func deleteHistoryInDataBase() {
        
        let managedContext = CoreDataContainer().persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Translate")
        
        fetchRequest.returnsObjectsAsFaults = false
        do {
            let results = try managedContext.fetch(fetchRequest)
            for object in results {
                managedContext.delete(object)
            }
            print("Detele comlition ")
            presenter?.allDataDeleted()
        } catch let error {
            print("Detele error :", error)
            presenter?.errorDataDeleted(textError: error.localizedDescription)
        }
        
        do {
            try managedContext.save()
        } catch {
            print("Save error :", error)
        }
    }
    
}
