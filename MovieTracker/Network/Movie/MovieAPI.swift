//
//  MovieAPI.swift
//  MovieTracker
//
//  Created by tautau on 2020/11/1.
//  Copyright © 2020 tautau. All rights reserved.
//

import Foundation
import Moya

enum MovieAPI {
  
  struct GetMovieList: BaseTargetType {
    
    enum ListType {
      case latest, nowPlaying, popular, topRated, upcoming
      
      var requestPath: String {
        switch self {
        case .latest:
          return "movie/latest"
        case .nowPlaying:
          return "movie/now_playing"
        case .popular:
          return "movie/popular"
        case .topRated:
          return "movie/top_rated"
        case .upcoming:
          return "movie/upcoming"
        }
      }
    }
    
    var path: String { return type.requestPath }
    var task: Task { return .requestParameters(parameters: parameters , encoding: URLEncoding.default)  }
    
    private let type: ListType
    private let parameters: [String: Any]
    
    init(type: ListType,
         page: Int,
         region: String? = nil) {
      var params: [String: Any] = [RequestParameterKey.apiKey: Constant.TMDB.apiKey,
                                   RequestParameterKey.language: ConfigurationManger.shared.selectedLanguageRelay.value.isoValue,
                                   RequestParameterKey.page: page]
      if let region = region{
        params[RequestParameterKey.region] = region
      }
      parameters = params
      self.type = type
    }
  }
}
