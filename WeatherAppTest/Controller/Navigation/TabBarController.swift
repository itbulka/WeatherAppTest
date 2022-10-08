//
//  TabBarController.swift
//  WeatherAppTest
//
//  Created by Владимир Повальский on 07.10.2022.
//

import UIKit

final class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        configure()
        
        let listCitiesNav = NavigationController(rootViewController: ListCitiesController())
        let favoriteNav = NavigationController(rootViewController: FavoriteViewController())
        
        listCitiesNav.tabBarItem = UITabBarItem(title: Resources.Titles.listViewTitle,
                                                image: Resources.Icons.TabBar.listIcon,
                                                tag: 1)
        
        favoriteNav.tabBarItem = UITabBarItem(title: Resources.Titles.favoriteTitle,
                                              image: Resources.Icons.TabBar.favoriteIcon,
                                              tag: 2)
        
        setViewControllers([
            listCitiesNav,
            favoriteNav
        ], animated: false)
        
        
        
    }
    
    private func configure() {
        tabBar.backgroundColor = .white
        tabBar.tintColor = Resources.Colors.blueColor
        tabBar.layer.borderColor = Resources.Colors.separator.cgColor
        tabBar.layer.borderWidth = 1
    }
    
}
