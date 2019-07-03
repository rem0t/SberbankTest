//
//  RootRouter.swift
//  SberbankTest
//
//  Created by Влад Калаев on 03/07/2019.
//  Copyright © 2019 Влад Калаев. All rights reserved.
//

import Foundation
import UIKit

class RootRouter: NSObject {

    var window: UIWindow!
    var tabBarModule: TabBarRouterProtocol?
    
    init(window:UIWindow) {
        super.init()
        self.window = window
    }
    
    func configurationRouters() {
        
        var routers = [MainTabBarProtocol]()
        
        let translateLayer: TranslateRouterProtocol = TranslateRouter()
        routers.append(translateLayer as! MainTabBarProtocol)
        
        let historyLayer: HistoryRouterProtocol = HistoryRouter()
        routers.append(historyLayer as! MainTabBarProtocol)
        
        let settingsLayer: SettingsRouterProtocol = SettingsRouter()
        routers.append(settingsLayer as! MainTabBarProtocol)
        
        tabBarModule = TabBarRouter.installIntoWindow(rootRouter: self, window: window, routers: routers)
        
    }
    
    
}
