//
//  ForecastEntity.swift
//  WeatherApp
//
//  Created by Abanoub Nabil on 8/7/21.
//

import RealmSwift

class ForecastEntity: Object {
    // MARK: - Attributes
    @Persisted var temp: Double = 0
    @Persisted var tempMin: Double = 0
    @Persisted var tempMax: Double = 0
    @Persisted var feelsLike: Double = 0
    @Persisted var pressure: Double = 0
    @Persisted var cityName: String = ""
    
    // MARK: - Methods    
    convenience init(temp: Double, feelsLike: Double, tempMin: Double, tempMax: Double, pressure: Double, cityName: String) {
        self.init()
        self.temp = temp
        self.feelsLike = feelsLike
        self.tempMin = tempMin
        self.tempMax = tempMax
        self.pressure = pressure
        self.cityName = cityName
    }
}

extension ForecastEntity {
    func toModel() -> Main {
        return Main(temp: temp, feelsLike: feelsLike, tempMin: tempMin, tempMax: tempMax, pressure: pressure)
    }
}
