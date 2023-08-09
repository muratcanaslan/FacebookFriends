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
        vc.modalTransitionStyle = .crossDissolve
        guard let window = UIApplication.shared.keyWindow else { return }
        window.rootViewController = vc
        window.makeKeyAndVisible()
        UIView.transition(with: window, duration: 0.2, options: .transitionCrossDissolve, animations: nil, completion: nil)
    }
    
    func showFriendList() {
        let vc = UINavigationController(rootViewController: FriendListViewController())
        guard let window = UIApplication.shared.keyWindow else { return }
        window.rootViewController = vc
        window.makeKeyAndVisible()
        UIView.transition(with: window, duration: 0.2, options: .transitionCrossDissolve, animations: nil, completion: nil)
    }
}
