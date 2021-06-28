//
//  HomePageViewController.swift
//  MovieTracker
//
//  Created by tautau on 2020/10/11.
//  Copyright © 2020 tautau. All rights reserved.
//

import UIKit

enum MovieListType: CaseIterable {
  case latest, nowPlaying , popular , topRated , upcoming
}

final class HomePageViewController: UIViewController {
  
  private lazy var menuBarView: MenuBarView = {
    let layout: MenuBarViewLayoutSetting = .init(sectionInset: .init(top: 5, left: 10, bottom: 5, right: 10),
                                                 itemSpace: 10,
                                                 itemSize: .init(width: 80, height: 40))
    let selectedItemProperty: MenuBarViewItemProperty = .init(font: UIFont.pingFangMedium.withSize(15),
                                                              textColor: .black)
    let unSelectItemProperty: MenuBarViewItemProperty = .init(font: UIFont.pingFang.withSize(15),
                                                              textColor: UIColor(white: 74.0 / 255.0, alpha: 1.0))
    let indicatorProperty: MenuBarIndexIndicatiorProperty = .init(style: .rect(radious: 40),
                                                                  fillColor: .systemGreen)
    let view = MenuBarView(titles: getMenuBarTitles(),
                           layoutSetting: layout,
                           selectedItemProperty: selectedItemProperty,
                           unSelectedItemProperty: unSelectItemProperty,
                           indexIndicatorProperty: indicatorProperty)
    return view
  }()
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
  }
  
  private func setupUI() {
    view.backgroundColor = .white
    view.addSubview(menuBarView)
    menuBarView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
    menuBarView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    menuBarView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
  }
  
  private func getMenuBarTitles() -> [String] {
    return MovieListType.allCases.map { movieListType in
      switch movieListType {
      case .latest:
        return "新片上映"
      case .nowPlaying:
        return "正在熱映"
      case .popular:
        return "熱門影片"
      case .topRated:
        return "口碑榜"
      case .upcoming:
        return "即將上映"
      }
    }
  }
}
