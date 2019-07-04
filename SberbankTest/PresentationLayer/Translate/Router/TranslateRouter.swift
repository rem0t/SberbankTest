//
//  TranslateRouter.swift
//  SberbankTest
//
//  Created by Влад Калаев on 03/07/2019.
//  Copyright © 2019 Влад Калаев. All rights reserved.
//

import Foundation
import UIKit

class TranslateRouter: TranslateRouterProtocol, MainTabBarProtocol {

    var tabIcon: UIImage = #imageLiteral(resourceName: "text")
    var tabTitle: String = ""
    
    static func presentTranslateModule(fromView view: AnyObject) {
        
        let presenter: TranslatePresenterProtocol & TranslateInteractorOutputProtocol = TranslatePresenter()
        let interactor: TranslateInteractorInputProtocol = TranslateInteractor()
        let router: TranslateRouterProtocol = TranslateRouter()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let view: TranslateViewProtocol = storyboard.instantiateViewController(withIdentifier: "TranslateViewController") as! TranslateViewController
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
    }
    
    func configureViewcontroller() -> UIViewController {
     
        let presenter: TranslatePresenterProtocol & TranslateInteractorOutputProtocol = TranslatePresenter()
        let interactor: TranslateInteractorInputProtocol = TranslateInteractor()
        let router: TranslateRouterProtocol = TranslateRouter()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let view: TranslateViewProtocol = storyboard.instantiateViewController(withIdentifier: "TranslateViewController") as! TranslateViewController
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view as! UIViewController
        
    }

    
}
