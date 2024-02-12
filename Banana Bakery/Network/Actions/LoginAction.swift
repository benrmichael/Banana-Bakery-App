//
//  LoginAction.swift
//  Banana Bakery
//
//  Created by Benjamin Michael on 2/11/24.
//

import Foundation
import SwiftUI

struct LoginAction {
    
    var username: String
    var password: String
    @Binding var authData: AuthData
    @Binding var loggingIn: Bool
    
    func loginUser() {
        Login(parameters:
                LoginRequest(
                    username: username,
                    password: password
                )
        ).call { response in
            // Login success
            print("Successful login: username: \(response.username), key: \(response.sessionKey)")
            authData.setCredentials(username: response.username, key: response.sessionKey)
            loggingIn.toggle()
        } failure: { error in
            authData.setError(error: error)
            print("ERROR : \(error.details)")
            loggingIn.toggle()
        }
    }
}
