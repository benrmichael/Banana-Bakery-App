//
//  RecipeList.swift
//  Banana Bakery
//
//  Created by Benjamin Michael on 2/14/24.
//

import SwiftUI

struct RecipeList: View {
    var folderName: String
    var recipes: [FolderRecipeDto]
    
    var body: some View {
        NavigationSplitView {
            List(recipes) { recipe in
                NavigationLink {
                    // Go to the recipe
                } label: {
                    RecipeDetail(recipe: recipe)
                }
            }
            .navigationTitle("\(folderName)")
        } detail: {
            Text("Select a Recipe")
        }
    }
}

#Preview {
    RecipeList(folderName: "Bundt Cake", recipes: [PreviewConstants.recipe])
}
