//
//  Main.swift
//  WeatherApp
//
//  Created by Abanoub Nabil on 8/7/21.
//

import Foundation

// MARK: - Main
struct Main: Codable {
    var temp: Double = 0
    var feelsLike: Double = 0
    var tempMin: Double = 0
    var tempMax: Double = 0
    var pressure: Double = 0
    var cityName: String = ""
    var dt: Int = 0
    
    init() {
    }
    
    init(temp: Double, feelsLike: Double, tempMin: Double, tempMax: Double, pressure: Double) {
        self.temp = temp
        self.feelsLike = feelsLike
        self.tempMin = tempMin
        self.tempMax = tempMax
        self.pressure = pressure
    }
    
    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure
    }
}

extension Main {
    
    func toRealm() -> ForecastEntity {
        return ForecastEntity(temp: temp, feelsLike: feelsLike, tempMin: tempMin, tempMax: tempMax, pressure: pressure, cityName: cityName)
    }
}
