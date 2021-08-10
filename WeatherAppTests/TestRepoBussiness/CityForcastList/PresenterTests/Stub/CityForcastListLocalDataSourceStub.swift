//
//  Stub.swift
//  WeatherAppTests
//
//  Created by Abanoub Nabil on 8/10/21.
//

import Foundation
@testable import WeatherApp

class CityForcastListLocalDataSourceStub: CityForcastListLocalDataSourceProtocol {
    var forecast: [Main]
    
    init(forecast: [Main]) {
        self.forecast = forecast
    }
    
    func fetchForecast(params: RequestCityForecastModel) -> [Main] {
        return forecast
    }
    
    func saveForecast(forcast: [Main]) {
        
    }
}
