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
    @IBAction func searchCity(_ sender: Any) {
        presenter.didPressSearch(with: cityTextField.text ?? "")
    }
    
    // MARK: - DeInit
    deinit {
         debugPrint(CityForcastListViewController.className + " Release from Momery")
    }
}

extension CityForcastListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.forecastCountItemsCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "")
        
        return cell ?? UITableViewCell()
    }
}

extension CityForcastListViewController: CityForcastListViewProtocol {
    func updateForcastData() {
        tableView.reloadData()
    }
}
