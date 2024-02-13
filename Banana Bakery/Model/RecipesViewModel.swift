//
//  RecipesViewModel.swift
//  Banana Bakery
//
//  Created by Benjamin Michael on 2/12/24.
//

import Foundation

@Observable
class RecipesViewModel {
    var folders: [FolderDto] = []
    var showError: Bool = false
    var error: String = ""
    
    func fetchFolders(credentials: Credentials) {
        GetRecipes(params: SessionAuthentication(
            username: credentials.username,
            sessionKey: credentials.key
            )
        ).call { response in
            self.folders = response.folders
        } failure: { error in
            self.showError.toggle()
            self.error = error.details
        }
    }
}
