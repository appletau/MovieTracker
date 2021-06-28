//
//  AppDelegate.swift
//  MovieTracker
//
//  Created by tautau on 2020/10/11.
//  Copyright © 2020 tautau. All rights reserved.
//

import UIKit
import RxSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UIWindowSceneDelegate {
  
  var window: UIWindow?
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    if #available(iOS 13.0, *) {
    } else {
      let _ = ConfigurationManger.shared.getConfiguration()
        .observeOn(MainScheduler.instance)
        .subscribe { _ in
          let window = UIWindow(frame: UIScreen.main.bounds)
          let navigaionVc = UINavigationController(rootViewController: HomePageViewController())
          window.rootViewController = navigaionVc
          window.makeKeyAndVisible()
          self.window = window
        }
    }
    return true
  }
  
  @available(iOS 13.0, *)
  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    guard let windowScene = (scene as? UIWindowScene) else { return }
    let _ = ConfigurationManger.shared.getConfiguration()
      .observeOn(MainScheduler.instance)
      .subscribe { _ in
        let window = UIWindow(frame: UIScreen.main.bounds)
        let navigaionVc = UINavigationController(rootViewController: HomePageViewController())
        window.rootViewController = navigaionVc
        window.makeKeyAndVisible()
        window.windowScene = windowScene
        self.window = window
      }
  }
  
}

