//
//  InputTextFieldView.swift
//  FacebookFriends
//
//  Created by Murat Can ASLAN on 9.08.2023.
//

import UIKit

final class InputTextFieldView: UIView {
    
    //MARK: - IBOutlets
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var inputTitle: UILabel!
    @IBOutlet private weak var inputTextField: UITextField!
    @IBOutlet private weak var validationMessage: UILabel!
    
    //MARK: - Properties
    private var viewModel = InputTextFieldViewModel()
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadNibContent()
        applyStyling()
        setupAfterInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadNibContent()
        applyStyling()
        setupAfterInit()
    }
    
    //MARK: - Helpers
    private func applyStyling() {

        containerView.backgroundColor = UIColor.init(red: 237/255, green: 240/255, blue: 243/255, alpha: 1)
        
        containerView.layer.cornerRadius = 8
        inputTextField.layer.cornerRadius = 8
        
        inputTextField.font = .systemFont(ofSize: 14)
        validationMessage.font = .systemFont(ofSize: 12)
        inputTitle.font = .systemFont(ofSize: 16)

        inputTextField.textColor = .label
        validationMessage.textColor = .systemRed
        inputTitle.textColor = .label
    }
    
    private func setupAfterInit() {
        inputTextField.addTarget(self, action: #selector(didTextEditingChanged), for: .editingChanged)
        inputTextField.delegate = self
    }
    
    private func setErrorValidation() {
        validationMessage.isHidden = viewModel.text.count > 2
    }
    
    //MARK: - Configure
    func configure(with model: InputTextFieldViewModel) {
        self.viewModel = model
        
        inputTitle.text = model.inputTitle
        inputTextField.placeholder = model.inputTitle
        inputTextField.isSecureTextEntry = model.isSecureTextEntry
        inputTextField.keyboardType = model.keyboardType
        validationMessage.text = model.errorValidationMessage
    }
    
    //MARK: - Actions
    @objc func didTextEditingChanged() {
        viewModel.text = inputTextField.text ?? ""
        setErrorValidation()
    }
}

//MARK: - UITextField Delegate
extension InputTextFieldView: UITextFieldDelegate { }
