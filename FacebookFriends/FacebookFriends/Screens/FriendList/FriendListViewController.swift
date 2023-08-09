//
//  FriendListViewController.swift
//  FacebookFriends
//
//  Created by Murat Can ASLAN on 9.08.2023.
//

import UIKit

final class FriendListViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet private weak var tableView: UITableView!
    
    //MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Friend List"
        
    }
}
