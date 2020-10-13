//
//  MainTabBarController.swift
//  Podtube
//
//  Created by Corey Burgin on 9/27/20.
//

import UIKit


class MainTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.backgroundColor = #colorLiteral(red: 0.9283757806, green: 0.9285091758, blue: 0.9283465743, alpha: 1)
        UINavigationBar.appearance().prefersLargeTitles = true
        view.backgroundColor = #colorLiteral(red: 0.9283757806, green: 0.9285091758, blue: 0.9283465743, alpha: 1)
        tabBar.tintColor = #colorLiteral(red: 0.9876493812, green: 0, blue: 0, alpha: 1)
        tabBar.barTintColor = #colorLiteral(red: 0.9283757806, green: 0.9285091758, blue: 0.9283465743, alpha: 1)
        tabBar.isTranslucent = false
        
        setupViewControllers()
    }
    
    //MARK:- Setup Functions
    
    func setupViewControllers() {
        viewControllers = [
            generateNavigationController(for: PodcastsSearchController(), title: "Search", image: #imageLiteral(resourceName: "home")),
            generateNavigationController(for: ViewController(), title: "Favorites", image: #imageLiteral(resourceName: "library-1")),
            generateNavigationController(for: ViewController(), title: "Downloads", image: #imageLiteral(resourceName: "browse-1"))
        ]
    }
    
    //MARK:- Helper Functions
    
    fileprivate func generateNavigationController(for rootViewController: UIViewController, title: String, image: UIImage) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootViewController)
//        navController.navigationBar.prefersLargeTitles = true
        rootViewController.navigationItem.title = title
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        return navController
    }
    
}
