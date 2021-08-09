//
//  Main.swift
//  WeatherApp
//
//  Created by Abanoub Nabil on 8/7/21.
//

import Foundation

// MARK: - Main
struct Main: Codable {
    let temp, feelsLike, tempMin, tempMax: Double
    let pressure: Double
    var cityName: String = ""
    var dt: Int = 0
    
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
