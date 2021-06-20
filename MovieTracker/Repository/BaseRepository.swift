//
//  BaseRepository.swift
//  MovieTracker
//
//  Created by 黃韋韜 on 2021/6/20.
//  Copyright © 2021 tautau. All rights reserved.
//

import Foundation
import Moya
import RxSwift

class BaseRepository {
  private let webService: WebServiceLogic
  
  init(webService: WebServiceLogic = WebService.shared) {
    self.webService = webService
  }
  
  func sendRequest(target: TargetType) -> Single<Response> {
    return webService.sendRequest(target: target)
  }
}
