//
//  HistoryProtocols.swift
//  SberbankTest
//
//  Created by Влад Калаев on 03/07/2019.
//  Copyright © 2019 Влад Калаев. All rights reserved.
//

import Foundation

protocol HistoryViewProtocol: class
{
    var presenter: HistoryPresenterProtocol? { get set }
    /**
     * Add here your methods for communication PRESENTER -> VIEW
     */
    func showTranslates(translations:[TranslateEtities])
    func updateTableView()
    func showAllertWithMessadge(text:String)

}

protocol HistoryRouterProtocol: class
{
    static func presentHistoryModule(fromView view: AnyObject)
    /**
     * Add here your methods for communication PRESENTER -> WIREFRAME
     */
}

protocol HistoryPresenterProtocol: class
{
    var view: HistoryViewProtocol? { get set }
    var interactor: HistoryInteractorInputProtocol? { get set }
    var router: HistoryRouterProtocol? { get set }
    /**
     * Add here your methods for communication VIEW -> PRESENTER
     */
    
    func takeCountObjectsInDataBase()
    func deleteHistory()
    
}

protocol HistoryInteractorOutputProtocol: class
{
    func translates(translations:[TranslateEtities]) 
    
    func allDataDeleted()
    func errorDataDeleted(textError:String)
    
    /**
     * Add here your methods for communication INTERACTOR -> PRESENTER
     */
}

protocol HistoryInteractorInputProtocol: class
{
    var presenter: HistoryInteractorOutputProtocol? { get set }
    /**
     * Add here your methods for communication PRESENTER -> INTERACTOR
     */
    func fetchSavedTranslates()
    func deleteHistoryInDataBase()
    
}
