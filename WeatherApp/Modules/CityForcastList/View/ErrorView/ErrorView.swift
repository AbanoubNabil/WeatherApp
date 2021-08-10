//
//  ErrorView.swift
//  WeatherApp
//
//  Created by Abanoub Nabil on 8/10/21.
//

import UIKit

class ErrorView: UIView {
    
    @IBOutlet weak var errorSubTitle: UILabel!
    @IBOutlet weak var errorTitle: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadNibFromFile()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadNibFromFile()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureError(model: ErrorUIModel) {
        errorTitle.text = model.title
        errorSubTitle.text = model.subtitle
    }
}
