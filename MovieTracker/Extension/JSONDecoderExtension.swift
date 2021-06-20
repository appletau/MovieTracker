//
//  JSONDecoderExtension.swift
//  MovieTracker
//
//  Created by 黃韋韜 on 2021/6/15.
//  Copyright © 2021 tautau. All rights reserved.
//

import Foundation

extension JSONDecoder {
  static func snakeCaseDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    decoder.keyDecodingStrategy = .convertFromSnakeCase
    return decoder
  }
}
