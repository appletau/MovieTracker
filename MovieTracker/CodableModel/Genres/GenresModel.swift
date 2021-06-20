//
//  GenresModel.swift
//  MovieTracker
//
//  Created by tautau on 2020/10/26.
//  Copyright © 2020 tautau. All rights reserved.
//

import Foundation

struct GenresModel: Codable {
  let genres: [GenreModel]
}

struct GenreModel: Codable {
  let id: Int
  let name: String
}
