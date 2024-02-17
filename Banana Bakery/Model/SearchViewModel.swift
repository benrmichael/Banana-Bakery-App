//
//  SearchViewModel.swift
//  Banana Bakery
//
//  Created by Benjamin Michael on 2/16/24.
//

import Foundation

@Observable
class SearchViewModel: ObservableObject {
    var searchingForRecipes: Bool = false
    var errorOccured: Bool = false
    var errorDetails: String = ""
    var recipes: [SearchRecipeDto] = []
    
    func searchForRecipes(query: String, _ authentication: SessionAuthentication) {
        NetworkService<SessionAuthentication, [SearchRecipeDto]>(
            endpoint: .recipeSearch,
            httpRequestType: .get,
            headerParams: ["query" : query],
            requestBody: authentication
        ).call { response in
            self.recipes = response
        } failure: { error in
            print("Error in search view model: \(error.details)")
            self.errorOccured = true
            self.errorDetails = error.details
        }
    }
}
