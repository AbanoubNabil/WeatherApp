//
//  CityForcastListViewController.swift
//  WeatherApp
//
//  Created by Abanoub Nabil on 8/7/21.
//

import UIKit

class CityForcastListViewController: UIViewController, CityForcastListViewProtocol {
    // MARK: - Outlets
    // MARK: - Attributes
    var presenter: CityForcastListPresenterProtocol!
    // MARK: - Init
    init() {
        super.init(nibName: CityForcastListViewController.className, bundle: nil)
    }
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
    // MARK: - Methods
    // MARK: - Actions
    // MARK: - DeInit
    deinit {
         debugPrint(CityForcastListViewController.className + " Release from Momery")
    }
}
