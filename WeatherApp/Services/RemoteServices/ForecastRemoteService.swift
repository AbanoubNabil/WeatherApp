//
//  ForecastService.swift
//  WeatherApp
//
//  Created by Abanoub Nabil on 8/7/21.
//

import Foundation

class ForecastRemoteService: APIService<ForecastEndPoint>, ForecastRemoteServiceProtocol {
    func fetchForecast(params: RequestCityForecastModel, completionHandler: @escaping ((Result<ForecastResponse, Error>) -> Void)) {
        
        request(target: .forecast(params: params), objType: ForecastResponse.self, completionHandler: completionHandler)
    }
}
