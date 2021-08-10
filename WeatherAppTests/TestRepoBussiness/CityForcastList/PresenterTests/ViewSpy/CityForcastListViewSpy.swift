//
//  CityForcastListViewSpy.swift
//  WeatherAppTests
//
//  Created by Abanoub Nabil on 8/10/21.
//

import UIKit
@testable import WeatherApp

final class CityForcastListViewSpy: CityForcastListViewProtocol {
    
    var didFetchDataFromAPISuccessfullyCalled = false
    var didFetchDataFromDBSuccessfullyCalled = false
    var didGetErrorCalled = false
    
    var errorViewHidden = true
    
    var passedError: ErrorUIModel!

    var presenter: CityForcastListPresenterProtocol!
    
    func didFetchDataFromAPISuccessfully() {
        didFetchDataFromAPISuccessfullyCalled = true
        errorViewHidden = true
    }
    
    func didFetchDataFromDBSuccessfully() {
        didFetchDataFromDBSuccessfullyCalled = true
        errorViewHidden = true
    }
    
    func didGetError(model: ErrorUIModel) {
        didGetErrorCalled = true
        passedError = model
        errorViewHidden = false
    }
}
