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
protocol CityForcastListRemoteDataSourceProtocol: AnyObject, ForecastRemoteServiceProtocol {

}

// MARK: - CityForcastList Interactor

protocol CityForcastListInteractorProtocol: AnyObject {
    var presenter: CityForcastListOutputInteractorProtocol? { get set }
    var remoteDataSource: CityForcastListRemoteDataSource? { get set }
    // Presenter -> Interactor
    func fetchCityForecast(city: String)
}

protocol CityForcastListOutputInteractorProtocol: AnyObject {
    // Interactor -> Presenter
}

// MARK: - CityForcastList Preseneter

protocol CityForcastListPresenterProtocol: AnyObject {
    var view: CityForcastListViewProtocol? { get set}
    var interactor: CityForcastListInteractorProtocol? { get set}
    var router: CityForcastListRouterProtocol? { get set }
    // view -> Presenter
    func viewDidLoad()
}

// MARK: - CityForcastList View

protocol CityForcastListViewProtocol: AnyObject {
    var presenter: CityForcastListPresenterProtocol! { get set }
    // Presenter -> View
}
