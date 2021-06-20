//
//  ExtensionRxMoya.swift
//  MovieTracker
//
//  Created by tautau on 2020/10/12.
//  Copyright © 2020 tautau. All rights reserved.
//

import Foundation
import Moya
import RxSwift

extension PrimitiveSequence where Trait == SingleTrait, Element == Response {
  func mapBySnakeDecoder<D: Decodable>(_ type: D.Type, atKeyPath keyPath: String? = nil, failsOnEmptyData: Bool = true) -> Single<D> {
    return flatMap { .just(try $0.map(type, atKeyPath: keyPath, using: JSONDecoder.snakeCaseDecoder(), failsOnEmptyData: failsOnEmptyData)) }
  }
}

