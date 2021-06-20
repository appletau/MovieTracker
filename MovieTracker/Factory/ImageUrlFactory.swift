//
//  ImageSize.swift
//  MovieTracker
//
//  Created by 黃韋韜 on 2021/6/20.
//  Copyright © 2021 tautau. All rights reserved.
//

import Foundation

enum ImageType {
  case still, poster, profile, logo, backdrop
}

enum ImageSize {
  case small, medium, large, original
}

struct ImageUrlFactory {
  let baseUrl: String = ConfigurationManger.shared.baseImageUrl
  
  func create(imageType: ImageType,
              imageSize: ImageSize,
              imagePath: String) -> URL? {
    let options = getSizeOptions(type: imageType)
    let selectedSize = getSize(imageSize, options: options)
    return URL(string: "\(ConfigurationManger.shared.baseImageUrl)\(selectedSize)/\(imagePath)")
  }
  
  private func getSizeOptions(type: ImageType) -> [String] {
    switch type {
    case .still:
      return ConfigurationManger.shared.configurationModel?.stillSizes ?? []
    case .poster:
      return ConfigurationManger.shared.configurationModel?.posterSizes ?? []
    case .profile:
      return ConfigurationManger.shared.configurationModel?.profileSizes ?? []
    case .logo:
      return ConfigurationManger.shared.configurationModel?.logoSizes ?? []
    case .backdrop:
      return ConfigurationManger.shared.configurationModel?.backdropSizes ?? []
    }
  }
  
  private func getSize(_ size: ImageSize,
                       options: [String]) -> String {
    guard options.count > 0 else { return "" }
    let sizes = options.filter { $0 != "original" }
    switch size {
    case .small:
      return sizes.first ?? ""
    case .medium:
      let middleIndex: Int = lround(Double(sizes.count)/2)-1
      return sizes[middleIndex]
    case .large:
      return sizes.last ?? ""
    case .original:
      return "original"
    }
  }
}
