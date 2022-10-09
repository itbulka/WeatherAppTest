//
//  WeatherData.swift
//  WeatherAppTest
//
//  Created by Владимир Повальский on 08.10.2022.
//

import Foundation

struct Weather: Codable {
    let main: String
    let description: String
}

struct Temperature: Codable {
    let temp: Float
}

struct Wind: Codable {
    let speed: Float
}

struct WeatherData: Codable {
    let weather: [Weather]
    let main: Temperature
    let wind: Wind
    let name: String
    
}
