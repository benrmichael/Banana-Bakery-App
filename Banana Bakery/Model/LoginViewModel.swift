//
//  LoginViewModel.swift
//  Banana Bakery
//
//  Created by Benjamin Michael on 2/13/24.
//

import Foundation

@Observable
class LoginViewModel: ObservableObject {
    var authentication: SessionAuthentication?
    var loggingIn: Bool = false
    var loginSucess: Bool = false
    var loginFailure: Bool = false
    var errorDetails: String = ""
    var username: String = ""
    var password: String = ""
    
    func login() {
        loggingIn = true
        NetworkService<LoginRequest, SessionAuthentication>(
            endpoint: .login,
            httpRequestType: .post,
            requestBody: LoginRequest(username: username, password: password)
        ).call { response in
            self.authentication = response
            self.loginSucess = true
            self.loggingIn = false
        } failure: { error in
            self.errorDetails = error.details
            self.loginFailure = true
            self.loggingIn = false
        }
        
//        
//        loggingIn = true
//        Login(parameters: LoginRequest(
//                username: username,
//                password: password
//            )
//        ).call { response in
//            self.authentication = response
//            self.loginSucess = true
//            self.loggingIn = false
//        } failure: { error in
//            self.errorDetails = error.details
//            self.loginFailure = true
//            self.loggingIn = false
//        }
    }
    
}
