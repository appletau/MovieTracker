//
//  BaseTargetType.swift
//  MovieTracker
//
//  Created by tautau on 2020/10/12.
//  Copyright © 2020 tautau. All rights reserved.
//

import Moya

enum TMDB {
  static let apiDomain = "https://api.themoviedb.org/3"
  static let apiKey = "776d12d56ba8f4d04ca4622992ddd75c"
}

protocol BaseTargetType: TargetType {}

extension BaseTargetType {
  var baseURL: URL { return URL(string: TMDB.apiDomain)! }
  var method: Moya.Method { return .get }
  var headers: [String : String]? { return nil }
  var task: Task { return .requestPlain }
  var sampleData: Data { return Data() }
}
