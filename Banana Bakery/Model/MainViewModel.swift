//
//  MainViewModel.swift
//  Banana Bakery
//
//  Created by Michael, Ben on 2/14/24.
//

import Foundation

@Observable
class MainViewModel {
    
    init(credentials: Credentials) {
        self.credentials = credentials
    }
    
    var credentials: Credentials
    var folders: [FolderDto] = []
    // add in the user information here
    
    func initialize() {
        fetchFolders(credentials)
    }
    
    func fetchFolders(_ credentials: Credentials) {
        GetRecipes(params: SessionAuthentication(
            username: credentials.username,
            sessionKey: credentials.key
            )
        ).call { response in
            self.folders = response.folders
        } failure: { error in
            // Handle the error here
        }
    }
}
