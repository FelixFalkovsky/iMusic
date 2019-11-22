//
//  MainTabBarController.swift
//  iMusic
//
//  Created by Felix Falkovsky on 22.11.2019.
//  Copyright © 2019 Felix Falkovsky. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .gray
        
        
        
        let libraryVC = ViewController()
        let searchVC = SearchViewController()
        let navigationVC = UINavigationController(rootViewController: searchVC)
        viewControllers = [
        
            navigationVC,
            libraryVC
        ]
    }
}
