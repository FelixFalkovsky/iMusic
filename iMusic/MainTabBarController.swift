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
        
        view.backgroundColor = .white
        
        tabBar.tintColor = #colorLiteral(red: 0.7229539752, green: 0.1990727782, blue: 0.2983846068, alpha: 1)
        
        
        
        viewControllers = [
            generateViewController(rootViewController: SearchMusicViewController(), image: #imageLiteral(resourceName: "searchGray"), title: "Поиск"),
            generateViewController(rootViewController: ViewController(), image: #imageLiteral(resourceName: "libraryGray"), title: "Медиотека")
        ]
    }
    
    private func generateViewController(rootViewController: UIViewController, image: UIImage, title: String) -> UIViewController {
        
        let navigationVC = UINavigationController(rootViewController: rootViewController)
        navigationVC.tabBarItem.image = image
        navigationVC.tabBarItem.title = title
        rootViewController.navigationItem.title = title
        navigationVC.navigationBar.prefersLargeTitles = true
        return navigationVC
    }
}
