//
//  AppDelegate.swift
//  FacebookFriends
//
//  Created by Murat Can ASLAN on 9.08.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        NavigationManager.shared.showLogin()
        return true
    }
}

