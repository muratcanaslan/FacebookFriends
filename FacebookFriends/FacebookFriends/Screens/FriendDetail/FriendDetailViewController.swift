//
//  FriendDetailViewController.swift
//  FacebookFriends
//
//  Created by Murat Can ASLAN on 9.08.2023.
//

import UIKit

final class FriendDetailViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet private weak var locationView: FriendLocationView!
    @IBOutlet private weak var headerView: FriendHeaderView!
    
    //MARK: - Properties
    private let friend: FriendViewModel

    //MARK: - Init
    init(friend: FriendViewModel) {
        self.friend = friend
        super.init(nibName: "FriendDetailViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Lifecycyle
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Friend Detail"
        
        headerView.configure(with: friend)
        locationView.configure(latitude: friend.latitude, longitude: friend.longitude)
    }
}
