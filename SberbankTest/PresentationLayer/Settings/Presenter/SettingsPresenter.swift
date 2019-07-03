//
//  SettingsPresenter.swift
//  SberbankTest
//
//  Created by Влад Калаев on 03/07/2019.
//  Copyright © 2019 Влад Калаев. All rights reserved.
//

import Foundation

class SettingsPresenter: SettingsPresenterProtocol, SettingsInteractorOutputProtocol {
    
    var view: SettingsViewProtocol?
    var interactor: SettingsInteractorInputProtocol?
    var router: SettingsRouterProtocol?
    
    init() {}
    
}
