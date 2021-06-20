//
//  GenresRepository.swift
//  MovieTracker
//
//  Created by 黃韋韜 on 2021/6/20.
//  Copyright © 2021 tautau. All rights reserved.
//

import Foundation
import RxSwift

protocol GenresRepositoryLogic: BaseRepository {
  func getMovieCategory() -> Single<GenresModel>
}

final class GenresRepository: BaseRepository, GenresRepositoryLogic {
  func getMovieCategory() -> Single<GenresModel> {
    return sendRequest(target: GenresAPI.GetMovieCategory())
      .mapBySnakeDecoder(GenresModel.self)
  }
}
