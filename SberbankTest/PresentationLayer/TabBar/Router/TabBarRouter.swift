//
//  TabBarRouter.swift
//  SberbankTest
//
//  Created by Влад Калаев on 03/07/2019.
//  Copyright © 2019 Влад Калаев. All rights reserved.
//

import Foundation
import UIKit

class TabBarRouter: TabBarRouterProtocol {

 
    var rootRouter: RootRouter?


    static func installIntoWindow(rootRouter: RootRouter, window: UIWindow, routers: [MainTabBarProtocol]) -> TabBarRouterProtocol {

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let view: TabBarViewProtocol = storyboard.instantiateInitialViewController() as! TabBarView
        let presenter: TabBarPresenterProtocol & TabBarInteractorOutputProtocol = TabBarPresenter()
        let interactor: TabBarInteractorInputProtocol = TabBarInteractor()
        let router: TabBarRouterProtocol = TabBarRouter()
        
        router.rootRouter = rootRouter
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        var viewControllers = [UIViewController]()
        
        for router in routers {
            
            let tabBarItem = UITabBarItem()
            tabBarItem.image = router.tabIcon
            tabBarItem.title = router.tabTitle
            let viewController = router.configureViewcontroller()
            let navigationController = UINavigationController(rootViewController: viewController)
            navigationController.tabBarItem = tabBarItem
            navigationController.setNavigationBarHidden(true, animated: false)
            navigationController.title = router.tabTitle
            viewControllers.append(navigationController)
        }
        
        let tabBarController = view as! UITabBarController
        tabBarController.viewControllers = viewControllers
        window.rootViewController = tabBarController
        
        return router
    }
    
}
