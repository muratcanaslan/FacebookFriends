//
//  LoginViewModel.swift
//  FacebookFriends
//
//  Created by Murat Can ASLAN on 9.08.2023.
//

import Foundation
protocol LoginViewModelProtocol {
    typealias OnError = (String) -> Void
    
    var onError: OnError? { get set}
    
    var usernameVM: InputTextFieldViewModel { get }
    var passwordVM: InputTextFieldViewModel { get }
    
    func checkValidLogin() -> Bool
}

final class LoginViewModel: LoginViewModelProtocol {
    typealias OnError = (String) -> Void
    
    var onError: OnError?
    
    let usernameVM: InputTextFieldViewModel = InputTextFieldViewModel(inputTitle: "Kullanıcı Adı", errorValidationMessage: "**Kullanıcı adınız en az 3 karakter olmalıdır.")
    let passwordVM: InputTextFieldViewModel = InputTextFieldViewModel(inputTitle: "Şifre", isSecureTextEntry: true, errorValidationMessage: "**Şifreniz en az 3 karakter olmalıdır.")
    
    @discardableResult
    func checkValidLogin() -> Bool {
        if usernameVM.text.count < 3 {
            onError?("Kullanıcı adı en az 3 karakter olmalıdır!")
            return false
        }
        
        if passwordVM.text.count < 3 {
            onError?("Şifreniz en az 3 karakterli olmalıdır!")
            return false
        }
        
        return true
    }
}
