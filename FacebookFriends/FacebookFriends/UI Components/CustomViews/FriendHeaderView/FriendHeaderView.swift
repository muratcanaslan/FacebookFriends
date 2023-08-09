//
//  FriendHeaderView.swift
//  FacebookFriends
//
//  Created by Murat Can ASLAN on 9.08.2023.
//

import UIKit

final class FriendHeaderView: UIView {
    
    //MARK: - IBOutlets
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var friendUsername: UILabel!
    @IBOutlet weak var friendName: UILabel!
    @IBOutlet weak var friendGender: UILabel!
    @IBOutlet weak var friendMail: UILabel!
    @IBOutlet weak var friendPhone: UILabel!
    @IBOutlet weak var friendLocation: UILabel!
    @IBOutlet weak var friendNation: UILabel!

    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadNibContent()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadNibContent()
    }
    
    //MARK: - Configure
    func configure(with model: FriendViewModel) {
        if let url = model.picture?.large {
            userImage.downloadedFrom(url: url)
        } else {
            self.backgroundColor = .systemRed.withAlphaComponent(0.5)
        }
        
        self.friendNation.text = model.nation
        self.friendUsername.text = model.username
        self.friendName.text = model.fullname
        self.friendGender.text = model.gender?.rawValue
        self.friendMail.text = model.email
        self.friendPhone.text = model.phone
        self.friendLocation.text = model.locationString
    }
}
