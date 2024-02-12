//
//  AuthData.swift
//  Banana Bakery
//
//  Created by Benjamin Michael on 2/11/24.
//

import Foundation

@Observable
class AuthData {
    
    init() {
        
    }
    
    var loggedIn: Bool?
    var credentials: Credentials?
    var error: ErrorResponse?
    
    func setCredentials(username: String, key: String) {
        self.credentials = Credentials(username: username, key: key)
        self.loggedIn = true
    }
    
    func setError(error: ErrorResponse) {
        self.error = error
    }
    
    func hasCredentials() -> Bool {
        return self.credentials != nil
    }
    
    func hasError() -> Bool {
        return self.error != nil
    }
    
    func isLoggedIn() -> Bool {
        if loggedIn == nil {
            return false
        }
        
        return loggedIn!
    }
}

struct Credentials {
    var username: String
    var key: String
}
