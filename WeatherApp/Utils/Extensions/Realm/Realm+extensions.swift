//
//  Realm.swift
//  WeatherApp
//
//  Created by Abanoub Nabil on 8/7/21.
//

import RealmSwift

extension Results {
    func toArray() -> [Element] {
      return compactMap { $0 }
    }
 }
