//
//  ForecastResponse.swift
//  WeatherApp
//
//  Created by Abanoub Nabil on 8/7/21.
//

import Foundation

// MARK: - Welcome
struct ForecastResponse: Codable {
    let cod: String
    let message, cnt: Int
    let forecast: [Forecast]
    let city: City
}


