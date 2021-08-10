//
//  CityForcastListRemoteDataSourceStub.swift
//  WeatherAppTests
//
//  Created by Abanoub Nabil on 8/10/21.
//

import UIKit
@testable import WeatherApp

class CityForcastListRemoteDataSourceStub: CityForcastListRemoteDataSourceProtocol {
    
    var forcastResultToBeReturn: Result<ForecastResponse, Error>!
    
    func fetchForecast(
        params: RequestCityForecastModel,
        completionHandler: @escaping ((Result<ForecastResponse, Error>) -> Void)
    ) {
        completionHandler(forcastResultToBeReturn)
    }
    
}
