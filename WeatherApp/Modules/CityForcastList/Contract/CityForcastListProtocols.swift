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
    func go(to router: CityForcastListRouter.CityForcastListRoute)
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
    func forecastListFetchedFromDBSuccessfully(forecastList: [Main]) 
}

// MARK: - CityForcastList Preseneter

protocol CityForcastListPresenterProtocol: AnyObject {
    // view -> Presenter
    var view: CityForcastListViewProtocol? { get set}
    var interactor: CityForcastListInteractorProtocol? { get set}
    var router: CityForcastListRouterProtocol? { get set }
    var forecastCountItemsCount: Int { get }
    func viewDidLoad()
    func didPressSearch(with city: String)
    func dequeueCellAt(index: Int , _ cell: TableViewCellSetupProtocol)
}

// MARK: - CityForcastList View

protocol CityForcastListViewProtocol: AnyObject {
    // Presenter -> View
    var presenter: CityForcastListPresenterProtocol! { get set }
    func didFetchDataFromAPISuccessfully()
    func didFetchDataFromDBSuccessfully()
    func didGetError(model: ErrorUIModel)
}

// MARK: - CityForcastListCell presenter

protocol TableViewCellSetupProtocol: AnyObject {
    func confuguareCell(with: WeatherItemUIModel)
}

protocol ErrorViewProtocol: AnyObject {
    func configureError(model: ErrorUIModel)
}
