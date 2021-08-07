//
//  RequestCityForecastModel.swift
//  WeatherApp
//
//  Created by Abanoub Nabil on 8/7/21.
//

import Foundation

struct RequestCityForecastModel {
    // MARK: - Attributes
    var city: String
    let apiKey = "eb3010e529f6bd3ade5fa3d8f4c523b7"
    
    // MARK: - Methods
    func toDictionary() -> [String: Any] {
        let dic = NSMutableDictionary()
        dic.setValue(city, forKey: "q")
        dic.setValue(apiKey, forKey: "appid")
        return dic as? [String: Any] ?? [:]
    }
}
