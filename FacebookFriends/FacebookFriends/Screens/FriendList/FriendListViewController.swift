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
    
    //MARK: - Properties
    private let viewModel = FriendListViewModel()
    
    //MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Friend List"
        
        setupTableView()
        setBlocks()
        
        viewModel.fetchList()
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(FriendListTableCell.createXib(), forCellReuseIdentifier: FriendListTableCell.reuseIdentifier)
    }
    
    private func addRightBarButton() {
        let barButton = UIBarButtonItem(title: "Logout", style: .done, target: self, action: #selector(didTapLogout))
        barButton.setTitleTextAttributes([.foregroundColor : UIColor.black, .font : UIFont.systemFont(ofSize: 21)], for: .normal)
        barButton.setTitleTextAttributes([.foregroundColor : UIColor.black, .font : UIFont.systemFont(ofSize: 21)], for: .highlighted)

        navigationItem.rightBarButtonItem = barButton
    }
    
    private func setBlocks() {
        viewModel.onSuccess = {
            DispatchQueue.main.async {
                self.addRightBarButton()
                self.tableView.reloadData()
            }
        }
        
        viewModel.onError = { message in
            self.showAlert(with: message)
        }
    }
    
    //MARK: - IBActions
    @objc func didTapLogout() {
        NavigationManager.shared.showLogin()
    }
}

//MARK: - UITableView Delegate&DataSource
extension FriendListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.cellVMs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FriendListTableCell.reuseIdentifier, for: indexPath) as? FriendListTableCell else { return .init() }
        cell.configure(with: viewModel.cellVMs[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewModel = viewModel.cellVMs[indexPath.row]
        NavigationManager.shared.showFriendDetail(on: navigationController!, with: viewModel)
    }
}
