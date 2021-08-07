//
//  CommonHeaderProtocol.swift
//  WeatherApp
//
//  Created by Abanoub Nabil on 8/7/21.
//

import Foundation

protocol CommonHeaderProtocol {
    var defaultHeader: [String: String] { get }
}

extension CommonHeaderProtocol {
    var defaultHeader: [String: String] {
        return [
            "Accept-Encoding": "gzip, deflate, br",
            "Accept": "application/json"
        ]
    }
}

//    if let token = UserDefaults.standard.string(forKey: "accessToken") {
//        headers["Authorization"] = "Bearer \(token)"
//    }
//    headers["Content-type"] = "application/json"
//    headers["Accept"] = "application/json"
//    headers["lang"] = MOLHLanguage.currentAppleLanguage()
