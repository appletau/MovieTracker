//
//  MenuBarViewSettingModel.swift
//  MovieTracker
//
//  Created by 黃韋韜 on 2021/6/28.
//  Copyright © 2021 tautau. All rights reserved.
//

import UIKit

struct MenuBarViewLayoutSetting {
  let sectionInset: UIEdgeInsets
  let itemSpace: CGFloat
  let itemSize: CGSize
}

struct MenuBarViewItemProperty {
  let font: UIFont
  let textColor: UIColor
}

struct MenuBarIndexIndicatiorProperty {
  enum Style {
    case bottomLine(radious: CGFloat), rect(radious: CGFloat)
  }
  
  let style: Style
  let fillColor: UIColor
  
  func createShapeLayer(menubarItemSize: CGSize) -> CAShapeLayer {
    var path: UIBezierPath!
    switch style {
    case .bottomLine(let radious):
      let rect = CGRect(x: 0, y: menubarItemSize.height-2, width: menubarItemSize.width, height: 2)
      path = UIBezierPath(roundedRect: rect, cornerRadius: radious)
    case .rect(let radious):
      let rect = CGRect(x: 0, y: 0, width: menubarItemSize.width, height: menubarItemSize.height)
      path = UIBezierPath(roundedRect: rect, cornerRadius: radious)
    }
    let shapLayer = CAShapeLayer()
    shapLayer.path = path.cgPath
    shapLayer.fillColor = fillColor.cgColor
    return shapLayer
  }
}
