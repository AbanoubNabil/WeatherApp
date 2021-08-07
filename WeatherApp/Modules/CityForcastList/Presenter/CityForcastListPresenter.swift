//
//  CityForcastListPresenter.swift
//  WeatherApp
//
//  Created by Abanoub Nabil on 8/7/21.
//

import Foundation

class CityForcastListPresenter: CityForcastListPresenterProtocol {
    // MARK: - Attributes
    weak var view: CityForcastListViewProtocol?
    var interactor: CityForcastListInputInteractorProtocol?
    var router: CityForcastListRouterProtocol?
    // MARK: - Init
    init(view: CityForcastListViewProtocol?, interactor: CityForcastListInputInteractorProtocol, router: CityForcastListRouterProtocol ) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    // MARK: - Methods
    func viewDidLoad() {
    }
}
// MARK: - CityForcastListOutputInteractorProtocol Implementation
extension CityForcastListPresenter: CityForcastListOutputInteractorProtocol {
}
