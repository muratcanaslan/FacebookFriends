//
//  NavigationManager.swift
//  FacebookFriends
//
//  Created by Murat Can ASLAN on 9.08.2023.
//

import UIKit

final class NavigationManager {
    static let shared = NavigationManager()
    
    private init() { }
    
    func showLogin() {
        let vc = LoginViewController()
        show(vc)
    }
    
    func showFriendList() {
        let vc = UINavigationController(rootViewController: FriendListViewController())
        show(vc)
    }
    
    private func getCurrentWindow() -> UIWindow {
        var window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
        if window == nil {
            window = UIWindow(frame: UIScreen.main.bounds)
            window?.makeKeyAndVisible()
        }
        return window!
    }
    
    private func show(_ vc: UIViewController) {
        let window = getCurrentWindow()
        window.rootViewController = vc
        window.makeKeyAndVisible()
        UIView.transition(with: window, duration: 0.2, options: .transitionCrossDissolve, animations: nil, completion: nil)
    }
}
