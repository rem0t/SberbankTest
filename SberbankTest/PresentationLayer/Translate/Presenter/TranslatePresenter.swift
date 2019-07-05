//
//  TranslatePresenter.swift
//  SberbankTest
//
//  Created by Влад Калаев on 03/07/2019.
//  Copyright © 2019 Влад Калаев. All rights reserved.
//

import Foundation

class TranslatePresenter: TranslatePresenterProtocol, TranslateInteractorOutputProtocol {

    var view: TranslateViewProtocol?
    var interactor: TranslateInteractorInputProtocol?
    var router: TranslateRouterProtocol?

    
    func translateText(text: String, textCode: String) {
        interactor!.makeTranslateText(text: text, textCode: textCode)
    } 
    
    func translateTextHasCome(text: String) {
        view!.showTranslatedText(text: text)
    }

}
