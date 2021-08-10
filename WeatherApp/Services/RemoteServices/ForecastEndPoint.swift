//
//  ForecastEndPoint.swift
//  WeatherApp
//
//  Created by Abanoub Nabil on 8/7/21.
//

import Moya

// MARK: - Forecast End Point

enum ForecastEndPoint {
    case forecast(params: RequestCityForecastModel)
}

// MARK: - Target Type

extension ForecastEndPoint: TargetType, EnvironmentProtocol, CommonHeaderProtocol {
    var baseURL: URL { apiBaseURL }
    
    var path: String { "/forecast" }
    
    var method: Moya.Method { .get }
    
    var headers: [String: String]? { return defaultHeader }
    
    var sampleData: Data { Data() }
    
    var task: Task {
        switch self {
        case let .forecast(params):
            return .requestParameters(parameters: params.toDictionary(), encoding: URLEncoding.queryString)
        }
    }
}
