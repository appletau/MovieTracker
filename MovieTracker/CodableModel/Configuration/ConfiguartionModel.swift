//
//  ConfiguartionModel.swift
//  MovieTracker
//
//  Created by tautau on 2020/10/25.
//  Copyright © 2020 tautau. All rights reserved.
//

import Foundation

struct ConfigurationModel: Codable {
  let images: ImageConfiguration?
}

struct ImageConfiguration: Codable{
  let baseUrl: String
  let secureBaseUrl: String
  let backdropSizes: [String]
  let logoSizes: [String]
  let posterSizes: [String]
  let profileSizes: [String]
  let stillSizes: [String]
}
