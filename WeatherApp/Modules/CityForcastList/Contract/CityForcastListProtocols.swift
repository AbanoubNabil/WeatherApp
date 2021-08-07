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

// MARK: - CityForcastList Interactor

protocol CityForcastListInputInteractorProtocol: class {
    var presenter: CityForcastListOutputInteractorProtocol? { get set }
    // Presenter -> Interactor
}

protocol CityForcastListOutputInteractorProtocol: class {
    // Interactor -> Presenter
}

// MARK: - CityForcastList Preseneter

protocol CityForcastListPresenterProtocol: class {
    var view: CityForcastListViewProtocol? { get set}
    var interactor: CityForcastListInputInteractorProtocol? { get set}
    var router: CityForcastListRouterProtocol? { get set }
    // view -> Presenter
    func viewDidLoad()
}

// MARK: - CityForcastList View

protocol CityForcastListViewProtocol: class {
    var presenter: CityForcastListPresenterProtocol! { get set }
    // Presenter -> View
}
