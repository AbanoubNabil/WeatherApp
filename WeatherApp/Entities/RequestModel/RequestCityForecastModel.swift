//
//  RequestCityForecastModel.swift
//  WeatherApp
//
//  Created by Abanoub Nabil on 8/7/21.
//

import Foundation

struct RequestCityForecastModel: Codable {
    // MARK: - Attributes
    var city: String
    let apiKey = "eb3010e529f6bd3ade5fa3d8f4c523b7"
    
    enum CodingKeys: String, CodingKey {
        case city = "q"
        case apiKey = "appid"
    }
}
