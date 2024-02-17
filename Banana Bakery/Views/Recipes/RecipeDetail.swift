//
//  RecipeDetail.swift
//  Banana Bakery
//
//  Created by Benjamin Michael on 2/14/24.
//

import SwiftUI

struct RecipeDetail: View {
    var recipe: FolderRecipeDto
    
    var body: some View {
        HStack(alignment: .center) {
            RecipeDetailImage(url: recipe.imageUrl)
                .frame(width: 100, height: 100)
            Text(recipe.name)
                .font(.title3)
        }
    }
}

#Preview {
    RecipeDetail(recipe: PreviewConstants.recipe)
}
