//
//  TabBarProtocols.swift
//  SberbankTest
//
//  Created by Влад Калаев on 03/07/2019.
//  Copyright © 2019 Влад Калаев. All rights reserved.
//

import Foundation
import UIKit

protocol TabBarViewProtocol: class
{
    var presenter: TabBarPresenterProtocol? { get set }
    /**
     * Add here your methods for communication PRESENTER -> VIEW
     */
}

protocol TabBarRouterProtocol: class
{
    static func installIntoWindow(rootRouter: RootRouter, window: UIWindow, routers:[MainTabBarProtocol]) -> TabBarRouterProtocol
    var rootRouter: RootRouter? { get set }
    /**
     * Add here your methods for communication PRESENTER -> WIREFRAME
     */
}

protocol TabBarPresenterProtocol: class
{
    var view: TabBarViewProtocol? { get set }
    var interactor: TabBarInteractorInputProtocol? { get set }
    var router: TabBarRouterProtocol? { get set }
    /**
     * Add here your methods for communication VIEW -> PRESENTER
     */
}

protocol TabBarInteractorOutputProtocol: class
{
    /**
     * Add here your methods for communication INTERACTOR -> PRESENTER
     */
}

protocol TabBarInteractorInputProtocol: class
{
    var presenter: TabBarInteractorOutputProtocol? { get set }
    /**
     * Add here your methods for communication PRESENTER -> INTERACTOR
     */
}
