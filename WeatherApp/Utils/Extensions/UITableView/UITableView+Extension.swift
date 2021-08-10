//
//  UITableView+Extension.swift
//  Madina
//
//  Created by Ahmed Zaki on 03/05/2021.
//

import UIKit
extension UITableView {
    func register<T: UITableViewCell>(cellWithClass name: T.Type) {
        register(UINib(nibName: T.className, bundle: nil), forCellReuseIdentifier: T.className)
    }
    func dequeueReusableCell<T: UITableViewCell>(withClass name: T.Type, for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: T.className, for: indexPath) as? T else {
            fatalError("Couldn't find UITableViewCell for \(String(describing: name)), make sure the cell is registered with TableView")
        }
        return cell
    }
}
