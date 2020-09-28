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
        
        UINavigationBar.appearance().prefersLargeTitles = true
        
        tabBar.tintColor = .blue
        
        setupViewControllers()
    }
    
    
    //MARK:- Setup Functions
    func setupViewControllers() {
        viewControllers = [
            generateNavigationController(for: ViewController(), title: "Favorites", image: #imageLiteral(resourceName: "play_circle_filled")),
            generateNavigationController(for: ViewController(), title: "Search ", image: #imageLiteral(resourceName: "search")),
            generateNavigationController(for: ViewController(), title: "Downloads", image: #imageLiteral(resourceName: "folder"))
        ]
    }
    
    
    
    
    
    //MARK:- Helper Function
    
    fileprivate func generateNavigationController(for rootViewController: UIViewController, title: String, image: UIImage) ->  UIViewController {
        let navController = UINavigationController(rootViewController: rootViewController)
        
        rootViewController.navigationItem.title = title
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        return navController
        
    }
    
    
    
}
