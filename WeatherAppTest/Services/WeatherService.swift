//
//  WeatherService.swift
//  WeatherAppTest
//
//  Created by Владимир Повальский on 07.10.2022.
//

import Foundation
import UIKit

enum WeatherServiceError: Error {
    case incorrectUrl
    case parsingData
    case noDataAvailable
    case defaultError
    
    func getError() -> Error {
        switch self {
        case .incorrectUrl:
            return NSError(domain: "WeatherService",
                    code: 1,
                    userInfo: [NSLocalizedDescriptionKey : "Incorrect URL"])
        case .parsingData:
            return NSError(domain: "WeatherService",
                    code: 1,
                    userInfo: [NSLocalizedDescriptionKey : "Error parsing data"])
        case .noDataAvailable:
            return NSError(domain: "WeatherService",
                    code: 1,
                    userInfo: [NSLocalizedDescriptionKey : "No data"])
        case .defaultError:
            return NSError(domain: "WeatherService",
                    code: 1,
                    userInfo: [NSLocalizedDescriptionKey : "Error"])
        }
    }
}

final class WeatherService {
    static let shared = WeatherService()
    
    private var urlString: String { get { "https://api.openweathermap.org/data/2.5/weather?" } }
    
    func getWeatherInCity(lan: Double, lon: Double, completion: @escaping (Result<WeatherData?, Error>) -> Void) {
        
        guard let url = URL(string: "\(urlString)lat=\(lan)&lon=\(lon)&units=metric&lang=ru&appid=94e426f6f81e70ebe419af31792ec407") else {
            completion(.failure(WeatherServiceError.incorrectUrl.getError()))
            return
        }
        
        let urlRequest = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: urlRequest) { data, _, error in
            if error != nil {
                completion(.failure(WeatherServiceError.defaultError.getError()))
                return
            }
            
            guard let data = data else {
                completion(.failure(WeatherServiceError.noDataAvailable.getError()))
                return
            }
            
            do {
                let result = try JSONDecoder().decode(WeatherData.self, from: data)
                completion(.success(result))
            } catch {
                completion(.failure(WeatherServiceError.parsingData.getError()))
            }
            
        }.resume()
    }
}

