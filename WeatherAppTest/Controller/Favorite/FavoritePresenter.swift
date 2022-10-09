//
//  FavoritePresenter.swift
//  WeatherAppTest
//
//  Created by Владимир Повальский on 09.10.2022.
//

import Foundation

final class FavoritePresenter {
    
    weak var viewController: FavoriteViewController?
    
    var weatherCity: [WeatherCD] = []
    
    init(viewController: FavoriteViewController? = nil) {
        self.viewController = viewController
    }
    
    func getWeather() {
        guard let data = CoreDataService.shared.getObject() else { return }
        weatherCity = data
        DispatchQueue.main.async { [weak self] in
            self?.viewController?.reloadTableData()
        }
    }
}
