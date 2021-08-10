//
//  UIView+LoadNib.swift
//  WeatherApp
//
//  Created by Abanoub Nabil on 8/10/21.
//

import UIKit

extension UIView {
    func loadNibFromFile() {
        let bundle = Bundle(for: type(of: self))
        let nibName = type(of: self).description().components(separatedBy: ".").last!
        let nib = UINib(nibName: nibName, bundle: bundle)

        if let view = nib.instantiate(withOwner: self, options: nil).first as? UIView {
            view.frame = bounds
            view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            self.addSubview(view)
        }
    }
}
