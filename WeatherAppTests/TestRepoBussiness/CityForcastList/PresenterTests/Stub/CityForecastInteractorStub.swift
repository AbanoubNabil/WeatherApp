//
//  CityForecastInteractorStub.swift
//  WeatherAppTests
//
//  Created by Abanoub Nabil on 8/10/21.
//

import Foundation
@testable import WeatherApp

class CityForecastInteractorStub: NSObject, CityForcastListInteractorProtocol {
    var presenter: CityForcastListOutputInteractorProtocol?
    
    var remoteDataSource: CityForcastListRemoteDataSourceProtocol
    
    var localDataSource: CityForcastListLocalDataSourceProtocol
    
    var resultToBeReturned: Result<ForecastResponse, Error>?
    
    func fetchCityForecast(city: String) {
        switch resultToBeReturned! {
        case let .success(response):
            presenter?.forecastListFetchedSuccessfully(forecastList: response.forecast.compactMap({$0.main}))
        case .failure:
            presenter?.forecastListFetchedWithError(AppError())
        }
        
    }
    
    init(remoteDataSource: CityForcastListRemoteDataSourceProtocol, localDataSource: CityForcastListLocalDataSourceProtocol) {
        self.remoteDataSource = remoteDataSource
        self.localDataSource = localDataSource
    }
}
