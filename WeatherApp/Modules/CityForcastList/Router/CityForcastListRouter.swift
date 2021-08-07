//
//  CityForcastListRouter.swift
//  WeatherApp
//
//  Created by Abanoub Nabil on 8/7/21.
//

import Foundation
import UIKit
class CityForcastListRouter: CityForcastListRouterProtocol {
    // MARK: - Attributes
    
    enum CityForcastListRoute {
    }
    
    weak var viewController: UIViewController?
    
    // MARK: - Assemble
    static func assembleModule() -> UIViewController {
        let router = CityForcastListRouter()
        let forecastAPIService = ForecastRemoteService()
        let forecastRemoteDataSource = CityForcastListRemoteDataSource(forecastAPISerivce: forecastAPIService)
        let interactor = CityForcastListInteractor(remoteDataSource: forecastRemoteDataSource)
        let view = CityForcastListViewController()
        let presenter = CityForcastListPresenter(view: view, interactor: interactor, router: router)
        router.viewController = view
        interactor.presenter = presenter
        view.presenter = presenter
        return view
    }
    
    // MARK: - Routing
    func go(to router: CityForcastListRoute) {
    }
}
