//
//  WebService.swift
//  MovieTracker
//
//  Created by tautau on 2020/10/12.
//  Copyright © 2020 tautau. All rights reserved.
//

import Moya
import RxSwift

protocol WebServiceLogic: class {
  func sendRequest(target: TargetType) -> Single<Response>
}

final class WebService: WebServiceLogic {
  static let shared = WebService()
  
  private (set) lazy var provider: MoyaProvider<MultiTarget> = {
    return configureProvider() 
  }()
  
  private init() {}
  
  func sendRequest(target: TargetType) -> Single<Response> {
    let multiTargetType: MultiTarget = MultiTarget(target)
    return provider.rx.request(multiTargetType)
  }
  
  
  
  private func JsonResponseDataFormatter(_ data: Data) -> String {
    do {
      let dataAsJSON = try JSONSerialization.jsonObject(with: data)
      let prettyData = try JSONSerialization.data(withJSONObject: dataAsJSON, options: .prettyPrinted)
      return String(data: prettyData, encoding: .utf8) ?? String(data: data, encoding: .utf8) ?? ""
    } catch {
      return String(data: data, encoding: .utf8) ?? ""
    }
  }
  
  private func configureProvider() -> MoyaProvider<MultiTarget> {
    let pluginConfiguration: NetworkLoggerPlugin.Configuration = .init(formatter: .init(responseData: JsonResponseDataFormatter),
                                                                       logOptions: .verbose)
    let logPlugin: NetworkLoggerPlugin = .init(configuration: pluginConfiguration)
    
    let sessionConfiguration = URLSessionConfiguration.default
    sessionConfiguration.headers = .default
    sessionConfiguration.timeoutIntervalForRequest = 20
    let session = Session(configuration: sessionConfiguration,
                          startRequestsImmediately: false)
    return .init(callbackQueue: .global(),
                 session: session,
                 plugins: [logPlugin])
  }
}
