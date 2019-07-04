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
        let fetchReauest = NSFetchRequest<NSManagedObject>(entityName: "Translate")
        
        let fetchTranslations = try! managedContext.fetch(fetchReauest)
        
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
    
    
}
