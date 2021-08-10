//
//  ForecastLocalService.swift
//  WeatherApp
//
//  Created by Abanoub Nabil on 8/7/21.
//

import Foundation

class ForecastLocalService: ForecastLocalServiceProtocol {
    func fetchForecast(params: RequestCityForecastModel) -> [Main] {
        return DataBaseManager.shared.getWeatherData(forCity: params.city).map({ $0.toModel() })
    }
    
    func saveForecast(forcast: [Main]) {
        DataBaseManager.shared.deleteAll()
        for main in forcast {
            DataBaseManager.shared.saveWeatherData(cityForcast: main.toRealm())
        }
    }
}
