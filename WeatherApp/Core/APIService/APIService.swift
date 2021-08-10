//
//  APIService.swift
//  WeatherApp
//
//  Created by Abanoub Nabil on 8/7/21.
//

import Moya

class RemoteServiceType: EnvironmentProtocol {
    // MARK: - Attributes
    var isLive: Bool { currentEnvironment != .test }
    static var shared = RemoteServiceType()
    
    // MARK: - Init
    private init() {}
}

class APIService<T: TargetType> {
    
    // MARK: - Attributes
    
    /// Moya Generic  API Provider
    private let provider: MoyaProvider<T>
    
    /// Format Request  Data to String
    private let jsonDataFormatter = { (_ data: Data) -> String  in
        do {
            let dataAsJSON = try JSONSerialization.jsonObject(with: data)
            let prettyData = try JSONSerialization.data(withJSONObject: dataAsJSON, options: .prettyPrinted)
            return String(data: prettyData, encoding: .utf8) ?? ""
        } catch {
            return String(data: data, encoding: .utf8) ?? ""
        }
    }
    
    /// Seting chache policy
    private let endpointClosure = { (target: T) -> Endpoint in
       let defaultEndpoint = MoyaProvider.defaultEndpointMapping(for: target)
       var request = try? defaultEndpoint.urlRequest()
       request?.cachePolicy = .useProtocolCachePolicy
       return defaultEndpoint
   }
    
    // MARK: - Init
    init() {
        let stubClosure = RemoteServiceType.shared.isLive ? MoyaProvider<T>.neverStub : MoyaProvider<T>.immediatelyStub
        provider = MoyaProvider<T>(endpointClosure: endpointClosure,
                                   stubClosure: stubClosure,
                                   session: Session.default,
                                   plugins: [NetworkLoggerPlugin(configuration: .init(formatter: .init( requestData: jsonDataFormatter, responseData: jsonDataFormatter), logOptions: .verbose))])
        // seting request time out
        provider.session.sessionConfiguration.timeoutIntervalForRequest = 20
        provider.session.sessionConfiguration.timeoutIntervalForResource = 20
    }
    
    // MARK: - Methods
    
    /// make network call
    /// - Parameters:
    ///   - target: Protocol used to define the specifications necessary for a `MoyaProvider`.
    ///   - objType: Mapped object type that return form the netwok call
    ///   - completionHandler: clousre Return Result Pattern that  has to case if network success it will returns the mapped object else returns error
    func request<C: Codable>(target: T, objType: C.Type, completionHandler:  @escaping (_ result: Result<C, Error>) -> Void) {
        provider.request(target) { (result) in
            switch result {
            case .success(let response):
                do {
                    let successResponse = try response.filterSuccessfulStatusCodes()
                    let object = try JSONDecoder().decode(objType, from: successResponse.data)
                    completionHandler(.success(object))
                } catch let error {
                    completionHandler(.failure(error))
                }
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
}
