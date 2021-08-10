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
        forecastData = forecastList
        view?.didFetchDataFromAPISuccessfully()
    }
    
    func forecastListFetchedFromDBSuccessfully(forecastList: [Main]) {
        forecastData = forecastList
        view?.didFetchDataFromDBSuccessfully()
    }
    
    func forecastListFetchedWithError(_ error: Error) {
        view?.didGetError(model: ErrorUIModel(title: "error", subtitle: error.localizedDescription))
    }
}

extension CityForcastListPresenter {
    func dequeueCellAt(index: Int, _ cell: TableViewCellSetupProtocol) {
        let forecast = forecastData[index]
        let cellModel = WeatherItemUIModel(day: "\(forecast.dt)", currentTemperature: "\(forecast.temp)", minTemperature: "\(forecast.tempMin)", maxTemperature: "\(forecast.tempMax)")
        cell.confuguareCell(with: cellModel)
    }
}
