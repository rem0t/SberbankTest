//
//  TabBarPresenter.swift
//  SberbankTest
//
//  Created by Влад Калаев on 03/07/2019.
//  Copyright © 2019 Влад Калаев. All rights reserved.
//

import Foundation

class TabBarPresenter: TabBarPresenterProtocol, TabBarInteractorOutputProtocol
{
    
    weak var view: TabBarViewProtocol?
    var interactor: TabBarInteractorInputProtocol?
    var router: TabBarRouterProtocol?
    
    init() {}
}
