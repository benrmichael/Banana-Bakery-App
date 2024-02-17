//
//  RecipeDetailImage.swift
//  Banana Bakery
//
//  Created by Benjamin Michael on 2/14/24.
//

import SwiftUI

struct RecipeDetailImage: View {
    var url: String
    
    var body: some View {
        AsyncImage(url: URL(string: url)) { image in
            image
                .resizable()
                .clipShape(Circle())
                .scaledToFit()
                .shadow(radius: 5)
                .overlay(content: { Circle().stroke(.white, lineWidth: 1) })

        } placeholder: {
            ProgressView()
        }
    }
}

#Preview {
    RecipeDetailImage(url: PreviewConstants.recipe.imageUrl)
}
