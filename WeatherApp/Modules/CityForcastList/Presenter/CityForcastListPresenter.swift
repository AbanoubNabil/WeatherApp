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
    var interactor: CityForcastListInteractorProtocol?
    var router: CityForcastListRouterProtocol?
    private var forecastData: [Main] = []
    
    
    // MARK: - Init
    init(view: CityForcastListViewProtocol?, interactor: CityForcastListInteractorProtocol, router: CityForcastListRouterProtocol ) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    // MARK: - Methods
    func viewDidLoad() {
        
    }
    
    func didPressSearch(with city: String) {
        interactor?.fetchCityForecast(city: city)
    }
    
    func dequeueCellAt(index: Int) -> Main {
        return forecastData[index]
    }
    
    var forecastCountItemsCount: Int {
        return forecastData.count
    }
    
}

// MARK: - CityForcastListOutputInteractorProtocol Implementation
extension CityForcastListPresenter: CityForcastListOutputInteractorProtocol {
    func forecastListFetchedSuccessfully(forecastList: [Main]) {
        print(forecastList)
        forecastData = forecastList
        view?.updateForcastData()
    }
    
    func forecastListFetchedWithError(_ error: Error) {

    }
    
}
