//
//  SettingsRouter.swift
//  SberbankTest
//
//  Created by Влад Калаев on 03/07/2019.
//  Copyright © 2019 Влад Калаев. All rights reserved.
//

import Foundation
import UIKit

class SettingsRouter: SettingsRouterProtocol, MainTabBarProtocol {

    
    var tabIcon: UIImage = #imageLiteral(resourceName: "sun")
    var tabTitle: String = ""
    
    static func presentSettingsModule(fromView view: AnyObject) {
        
        let presenter: SettingsPresenterProtocol & SettingsInteractorOutputProtocol = SettingsPresenter()
        let interactor: SettingsInteractorInputProtocol = SettingsInteractor()
        let router: SettingsRouterProtocol = SettingsRouter()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let view: SettingsViewProtocol = storyboard.instantiateViewController(withIdentifier: "SettingsViewController") as! SettingsViewController
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
    }
    
    func configureViewcontroller() -> UIViewController {
        
        let presenter: SettingsPresenterProtocol & SettingsInteractorOutputProtocol = SettingsPresenter()
        let interactor: SettingsInteractorInputProtocol = SettingsInteractor()
        let router: SettingsRouterProtocol = SettingsRouter()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let view: SettingsViewProtocol = storyboard.instantiateViewController(withIdentifier: "SettingsViewController") as! SettingsViewController
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view as! UIViewController
        
    }
    
    
}
