//
//  WeatherCD+CoreDataProperties.swift
//  WeatherAppTest
//
//  Created by Владимир Повальский on 09.10.2022.
//
//

import Foundation
import CoreData


extension WeatherCD {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<WeatherCD> {
        return NSFetchRequest<WeatherCD>(entityName: "WeatherCD")
    }

    @NSManaged public var name: String?
    @NSManaged public var conditionWeather: String?
    @NSManaged public var temperature: Float
    @NSManaged public var wingSpeed: Float

}

extension WeatherCD : Identifiable {

}
