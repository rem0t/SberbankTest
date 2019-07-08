//
//  TranslateProtocols.swift
//  SberbankTest
//
//  Created by Влад Калаев on 03/07/2019.
//  Copyright © 2019 Влад Калаев. All rights reserved.
//

import Foundation

protocol TranslateViewProtocol: class {
    var presenter: TranslatePresenterProtocol? { get set }
    func showTranslatedText(text: String)
}

protocol TranslateRouterProtocol: class {
    static func presentTranslateModule(from view: AnyObject)
}

protocol TranslatePresenterProtocol: class {
    var view: TranslateViewProtocol? { get set }
    var interactor: TranslateInteractorInputProtocol? { get set }
    var router: TranslateRouterProtocol? { get set }
    
    func translateText(text: String, textCode: String)
}

protocol TranslateInteractorOutputProtocol: class {
    func translateTextHasCome(text: String)
}

protocol TranslateInteractorInputProtocol: class {
    var presenter: TranslateInteractorOutputProtocol? { get set }
    
    func makeTranslateText(text: String, textCode: String)
}
