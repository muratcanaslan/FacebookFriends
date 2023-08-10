//
//  LoginViewController.swift
//  FacebookFriends
//
//  Created by Murat Can ASLAN on 9.08.2023.
//

import UIKit

final class LoginViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet private weak var passwordView: InputTextFieldView!
    @IBOutlet private weak var usernameView: InputTextFieldView!
    
    //MARK: - Properties
    private let viewModel = LoginViewModel()

    //MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setBlocks()
    }
    
    //MARK: - Helpers
    private func setupViews() {
        passwordView.configure(with: viewModel.passwordVM)
        usernameView.configure(with: viewModel.usernameVM)
    }
    
    private func setBlocks() {
        viewModel.onError = { message in
            self.showAlert(with: message)
        }
    }
    
    //MARK: - IBActions
    @IBAction private func didTapLogin(_ sender: UIButton) {
        if !viewModel.checkValidLogin() { return }
        NavigationManager.shared.showFriendList()
    }
}
