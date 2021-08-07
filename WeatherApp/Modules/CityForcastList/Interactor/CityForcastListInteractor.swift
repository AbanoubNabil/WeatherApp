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
    var remoteDataSource: CityForcastListRemoteDataSource?
    
    // MARK: - Init
    init(remoteDataSource: CityForcastListRemoteDataSource) {
        self.remoteDataSource = remoteDataSource
    }
    
    // MARK: - Methods
    
    func fetchCityForecast(city: String) {
        remoteDataSource?.fetchForecast(params: RequestCityForecastModel(city: city), completionHandler: { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case let .success(response): print(response)
                // show api
                // cache data in local datasource
            case let .failure(error):
                // call local data soruce for get local data
                // if there is data return it
                // not show error secreen
                print(error)
            }
        })
    }
}
