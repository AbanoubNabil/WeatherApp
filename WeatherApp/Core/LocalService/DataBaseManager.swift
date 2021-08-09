//
//  DataBaseManager.swift
//  WeatherApp
//
//  Created by Abanoub Nabil on 8/7/21.
//

import Foundation
import RealmSwift

struct AppError: Error {
    
}

class DataBaseManager {
    
    lazy var realm = try? Realm()
    
    init() {
        checkForCorruptDB()
    }
    
    static let shared: DataBaseManager = DataBaseManager()
    
    func getWeatherData(forCity city: String) -> [ForecastEntity] {
        guard let realm = realm else { return  [] }
        let forecast = realm.objects(ForecastEntity.self).toArray()
        return forecast.filter({$0.cityName == city})
    }
    
    func checkForCorruptDB() {
        do {
            let _ = try Realm()
        } catch {
            try? FileManager.default.removeItem(at: Realm.Configuration.defaultConfiguration.fileURL!)
        }
    }
    
    func saveWeatherData(cityForcast: ForecastEntity) {
        guard let realm = realm else { return }
         try? realm.write {
            realm.add(cityForcast)
        }
    }
    
    func deleteAll() {
        realm?.beginWrite()
        realm?.deleteAll()
        do {
            try realm?.commitWrite()
            print("deleted")
        } catch {
            print(error)
        }
    }
}
