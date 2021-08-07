//
//  CityForecastRemoteDataSource.swift
//  WeatherApp
//
//  Created by Abanoub Nabil on 8/7/21.
//

import Foundation

class CityForcastListRemoteDataSource: CityForcastListRemoteDataSourceProtocol {
    
    // MARK: - Attributes
    var forecastAPISerivce: ForecastRemoteServiceProtocol?

    // MARK: - Init
    init(forecastAPISerivce: ForecastRemoteServiceProtocol) {
        self.forecastAPISerivce = forecastAPISerivce
    }
}
