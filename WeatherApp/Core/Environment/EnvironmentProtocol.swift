//
//  EnvironmentProtocol.swift
//  WeatherApp
//
//  Created by Abanoub Nabil on 8/7/21.
//

import Foundation

protocol EnvironmentProtocol {
    var currentEnvironment: Environment { get }
    var apiBaseURL: URL { get }
}

extension EnvironmentProtocol {
    var currentEnvironment: Environment {
        Environment.current
    }
    var apiBaseURL: URL {
        return Environment.current.baseURL
    }
}
