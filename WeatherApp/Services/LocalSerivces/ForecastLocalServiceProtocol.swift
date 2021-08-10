//
//  ForecastLocalServiceProtocol.swift
//  WeatherApp
//
//  Created by Abanoub Nabil on 8/7/21.
//

import Foundation

protocol ForecastLocalServiceProtocol: AnyObject {
    func fetchForecast(params: RequestCityForecastModel) -> [Main]
    func saveForecast(forcast: [Main])
}
