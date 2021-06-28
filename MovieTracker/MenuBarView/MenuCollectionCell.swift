//
//  MenuCollectionCell.swift
//  MovieTracker
//
//  Created by 黃韋韜 on 2021/6/27.
//  Copyright © 2021 tautau. All rights reserved.
//

import UIKit

class MenuCollectionCell: UICollectionViewCell {
  lazy var titleLabel: UILabel = {
    let label = UILabel()
    label.textAlignment = .center
    label.textAlignment = .center
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func configure(title: String,
                 property: MenuBarViewItemProperty) {
    titleLabel.text = title
    titleLabel.font = property.font
    titleLabel.textColor = property.textColor
  }
  
  private func setupUI() {
    contentView.addSubview(titleLabel)
    titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
    titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
    titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
  }
}
