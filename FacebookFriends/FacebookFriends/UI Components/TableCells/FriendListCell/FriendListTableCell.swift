//
//  FriendListTableCell.swift
//  FacebookFriends
//
//  Created by Murat Can ASLAN on 9.08.2023.
//

import UIKit

final class FriendListTableCell: UITableViewCell {
    
    //MARK: - IBOutlets
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var friendName: UILabel!
    @IBOutlet private weak var friendUsername: UILabel!
    @IBOutlet private weak var friendImage: UIImageView!
    
    //MARK: - Properties
    private var viewModel = FriendViewModel()
    
    //MARK: - Configure
    func configure(with model: FriendViewModel) {
        self.friendName.text = model.fullname
        self.friendUsername.text = model.username
    }
}

extension FriendListTableCell {
    static func createXib() -> UINib {
        return .init(nibName: reuseIdentifier, bundle: nil)
    }
    
    static let reuseIdentifier = "FriendListTableCell"
}
