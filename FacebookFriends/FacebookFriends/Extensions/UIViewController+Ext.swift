//
//  UIViewController+Ext.swift
//  FacebookFriends
//
//  Created by Murat Can ASLAN on 10.08.2023.
//

import UIKit

extension UIViewController {
    func showAlert(with message: String) {
        let alert = UIAlertController(title: "", message: message, preferredStyle: .alert)
        let cancel = UIAlertAction(title: "Tamam", style: .cancel)
        alert.addAction(cancel)
        self.present(alert, animated: true)
    }
}
