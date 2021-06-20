//
//  MovieModel.swift
//  MovieTracker
//
//  Created by tautau on 2020/11/1.
//  Copyright © 2020 tautau. All rights reserved.
//

import Foundation

struct MovieList: Codable {
  
  let results: [MovieModel]
  let dates: DateInterval
  let currentPage: Int
  let totalResults: Int
  let totalPages:Int
  
  struct MovieModel: Codable {
    let popularity: Double
    let voteCount: Int
    let hadVideo: Bool
    let posterPath: String
    let id: Int
    let isAdult: Bool
    let backdropPath: String
    let originalLanguage: String
    let originalTitle: String
    let genreIDs: [Int]
    let title: String
    let voteAverage: Double
    let overview: String
    let releaseDate: String
  }
  
  struct DateInterval: Codable {
    let maximum: String
    let minimum: String
  }
}
