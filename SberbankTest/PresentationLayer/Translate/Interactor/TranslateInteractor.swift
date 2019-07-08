//
//  TranslateInteractor.swift
//  SberbankTest
//
//  Created by Влад Калаев on 03/07/2019.
//  Copyright © 2019 Влад Калаев. All rights reserved.
//

import Foundation
import CoreData

class TranslateInteractor: TranslateInteractorInputProtocol
{
    
    weak var presenter: TranslateInteractorOutputProtocol?
        
    let translateLink = "https://translate.yandex.net/api/v1.5/tr.json/translate"
    let key = "trnsl.1.1.20190703T105527Z.7bf7579761c4a16b.4ce902ca682e013bc5614063f9a2c56688cf0d65"
    
    // MARK: - Protocol methods input
    
    func makeTranslateText(text: String, textCode: String) {
        
        if text == "" { // добавить проверку на пустое значение 
            return
        }
        
        if let savedTranslate = CoreDataService().fetchObjectBy(word: text) {
            self.presenter?.translateTextHasCome(text: savedTranslate.translation)
        } else {
 
            let codeLang = translation(textCode: textCode)
            
            requestWith(text: text, lang: codeLang) { result in
                switch result {
                case .success(result: let result):
                    DispatchQueue.main.async() {
                        self.presenter?.translateTextHasCome(text: result.text.first ?? String())
                        CoreDataService().saveToCoreData(text: text,
                                                         lang: codeLang,
                                                         translate: result.text.first ?? String())
                    }
                    
                case .failure(let error):
                    print("ERROR ", error.localizedDescription)
                }
            }
        }
    }
  
    // MARK: - Requests
    
    func requestWith(text: String, lang: String, completion: @escaping (ResultResponse<TextResponse, Error>)-> Void)  {
        
        var urlComponents = URLComponents(string: translateLink)
        urlComponents?.queryItems = [URLQueryItem(name: "key", value: key),
                                    URLQueryItem(name: "text", value: text),
                                    URLQueryItem(name: "lang", value: lang),
                                    URLQueryItem(name: "format", value: "plain")]
        
        let request = URLRequest(url: (urlComponents?.url)!)
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            if  let responseError = error {
                completion(ResultResponse.failure(error: responseError))
                return
            }
            
            guard let recievedData = data else {
                completion(ResultResponse.failure(error: NetworkError.invalidData))
                return
            }
            
            guard let recievedResponse: TextResponse = try? JSONDecoder().decode(TextResponse.self, from: recievedData) else {
                completion(ResultResponse.failure(error: NetworkError.couldNotParseJSON))
                return
            }
            
            completion(ResultResponse.success(result: recievedResponse))
        }
        task.resume()
    }

    // MARK: - Helpers
    
    func translation(textCode: String) -> String { // bad
        
        var str = ""
        
        if textCode == "Русский" {
            str = "ru"
        } else if textCode == "English" {
            str = "en"
        } else if textCode == "Белорусский" {
            str = "be"
        }
        
        return str
    }
    
    
}
