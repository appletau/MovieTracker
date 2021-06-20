//
//  ConfigurationRepository.swift
//  MovieTracker
//
//  Created by 黃韋韜 on 2021/6/20.
//  Copyright © 2021 tautau. All rights reserved.
//

import Foundation
import RxSwift

protocol ConfigurationRepositoryLogic: BaseRepository {
  func getConfiguration () -> Single<ConfigurationModel>
}

final class ConfigurationRepository: BaseRepository, ConfigurationRepositoryLogic {
  
  func getConfiguration () -> Single<ConfigurationModel> {
    return sendRequest(target: ConfigurationAPI.GetConfiguration())
      .mapBySnakeDecoder(ConfigurationModel.self)
  }
}
