//
//  ViewController.swift
//  MovieApp
//
//  Created by Nurluay Sharifova on 07.11.24.
//

import UIKit

class ViewController: UITabBarController {
    var tabbarView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpController()
        configureTabBar()
//        addShadowToTabBar()
    }
    func setUpController(){
        viewControllers = [
            createNavController(for: HomeView(), title: NSLocalizedString("Home", comment: ""), image: UIImage(named: "HomeIcon")!),
            createNavController(for: FavoritesView(), title: NSLocalizedString("Favorites", comment: ""), image: UIImage(named: "FavoriteIcon")!),
            createNavController(for: LibraryView(), title: NSLocalizedString("Search", comment: ""), image: UIImage(named: "LibraryIcon")!),
            createNavController(for: ProfileView(), title: NSLocalizedString("Profile", comment: ""), image: UIImage(named: "ProfileIcon")!),
        ]
    }
    
    
    
    func createNavController(for rootViewController: UIViewController, title: String, image: UIImage) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
//        navController.navigationBar.prefersLargeTitles = true
//        rootViewController.navigationItem.title = title
        return navController
    }
    func configureTabBar() {
        tabBar.tintColor = UIColor(named: "MainBlue")
        tabBar.unselectedItemTintColor = .darkGray
    }
    func addShadowToTabBar() {
        tabBar.layer.shadowColor = UIColor.black.cgColor
        tabBar.layer.shadowOpacity = 0.2
        tabBar.layer.shadowOffset = CGSize(width: 0, height: -3)
        tabBar.layer.shadowRadius = 10
        tabBar.layer.masksToBounds = false
    }
    
    
    
    
}

