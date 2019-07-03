//
//  Dependencies.swift
//  SberbankTest
//
//  Created by Влад Калаев on 03/07/2019.
//  Copyright © 2019 Влад Калаев. All rights reserved.
//

import Foundation
import UIKit

class Dependencies{
    
    class func initWithWindow(window: UIWindow) -> Dependencies
    {
        let depend = Dependencies()
        
        depend.configureDependencies(window: window)
        
        return depend
    }
    
    
    var rootRouter: RootRouter?
 
    func configureDependencies(window: UIWindow)
    {
        rootRouter = RootRouter.init(window: window)
        rootRouter?.configurationRouters()

    }
}
