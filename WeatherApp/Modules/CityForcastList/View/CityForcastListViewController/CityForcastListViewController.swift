//
//  CityForcastListViewController.swift
//  WeatherApp
//
//  Created by Abanoub Nabil on 8/7/21.
//

import UIKit

class CityForcastListViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var hintView: UIView!
    
    // MARK: - Attributes
    var presenter: CityForcastListPresenterProtocol!
    var errorView: ErrorView?
    
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
        tableView.register(cellWithClass: ForeCastTableViewCell.self)
    }
    
    // MARK: - Actions
    @IBAction func searchCity(_ sender: Any) {
        let city = cityTextField.text ?? ""
        presenter.didPressSearch(with: city)
        cityTextField.text = ""
    }
    
    // MARK: - DeInit
    deinit {
         debugPrint(CityForcastListViewController.className + " Release from Momery")
    }
    
    // MARK: - Methods
    /// adding the error view as a tableView background
    func didGetError(model: ErrorUIModel) {
        errorView = ErrorView(frame: tableView.bounds)
        errorView?.configureError(model: model)
        tableView.backgroundView = errorView
    }
    
    /// remove the error view from tableView background
    private func removeErrorView() {
        tableView.backgroundView = nil
        errorView = nil
    }
}

// MARK: - TableViewDelegate, DataSource
extension CityForcastListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.forecastCountItemsCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ForeCastTableViewCell") as? ForeCastTableViewCell
        if let cell = cell {
            presenter.dequeueCellAt(index: indexPath.row, cell)
        }
        return cell ?? UITableViewCell()
    }
}

// MARK: - DelegatedMethods
extension CityForcastListViewController: CityForcastListViewProtocol {
    func didFetchDataFromAPISuccessfully() {
        hintView.isHidden = true
        tableView.reloadData()
        removeErrorView()
    }
    
    func didFetchDataFromDBSuccessfully() {
        hintView.isHidden = false
        tableView.reloadData()
        removeErrorView()
    }
}
