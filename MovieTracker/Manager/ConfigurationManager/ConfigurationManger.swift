//
//  ConfigurationManger.swift
//  MovieTracker
//
//  Created by tautau on 2020/10/25.
//  Copyright © 2020 tautau. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

final class ConfigurationManger {
  
  let selectedLanguageRelay: BehaviorRelay<Language> = .init(value: .english)
  
  static let shared = ConfigurationManger()
  
  var configurationModel: ImageConfiguration?
  
  var baseImageUrl: String = ""
  
  private let respository: ConfigurationRepository = .init()
  
  private let disposeBag = DisposeBag()
  
  private init(){}
  
  func getConfiguration() -> Completable {
    
    Completable.create { [weak self] (completable) -> Disposable in
      guard let self = self else { return Disposables.create() }
      self.respository.getConfiguration()
        .subscribe(onSuccess: { model in
          self.configurationModel = model.images
          self.baseImageUrl = model.images?.baseUrl ?? ""
          completable(.completed)
        }, onError: { eror in
          completable(.error(eror))
        })
        .disposed(by: self.disposeBag)
      return Disposables.create()
    }
  }
}
