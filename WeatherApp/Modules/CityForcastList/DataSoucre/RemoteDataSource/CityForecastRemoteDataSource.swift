//
//  CityForecastRemoteDataSource.swift
//  WeatherApp
//
//  Created by Abanoub Nabil on 8/7/21.
//

import Foundation

class CityForcastListRemoteDataSource: CityForcastListRemoteDataSourceProtocol {
    
    // MARK: - Attributes
    private var forecastAPISerivce: ForecastRemoteServiceProtocol

    // MARK: - Init
    init(forecastAPISerivce: ForecastRemoteServiceProtocol) {
        self.forecastAPISerivce = forecastAPISerivce
    }
    
    // MARK: - Methods
    func fetchForecast(params: RequestCityForecastModel, completionHandler: @escaping ((Result<ForecastResponse, Error>) -> Void)) {
        forecastAPISerivce.fetchForecast(params: params, completionHandler: completionHandler)
    }
}
