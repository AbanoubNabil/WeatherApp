//
//  CityForcastListProtocols.swift
//  WeatherApp
//
//  Created by Abanoub Nabil on 8/7/21.
//

import Foundation
import UIKit

// MARK: - CityForcastList Router

protocol CityForcastListRouterProtocol {
    // Presenter -> Router
    var viewController: UIViewController? { get set }
    func go(to router: CityForcastListRouter.CityForcastListRoute)
    static func assembleModule() -> UIViewController
}

// MARK: - CityForcastList Remote DataSource

protocol CityForcastListRemoteDataSourceProtocol: ForecastRemoteServiceProtocol {
}

// MARK: - CityForcastList Local DataSource

protocol CityForcastListLocalDataSourceProtocol: ForecastLocalServiceProtocol {
}

// MARK: - CityForcastList Interactor

protocol CityForcastListInteractorProtocol: AnyObject {
    var presenter: CityForcastListOutputInteractorProtocol? { get set }
    var remoteDataSource: CityForcastListRemoteDataSourceProtocol { get set }
    var localDataSource: CityForcastListLocalDataSourceProtocol { get set }
    // Presenter -> Interactor
    func fetchCityForecast(city: String)
}

protocol CityForcastListOutputInteractorProtocol: AnyObject {
    // Interactor -> Presenter
    func forecastListFetchedSuccessfully(forecastList: [Main])
    func forecastListFetchedWithError(_ error: Error)
}

// MARK: - CityForcastList Preseneter

protocol CityForcastListPresenterProtocol: AnyObject {
    var view: CityForcastListViewProtocol? { get set}
    var interactor: CityForcastListInteractorProtocol? { get set}
    var router: CityForcastListRouterProtocol? { get set }
    var forecastCountItemsCount:Int { get }
    // view -> Presenter
    func viewDidLoad()
    func didPressSearch(with city: String)
    func dequeueCellAt(index: Int) -> Main
}

// MARK: - CityForcastList View

protocol CityForcastListViewProtocol: AnyObject {
    var presenter: CityForcastListPresenterProtocol! { get set }
    func updateForcastData()
    // Presenter -> View
}
