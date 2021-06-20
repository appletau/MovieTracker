//
//  GenresAPI.swift
//  MovieTracker
//
//  Created by tautau on 2020/10/26.
//  Copyright © 2020 tautau. All rights reserved.
//

import Foundation
import Moya

enum GenresAPI {
  struct GetMovieCategory: BaseTargetType {
    var path: String { return "/genre/movie/list" }
    var task: Task { return .requestParameters(parameters: parameters, encoding: URLEncoding.default) }
    
    private let parameters: [String: Any]
    
    init() {
      parameters = [RequestParameterKey.apiKey: Constant.TMDB.apiKey,
                    RequestParameterKey.language: ConfigurationManger.shared.selectedLanguageRelay.value.isoValue]
    }
  }
}
