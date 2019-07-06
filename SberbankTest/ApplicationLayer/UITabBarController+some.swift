//
//  UITabBarController+some.swift
//  SberbankTest
//
//  Created by Влад Калаев on 06/07/2019.
//  Copyright © 2019 Влад Калаев. All rights reserved.
//

import UIKit


extension UITabBarController {
    
    func createNavigationController(vc: UIViewController, selecredImage: UIImage, unselectedImage: UIImage) -> UINavigationController {
        
        let viewController = vc
        let navController = UINavigationController(rootViewController: viewController)
        navController.tabBarItem.image = unselectedImage
        navigationController?.tabBarItem.selectedImage = selecredImage
        return navController
    }
    
}
