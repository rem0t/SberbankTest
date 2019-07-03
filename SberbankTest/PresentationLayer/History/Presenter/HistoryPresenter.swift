//
//  HistoryPresenter.swift
//  SberbankTest
//
//  Created by Влад Калаев on 03/07/2019.
//  Copyright © 2019 Влад Калаев. All rights reserved.
//

import Foundation

class HistoryPresenter: HistoryPresenterProtocol, HistoryInteractorOutputProtocol {
    
    var view: HistoryViewProtocol?
    var interactor: HistoryInteractorInputProtocol?
    var router: HistoryRouterProtocol?
    
    init() {}
    
}
