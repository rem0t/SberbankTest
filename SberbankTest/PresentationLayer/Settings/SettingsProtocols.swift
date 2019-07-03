//
//  SettingsProtocols.swift
//  SberbankTest
//
//  Created by Влад Калаев on 03/07/2019.
//  Copyright © 2019 Влад Калаев. All rights reserved.
//

import Foundation

protocol SettingsViewProtocol: class
{
    var presenter: SettingsPresenterProtocol? { get set }
    /**
     * Add here your methods for communication PRESENTER -> VIEW
     */
}

protocol SettingsRouterProtocol: class
{
    static func presentSettingsModule(fromView view: AnyObject)
    /**
     * Add here your methods for communication PRESENTER -> WIREFRAME
     */
}

protocol SettingsPresenterProtocol: class
{
    var view: SettingsViewProtocol? { get set }
    var interactor: SettingsInteractorInputProtocol? { get set }
    var router: SettingsRouterProtocol? { get set }
    /**
     * Add here your methods for communication VIEW -> PRESENTER
     */
}

protocol SettingsInteractorOutputProtocol: class
{
    /**
     * Add here your methods for communication INTERACTOR -> PRESENTER
     */
}

protocol SettingsInteractorInputProtocol: class
{
    var presenter: SettingsInteractorOutputProtocol? { get set }
    /**
     * Add here your methods for communication PRESENTER -> INTERACTOR
     */
}
