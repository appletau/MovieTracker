//
//  Language.swift
//  MovieTracker
//
//  Created by 黃韋韜 on 2021/6/20.
//  Copyright © 2021 tautau. All rights reserved.
//

import Foundation

enum Language {
  case english ,chineese
  
  var isoValue: String {
    switch self {
    case .english:
      return "en-US"
    case .chineese:
      return "zh"
    }
  }
}
