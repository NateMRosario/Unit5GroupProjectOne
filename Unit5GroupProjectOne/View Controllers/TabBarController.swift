//
//  TabBarController.swift
//  Unit5GroupProjectOne
//
//  Created by C4Q on 1/18/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .lightGray
        
        ///SearchVC
        let searchNavigation = UINavigationController(rootViewController: SearchViewController())
        ///FavoriteVC
        let favoriteVC = FavoriteViewController()
        
        searchNavigation.tabBarItem = UITabBarItem(title: "Search", image: #imageLiteral(resourceName: "search icon"), tag: 0)
        favoriteVC.tabBarItem = UITabBarItem(title: "Favorites", image: #imageLiteral(resourceName: "favorite icon"), tag: 1)
        let tabList = [searchNavigation, favoriteVC]
        viewControllers = tabList
    }


}