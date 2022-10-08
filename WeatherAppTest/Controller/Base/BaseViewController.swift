//
//  BaseViewController.swift
//  WeatherAppTest
//
//  Created by Владимир Повальский on 07.10.2022.
//

import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        addViews()
        configureUI()
    }
    
    override func viewWillLayoutSubviews() {
        layoutConstraints()
    }
    
}

@objc extension BaseViewController {
    func addViews() { }
    
    func configureUI() { }
    func layoutConstraints() { }
    
}
