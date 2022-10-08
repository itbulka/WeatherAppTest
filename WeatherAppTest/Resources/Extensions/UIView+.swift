//
//  UIView+.swift
//  WeatherAppTest
//
//  Created by Владимир Повальский on 07.10.2022.
//

import UIKit

extension UIView {
    func addBottomBorder() {
        let separator = UIView()
        separator.backgroundColor = Resources.Colors.separator
        separator.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        separator.frame = CGRect(x: 0,
                                 y: frame.height - 1,
                                 width: frame.width,
                                 height: 1)
        addSubview(separator)
    }
    
    func addView(_ view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
    }
    
}
