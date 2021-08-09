//
//  Forecast.swift
//  WeatherApp
//
//  Created by Abanoub Nabil on 8/7/21.
//

import Foundation

// MARK: - Forecast
struct Forecast: Codable {
    var main: Main?
    var dt: Int = 0
    
    init() {
        main?.dt = self.dt
    }
    enum CodingKeys: String, CodingKey {
        case main, dt
    }
}
