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
}
