//
//  ConfigurationAPI.swift
//  MovieTracker
//
//  Created by tautau on 2020/10/25.
//  Copyright © 2020 tautau. All rights reserved.
//

import Foundation
import Moya


enum ConfigurationAPI{
  
  struct GetConfiguration: BaseTargetType {
    
    var path: String { return "/configuration" }
    var task: Task { return .requestParameters(parameters: [RequestParameterKey.apiKey: Constant.TMDB.apiKey], encoding: URLEncoding.default) }
  }
  
}
