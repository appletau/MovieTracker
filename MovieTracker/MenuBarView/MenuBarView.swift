//
//  MenuBarView.swift
//  MovieTracker
//
//  Created by 黃韋韜 on 2021/6/27.
//  Copyright © 2021 tautau. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

final class MenuBarView: UIView {
  
  private lazy var flowLayout: UICollectionViewFlowLayout = {
    let flowLayout: UICollectionViewFlowLayout = .init()
    flowLayout.scrollDirection = .horizontal
    return flowLayout
  }()
  
  private lazy var collectionView: UICollectionView = {
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
    collectionView.dataSource = self
    collectionView.register(MenuCollectionCell.self, forCellWithReuseIdentifier: MenuCollectionCell.identifier)
    collectionView.showsHorizontalScrollIndicator = false
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    collectionView.backgroundColor = .white
    return collectionView
  }()
  
  private lazy var  indexIndicator: UIView = .init()
  
  private let selectedItemProperty: MenuBarViewItemProperty
  private let unSelectedItemProperty: MenuBarViewItemProperty
  private let disposeBag: DisposeBag = .init()
  private let datasource: [String]
  private (set) var currentIndex: Int = 0
  private lazy var didTapSiganl: Signal<Int> = collectionView.rx.itemSelected.asSignal().map { $0.item }

  
  init(titles: [String],
       layoutSetting: MenuBarViewLayoutSetting,
       selectedItemProperty: MenuBarViewItemProperty,
       unSelectedItemProperty: MenuBarViewItemProperty,
       indexIndicatorProperty: MenuBarIndexIndicatiorProperty) {
    self.selectedItemProperty = selectedItemProperty
    self.unSelectedItemProperty = unSelectedItemProperty
    datasource = titles
    super.init(frame: .zero)
    setupUI(layoutSetting: layoutSetting,
            indexIndicatorProperty: indexIndicatorProperty)
    setupBinding()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setupUI(layoutSetting: MenuBarViewLayoutSetting,
                       indexIndicatorProperty: MenuBarIndexIndicatiorProperty) {
    dropShadow()
    translatesAutoresizingMaskIntoConstraints = false
    flowLayout.minimumLineSpacing = layoutSetting.itemSpace
    flowLayout.sectionInset = layoutSetting.sectionInset
    flowLayout.itemSize = layoutSetting.itemSize
    
    addSubview(collectionView)
    collectionView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
    collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
    collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    let menuBarViewHeight: CGFloat = layoutSetting.sectionInset.bottom + layoutSetting.sectionInset.top + layoutSetting.itemSize.height
    collectionView.heightAnchor.constraint(equalToConstant: menuBarViewHeight).isActive = true
    
    indexIndicator.frame = .init(x: layoutSetting.sectionInset.left,
                                 y: layoutSetting.sectionInset.top,
                                 width: layoutSetting.itemSize.width,
                                 height: layoutSetting.itemSize.height - layoutSetting.sectionInset.bottom)
    let shapLayer = indexIndicatorProperty.createShapeLayer(menubarItemSize: layoutSetting.itemSize)
    indexIndicator.layer.addSublayer(shapLayer)
    DispatchQueue.main.async {
      self.collectionView.insertSubview(self.indexIndicator, at: 0)
    }
  }
  
  private func setupBinding() {
    collectionView.rx.itemSelected
      .map { $0.item }
      .subscribe(onNext: { [weak self] index in
        guard let self = self, self.currentIndex != index else { return }
        
        let reloadIndexPath: [IndexPath] = [index, self.currentIndex].map { IndexPath(item: $0, section: 0) }
        self.currentIndex = index
        self.collectionView.reloadItems(at: reloadIndexPath)
        
        let translationPosition: CGFloat = CGFloat(index)*(self.flowLayout.itemSize.width+self.flowLayout.minimumLineSpacing)
        UIView.animate(withDuration: 0.2) {
          self.indexIndicator.transform = CGAffineTransform(translationX: translationPosition, y: 0)
        }
      })
      .disposed(by: disposeBag)
  }
}

extension MenuBarView: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return datasource.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MenuCollectionCell.identifier, for: indexPath)
    if let cell = cell as? MenuCollectionCell {
      cell.configure(title: datasource[indexPath.item],
                     property: currentIndex == indexPath.item ? selectedItemProperty : unSelectedItemProperty )
    }
    return cell
  }
}
