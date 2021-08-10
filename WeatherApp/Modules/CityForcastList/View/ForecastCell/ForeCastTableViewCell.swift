//
//  ForeCastTableViewCell.swift
//  WeatherApp
//
//  Created by Abanoub Nabil on 8/9/21.
//

import UIKit

class ForeCastTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var dateTime: UILabel!
    @IBOutlet weak var currentTemp: UILabel!
    @IBOutlet weak var minTemp: UILabel!
    @IBOutlet weak var maxTemp: UILabel!
    
    // MARK: - Methods
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

extension ForeCastTableViewCell: TableViewCellSetupProtocol {
    func confuguareCell(with: WeatherItemUIModel) {
        let item = with
        self.dateTime.text = item.day
        self.currentTemp.text = item.currentTemperature
        self.minTemp.text = item.minTemperature
        self.maxTemp.text = item.maxTemperature
    }
}
