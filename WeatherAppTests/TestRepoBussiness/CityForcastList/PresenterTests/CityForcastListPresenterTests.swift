//
//  CityForcastListPresenterTests.swift
//  WeatherAppTests
//
//  Created by Abanoub Nabil on 8/10/21.
//

import XCTest
import Foundation

@testable import WeatherApp

class CityForcastListPresenterTests: XCTestCase {
    
    var presenter: CityForcastListPresenter!
    var viewSpy: CityForcastListViewSpy!
    var interactor: CityForecastInteractorStub!
    
    override func setUp() {
        super.setUp()
        viewSpy = CityForcastListViewSpy()
       
        let localDataSource = CityForcastListLocalDataSourceStub(forecast: [])
        let remoteDataSource = CityForcastListRemoteDataSourceStub()
        
        let router = ForecastListRouterMock()
        
        interactor = CityForecastInteractorStub(remoteDataSource: remoteDataSource, localDataSource: localDataSource)
        
        presenter =  CityForcastListPresenter(
            view: viewSpy,
            interactor: interactor,
            router: router)
        interactor.presenter = presenter
        
    }

    func testFetshForecastListFromAPINetworkFailure() {
        interactor.resultToBeReturned = .failure(AppError())
        presenter.didPressSearch(with: "Ciiii")
        XCTAssertTrue(viewSpy.didGetErrorCalled)
    }
    
    func testForecastListFetshfromAPISuccessfuly() {
        let forcast = Array(repeating: Forecast(main: Main()), count: 8)
        let coord = Coord(lat: 789, lon: 78)
        let city = City(id: 890, name: "Cairo", coord: coord, country: "Egypt", population: 789, timezone: 47, sunrise: 74, sunset: 98)
        
        interactor.resultToBeReturned = .success(ForecastResponse(cod: "", message: 89, cnt: 098, forecast: forcast, city: city))
        
        presenter.didPressSearch(with: "Cairo")
        XCTAssertTrue(viewSpy.didFetchDataFromAPISuccessfullyCalled)
    }
    
    func testFetshForecastListFromAPINetworkFailureErrorView() {
        interactor.resultToBeReturned = .failure(AppError())
        presenter.didPressSearch(with: "Ciiii")
        XCTAssertFalse(viewSpy.errorViewHidden)
    }
    
    override func tearDown() {
        super.tearDown()
        presenter = nil
        viewSpy = nil
        interactor = nil
    }

}

class ForecastListRouterMock: NSObject, CityForcastListRouterProtocol {
    
    func go(to router: CityForcastListRouter.CityForcastListRoute) {
        
    }
    
}
