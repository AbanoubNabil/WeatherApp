//
//  Defualts.swift
//  WeatherApp
//
//  Created by Abanoub Nabil on 8/7/21.
//

import Foundation

public let defaults = UserDefaults.standard

open class DefaultsKeys {
    init() {}
}

open class DefaultsKey<ValueType>: DefaultsKeys {
    public let key: String
    init(_ key: String) {
        self.key = key
        super.init()
    }
}

extension UserDefaults {
    subscript<T: Codable>(key: DefaultsKey<T>) -> T? {
        get {
            guard let data = object(forKey: key.key) as? Data
            else { return nil }

            let decoder = JSONDecoder()
            let dictionary = try? decoder.decode([String: T].self, from: data)
            return dictionary?["top"]
        }
        set {
            guard let value = newValue else {
                return set(nil, forKey: key.key)
            }
            let encoder = JSONEncoder()
            let data = try? encoder.encode(["top": value])
            set(data, forKey: key.key)
        }
    }
}

extension DefaultsKeys {
}
