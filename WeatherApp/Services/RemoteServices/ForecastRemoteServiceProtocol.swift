//
//  ForecastRemoteServiceProtocol.swift
//  WeatherApp
//
//  Created by Abanoub Nabil on 8/7/21.
//

import Foundation

protocol ForecastRemoteServiceProtocol: AnyObject {
    func fetchForecast(params: RequestCityForecastModel, completionHandler: @escaping ((Result<ForecastResponse, Error>) -> Void))
}
