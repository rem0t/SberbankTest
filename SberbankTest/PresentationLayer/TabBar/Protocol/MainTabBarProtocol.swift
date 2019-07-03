//
//  MainTabBarProtocol.swift
//  SberbankTest
//
//  Created by Влад Калаев on 03/07/2019.
//  Copyright © 2019 Влад Калаев. All rights reserved.
//

import Foundation
import UIKit

protocol MainTabBarProtocol {
    
    var tabIcon:UIImage { get }
    var tabTitle:String { get }

    func configureViewcontroller() -> UIViewController
    
}
