//
//  LoginViewModel.swift
//  Banana Bakery
//
//  Created by Benjamin Michael on 2/13/24.
//

import Foundation

@Observable
class LoginViewModel: ObservableObject {
    var credentials: Credentials?
    var loggingIn: Bool = false
    var loginSucess: Bool = false
    var loginFailure: Bool = false
    var errorDetails: String = ""
    var username: String = ""
    var password: String = ""
    
    func login() {
        loggingIn = true
        Login(parameters: LoginRequest(
                username: username,
                password: password
            )
        ).call { response in
            self.credentials = Credentials(
                username: response.username,
                key: response.sessionKey
            )
            self.loginSucess = true
            self.loggingIn = false
        } failure: { error in
            self.errorDetails = error.details
            self.loginFailure = true
            self.loggingIn = false
        }
    }
    
}
