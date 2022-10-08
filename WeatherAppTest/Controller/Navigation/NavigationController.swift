//
//  NavigationController.swift
//  WeatherAppTest
//
//  Created by Владимир Повальский on 07.10.2022.
//

import UIKit

class NavigationController: UINavigationController {
    
    override func viewDidLoad() {
        configure()
    }
    
    private func configure() {
        view.backgroundColor = .white
        navigationBar.addBottomBorder()
    }
    
}
