//
//  CityForcastListInteractor.swift
//  WeatherApp
//
//  Created by Abanoub Nabil on 8/7/21.
//

import Foundation

class CityForcastListInteractor: CityForcastListInteractorProtocol {
    // MARK: - Attributes
    
    weak var presenter: CityForcastListOutputInteractorProtocol?
    var remoteDataSource: CityForcastListRemoteDataSourceProtocol
    var localDataSource: CityForcastListLocalDataSourceProtocol
    
    // MARK: - Init
    init(remoteDataSource: CityForcastListRemoteDataSourceProtocol, localDataSource: CityForcastListLocalDataSourceProtocol) {
        self.remoteDataSource = remoteDataSource
        self.localDataSource = localDataSource
    }
    
    // MARK: - Methods
    
    func fetchCityForecast(city: String) {
        remoteDataSource.fetchForecast(params: RequestCityForecastModel(city: city), completionHandler: { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case let .success(response): print(response)
                // sent data To Presenter
                let cityName = response.city.name
                let cityForecast = response.forecast.map({ (forecast) -> Main in
                    let forecastItem = forecast
                    var main = forecast.main
                    main?.cityName = cityName
                    main?.dt = forecastItem.dt
                    return main!
                })
                self.presenter?.forecastListFetchedSuccessfully(forecastList: cityForecast)
                // cache data in local datasource
                self.localDataSource.saveForecast(forcast: cityForecast)
            case let .failure(error):
                // call local data soruce for get local data
                let cityForecast = self.localDataSource.fetchForecast(params: RequestCityForecastModel(city: city))
                if cityForecast.isEmpty { // not show error secreen
                    self.presenter?.forecastListFetchedWithError(error)
                } else { // sent data To Presenter
                    self.presenter?.forecastListFetchedSuccessfully(forecastList: cityForecast)
                }
            }
        })
    }
}
