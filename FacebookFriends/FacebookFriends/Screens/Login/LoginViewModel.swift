//
//  LoginViewModel.swift
//  FacebookFriends
//
//  Created by Murat Can ASLAN on 9.08.2023.
//

import Foundation

final class LoginViewModel {
    
    let usernameVM = InputTextFieldViewModel(inputTitle: "Kullanıcı Adı", errorValidationMessage: "**Kullanıcı adınız minimum 2 karakter olmalıdır.")
    let passwordVM = InputTextFieldViewModel(inputTitle: "Şifre", isSecureTextEntry: true, errorValidationMessage: "**Şifreniz minimum 2 karakter olmalıdır.")
}
