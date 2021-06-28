//
//  MovieRepository.swift
//  MovieTracker
//
//  Created by 黃韋韜 on 2021/6/20.
//  Copyright © 2021 tautau. All rights reserved.
//

import Foundation
import RxSwift

protocol MovieRepositoryLogic: BaseRepository {
  func getMovieList(type: MovieListType,
                    page: Int) -> Single<MovieList>
}

final class MovieRepository: BaseRepository, MovieRepositoryLogic {
  
  func getMovieList(type: MovieListType,
                    page: Int) -> Single<MovieList> {
    return sendRequest(target: MovieAPI.GetMovieList(type: type,
                                                     page: page))
      .mapBySnakeDecoder(MovieList.self)
  }
}
