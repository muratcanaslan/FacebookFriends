//
//  InputTextFieldViewViewModel.swift
//  FacebookFriends
//
//  Created by Murat Can ASLAN on 9.08.2023.
//

import UIKit

class InputTextFieldViewModel {
    var text: String
    var inputTitle: String?
    var isSecureTextEntry: Bool
    var keyboardType: UIKeyboardType
    var errorValidationMessage: String?
    init(
         inputTitle: String? = nil,
         text: String = "",
         isSecureTextEntry: Bool = false,
         keyboardType: UIKeyboardType = .default,
         errorValidationMessage: String? = nil
    ) {
        self.inputTitle = inputTitle
        self.text = text
        self.isSecureTextEntry = isSecureTextEntry
        self.keyboardType = keyboardType
        self.errorValidationMessage = errorValidationMessage
    }
    
    var isValid: Bool {
        return text.count >= 3
    }
}

