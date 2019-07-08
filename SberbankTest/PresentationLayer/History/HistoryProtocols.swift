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

    func showTranslates(translations:[TranslateEtities])
    func updateTableView()
    func showAllertWithMessedge(text:String)

}

protocol HistoryRouterProtocol: class
{
    static func presentHistoryModule(fromView view: AnyObject)

}

protocol HistoryPresenterProtocol: class
{
    var view: HistoryViewProtocol? { get set }
    var interactor: HistoryInteractorInputProtocol? { get set }
    var router: HistoryRouterProtocol? { get set }
    
    func takeCountObjectsInDataBase()
    func deleteHistory()
    
}

protocol HistoryInteractorOutputProtocol: class
{
    func translates(translations:[TranslateEtities]) 
    
    func allDataDeleted()
    func errorDataDeleted(textError:String)

}

protocol HistoryInteractorInputProtocol: class
{
    var presenter: HistoryInteractorOutputProtocol? { get set }
    
    func fetchSavedTranslates()
    func deleteHistoryInDataBase()
    
}
