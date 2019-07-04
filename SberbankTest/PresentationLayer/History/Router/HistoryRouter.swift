//
//  HistoryRouter.swift
//  SberbankTest
//
//  Created by Влад Калаев on 03/07/2019.
//  Copyright © 2019 Влад Калаев. All rights reserved.
//

import Foundation
import UIKit

class HistoryRouter: HistoryRouterProtocol, MainTabBarProtocol {
  
    var tabIcon: UIImage = #imageLiteral(resourceName: "text-list")
    var tabTitle: String = ""
    
    static func presentHistoryModule(fromView view: AnyObject) {
        
        let presenter: HistoryPresenterProtocol & HistoryInteractorOutputProtocol = HistoryPresenter()
        let interactor: HistoryInteractorInputProtocol = HistoryInteractor()
        let router: HistoryRouterProtocol = HistoryRouter()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let view: HistoryViewProtocol = storyboard.instantiateViewController(withIdentifier: "HistoryViewController") as! HistoryViewController
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
    }
    
    func configureViewcontroller() -> UIViewController {
        
        let presenter: HistoryPresenterProtocol & HistoryInteractorOutputProtocol = HistoryPresenter()
        let interactor: HistoryInteractorInputProtocol = HistoryInteractor()
        let router: HistoryRouterProtocol = HistoryRouter()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let view: HistoryViewProtocol = storyboard.instantiateViewController(withIdentifier: "HistoryViewController") as! HistoryViewController
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view as! UIViewController
        
    }

    
}
