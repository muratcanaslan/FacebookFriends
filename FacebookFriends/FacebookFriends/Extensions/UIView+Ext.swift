//
//  UIView+Ext.swift
//  FacebookFriends
//
//  Created by Murat Can ASLAN on 9.08.2023.
//

import UIKit

extension UIView {
  /**
   Adds content loaded from the nib to the end of the receiver's list of subviews and adds constraints automatically.
   */
    
    static var nib: UINib {
      return UINib(nibName: String(describing: self), bundle: Bundle(for: self))
    }
    
  func loadNibContent() {
    let layoutAttributes: [NSLayoutConstraint.Attribute] = [.top, .leading, .bottom, .trailing]
    for case let view as UIView in type(of: self).nib.instantiate(withOwner: self, options: nil) {
      view.translatesAutoresizingMaskIntoConstraints = false
      self.addSubview(view)
      NSLayoutConstraint.activate(layoutAttributes.map { attribute in
        NSLayoutConstraint(
          item: view, attribute: attribute,
          relatedBy: .equal,
          toItem: self, attribute: attribute,
          multiplier: 1, constant: 0.0
        )
      })
    }
  }
}
