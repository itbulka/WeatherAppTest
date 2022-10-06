//
//  WeatherService.swift
//  WeatherAppTest
//
//  Created by Владимир Повальский on 07.10.2022.
//

import Foundation

final class WeatherService {
    static let shared = WeatherService()
    
    private var urlString: String { get { "..." } }
    
    func getWeatherInCity() {
        guard let url = URL(string: urlString) else { return }
        
        let urlRequest = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: urlRequest) { data, _, error in
            if let error = error {
                //....
            }
            
            guard let data = data else { return }
            
            //...
            
        }
        
    }
    
}
