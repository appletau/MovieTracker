//
//  BaseTargetType.swift
//  MovieTracker
//
//  Created by tautau on 2020/10/12.
//  Copyright © 2020 tautau. All rights reserved.
//

import Moya

protocol BaseTargetType: TargetType {}

extension BaseTargetType {
  var baseURL: URL { return URL(string: Constant.TMDB.apiDomain)! }
  var method: Moya.Method { return .get }
  var headers: [String : String]? { return nil }
  var task: Task { return .requestPlain }
  var sampleData: Data { return Data() }
}
