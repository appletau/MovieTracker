//
//  ExtensionUIview.swift
//  MovieTracker
//
//  Created by tautau on 2020/10/12.
//  Copyright © 2020 tautau. All rights reserved.
//

import UIKit

extension UIView {
  static var identifier: String { return String(describing: self) }
  
  func dropShadow(scale: Bool = true) {
    layer.masksToBounds = false
    layer.shadowColor = UIColor(white: 74.0 / 255.0, alpha: 1.0).cgColor
    layer.shadowOpacity = 0.1
    layer.shadowOffset = CGSize(width: 0, height: 1)
    layer.shadowRadius = 1.5
    layer.shouldRasterize = true
    layer.rasterizationScale = UIScreen.main.scale
  }
}
