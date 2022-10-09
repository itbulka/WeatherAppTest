//
//  ListCitiesPresenter.swift
//  WeatherAppTest
//
//  Created by Владимир Повальский on 09.10.2022.
//

import Foundation
import UIKit

final class ListCitiesPresenter {
    weak var viewController: ListCitiesController?
    
    private let cities: [City] = [
        City(name: "Москва", lan: 55.755787873674045, lon: 37.602408726121155),
        City(name: "Новосибирск", lan: 54.98699353356393, lon: 82.87247543079364),
//        City(name: "Уфа", lan: 54.838666564841155, lon: 55.81120287572455),
//        City(name: "Росто-на-Дону", lan: 47.27893022389925, lon: 39.6123163456071),
//        City(name: "Екатеренбург", lan: 56.87001087069663, lon: 60.52635712217756),
//        City(name: "Санкт-Петербург", lan: 59.98241335092076, lon: 30.15339545394469),
//        City(name: "Тюмень", lan: 57.176077323712775, lon: 65.54693664375796),
//        City(name: "Сочи", lan: 43.60418624939629, lon: 39.73371001577319)
    ]
    
    var weatherData: [WeatherData] = []
    
    init(viewController: ListCitiesController? = nil) {
        self.viewController = viewController
    }
    
    func getData() {
        cities.forEach { city in
            WeatherService.shared.getWeatherInCity(lan: city.lan, lon: city.lon) { [weak self] result in
                switch result {
                case .success(let weather):
                    guard let weather = weather else { return }
                    self?.weatherData.append(weather)
                    DispatchQueue.main.async {
                        self?.viewController?.reloadData()                        
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func checkIsFavorite(with weather: WeatherData) -> Bool {
        guard let objects = CoreDataService.shared.getObject() else {
            return false
        }
        
        return objects.contains(where: { $0.name == weather.name })
    }
    
}
