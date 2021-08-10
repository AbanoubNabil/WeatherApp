//
//  CityForecastLocalDataSource.swift
//  WeatherApp
//
//  Created by Abanoub Nabil on 8/7/21.
//
import Foundation

class CityForcastLocalDataSource: CityForcastListLocalDataSourceProtocol {

    // MARK: - Attributes
    private var forecastLocalSerivce: ForecastLocalServiceProtocol

    // MARK: - Init
    init(forecastAPISerivce: ForecastLocalServiceProtocol) {
        self.forecastLocalSerivce = forecastAPISerivce
    }
    
    // MARK: - Methods
    func fetchForecast(params: RequestCityForecastModel) -> [Main] {
        return forecastLocalSerivce.fetchForecast(params: params)
    }
    
    func saveForecast(forcast: [Main]) {
        forecastLocalSerivce.saveForecast(forcast: forcast)
    }
}
