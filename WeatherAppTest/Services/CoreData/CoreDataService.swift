//
//  CoreDataService.swift
//  WeatherAppTest
//
//  Created by Владимир Повальский on 09.10.2022.
//

import Foundation
import CoreData

protocol CoreDataServiceProtocol {
    func getObject() -> [WeatherCD]?
    func createObject(data: WeatherData)
    func deleteObject(data: WeatherData?, objectCD: WeatherCD?)
}

final class CoreDataService: CoreDataServiceProtocol {
    static let shared = CoreDataService()
    
    let persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "WeatherCoreData")
        container.loadPersistentStores { _, error in
            if let error = error as? NSError {
                fatalError("\(error.userInfo)")
            }
        }
        return container
    }()
    
    private lazy var context: NSManagedObjectContext = persistentContainer.viewContext
    
    func getObject() -> [WeatherCD]? {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "WeatherCD")
        do {
            let result = try context.fetch(fetchRequest)
            return result as? [WeatherCD]
        } catch (let error) {
            print(error.localizedDescription)
            return nil
        }
    }
    
    func createObject(data: WeatherData) {
        let weather = WeatherCD(context: context)
        weather.name = data.name
        weather.temperature = data.main.temp
        weather.conditionWeather = data.weather.first?.description ?? "-"
        weather.wingSpeed = data.wind.speed
        do {
            try context.save()
        } catch (let error) {
            print(error.localizedDescription)
        }
    }
    
    func deleteObject(data: WeatherData? = nil, objectCD: WeatherCD? = nil) {
        if let data = data {
            guard let weather = getObject() else { return }
            guard let object = weather.first(where: { $0.name == data.name }) else { return }
            context.delete(object)
        }
        
        if let objectCD = objectCD {
            context.delete(objectCD)
        }
        
        do {
            try context.save()
        } catch (let error) {
            print(error.localizedDescription)
        }
        
    }
    
}
