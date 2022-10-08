//
//  Resources.swift
//  WeatherAppTest
//
//  Created by Владимир Повальский on 07.10.2022.
//

import UIKit


enum Resources {
    enum Colors {
        static let separator = UIColor(hexString: "#E8ECEF")
        static let lightGray = UIColor(hexString: "#A9A9A9")
        static let blueColor = UIColor(hexString: "#2C52D2")
        
        static let hotWeather = UIColor(hexString: "#AD2A2A")
        static let warmWeather = UIColor(hexString: "#DA7212")
        static let coldWeather = UIColor(hexString: "#1256DA")
        
        static func getColorForWeather(with temp: Float) -> UIColor {
            switch temp {
            case 20...:
                return Resources.Colors.hotWeather
            case 8..<20:
                return Resources.Colors.warmWeather
            default:
                return Resources.Colors.coldWeather
            }
        }
    }
    
    enum Titles {
        static let listViewTitle = "Список городов"
        static let favoriteTitle = "Избранное"
    }
    
    enum Icons {
        enum Weather {
            static let hot = UIImage(systemName: "thermometer.sun.fill")
            static let warm = UIImage(systemName: "thermometer")
            static let cold = UIImage(systemName: "thermometer.snowflake")
            
            static func getIconsForWeather(with temp: Float) -> UIImage {
                switch temp {
                case 20...:
                    return Resources.Icons.Weather.hot ?? UIImage()
                case 8..<20:
                    return Resources.Icons.Weather.warm ?? UIImage()
                default:
                    return Resources.Icons.Weather.cold ?? UIImage()
                }
            }
        }
        
        enum TabBar {
            static let listIcon = UIImage(systemName: "square.grid.3x3.middleleft.filled")
            static let favoriteIcon = UIImage(systemName: "star.square.fill")
        }
        
        static let like = UIImage(systemName: "heart.fill")
    }
    
    
    
}
