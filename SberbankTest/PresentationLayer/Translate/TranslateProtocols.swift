//
//  TranslateProtocols.swift
//  SberbankTest
//
//  Created by Влад Калаев on 03/07/2019.
//  Copyright © 2019 Влад Калаев. All rights reserved.
//

import Foundation

protocol TranslateViewProtocol: class
{
    var presenter: TranslatePresenterProtocol? { get set }
    /**
     * Add here your methods for communication PRESENTER -> VIEW
     */
}

protocol TranslateRouterProtocol: class
{
    static func presentTranslateModule(fromView view: AnyObject)
    /**
     * Add here your methods for communication PRESENTER -> WIREFRAME
     */
}

protocol TranslatePresenterProtocol: class
{
    var view: TranslateViewProtocol? { get set }
    var interactor: TranslateInteractorInputProtocol? { get set }
    var router: TranslateRouterProtocol? { get set }
    /**
     * Add here your methods for communication VIEW -> PRESENTER
     */
}

protocol TranslateInteractorOutputProtocol: class
{
    /**
     * Add here your methods for communication INTERACTOR -> PRESENTER
     */
}

protocol TranslateInteractorInputProtocol: class
{
    var presenter: TranslateInteractorOutputProtocol? { get set }
    /**
     * Add here your methods for communication PRESENTER -> INTERACTOR
     */
}
