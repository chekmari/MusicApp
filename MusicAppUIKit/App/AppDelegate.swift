//
//  AppDelegate.swift
//  MusicAppUIKit
//
//  Created by macbook on 08.11.2023.
//

import UIKit
import SnapKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        Factories.NavigationController.setupNabigationBar()
        Factories.NavigationController.setupTabBar()
        let builder = Builder()
        let nav = UINavigationController()
        let router = Router(navigationController: nav, builder: builder)
        router.setLoginScreen()
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = nav
        window?.makeKeyAndVisible()
        

        
        return true
    }
}

