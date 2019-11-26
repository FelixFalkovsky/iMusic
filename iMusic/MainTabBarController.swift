//
//  MainTabBarController.swift
//  iMusic
//
//  Created by Felix Falkovsky on 22.11.2019.
//  Copyright © 2019 Felix Falkovsky. All rights reserved.
//

import UIKit

protocol MainTabBarControllerDelegate: class {
    func minimizedTrackDetailController()
}

class MainTabBarController: UITabBarController {
    
    let searchVC: SearchViewController = SearchViewController.loadFromStoryboard()
    private var minimizedTopAnchorConstraint: NSLayoutConstraint!
    private var maximizedTopAnchorConstraint: NSLayoutConstraint!
    private var bottomAnchorConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        tabBar.tintColor = #colorLiteral(red: 0.7229539752, green: 0.1990727782, blue: 0.2983846068, alpha: 1)
        setupTrackDetailView()

        
        viewControllers = [
            generateViewController(rootViewController: searchVC, image: #imageLiteral(resourceName: "searchGray"), title: "Поиск"),
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
    
    private func setupTrackDetailView() {
    print("Настройка DetailView")
    let trackDetailView: TrackDetailView = TrackDetailView.loadFromNib()
    trackDetailView.backgroundColor = .gray
    trackDetailView.tabBarDelegate = self
        trackDetailView.delegate = searchVC
    view.insertSubview(trackDetailView, belowSubview: tabBar)
    
    // Auto Layout
    trackDetailView.translatesAutoresizingMaskIntoConstraints = false
    maximizedTopAnchorConstraint = trackDetailView.topAnchor.constraint(equalTo: view.topAnchor)
    minimizedTopAnchorConstraint = trackDetailView.topAnchor.constraint(equalTo: tabBar.topAnchor, constant: -64)
    bottomAnchorConstraint = trackDetailView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: view.frame.height)
    bottomAnchorConstraint.isActive = true
    bottomAnchorConstraint.isActive = true
    maximizedTopAnchorConstraint.isActive = true
    trackDetailView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    trackDetailView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    }
}
extension MainTabBarController: MainTabBarControllerDelegate {
    func minimizedTrackDetailController() {
        maximizedTopAnchorConstraint.isActive = false
        minimizedTopAnchorConstraint.isActive = true
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       usingSpringWithDamping: 0.7,
                       initialSpringVelocity: 1,
                       options: .curveEaseOut,
                       animations: {
                        self.view.layoutIfNeeded()
        },
                       completion: nil)
    }
}
