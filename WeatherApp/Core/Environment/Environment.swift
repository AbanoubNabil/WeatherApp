//
//  Environment.swift
//  WeatherApp
//
//  Created by Abanoub Nabil on 8/7/21.
//

import Foundation

enum Environment: String {
    case development = "DEVELOPMENT"
    case production = "PRODUCTION"
    case test = "TEST"
    
    // MARK: - Current Environment
    static var current: Environment {
        let env = UserDefaults.standard.value(forKey: "CurrentEnvironment") as? String
        return Environment(rawValue: env ?? "") ?? .development
    }
    
    // MARK: - Domain
    var serverDomain: String {
        return "openweathermap.org/data/2.5/forecast"
    }
    var apiDomain: String {
        return "api.\(serverDomain)"
    }
    
    // MARK: - URL
    var baseURL: URL {
        return URL(string: apiDomain)!
    }
}
