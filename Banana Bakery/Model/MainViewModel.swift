//
//  MainViewModel.swift
//  Banana Bakery
//
//  Created by Michael, Ben on 2/14/24.
//

import Foundation

@Observable
class MainViewModel {
    
    var folders: [FolderDto] = []
    // add in the user information here
    
    func initialize(authentication: SessionAuthentication) {
        fetchFolders(authentication)
    }
    
    func fetchFolders(_ credentials: SessionAuthentication) {
        GetRecipes(params: credentials).call { response in
            self.folders = response.folders
        } failure: { error in
            // Handle the error here
        }
    }
}
