//
//  FolderItem.swift
//  Banana Bakery
//
//  Created by Benjamin Michael on 2/14/24.
//

import SwiftUI

struct FolderItem: View {
    var recipe: FolderRecipeDto
    
    var body: some View {
        VStack(alignment: .leading) {
            AsyncImage(url: URL(string: recipe.imageUrl)) { image in
                image
                    .renderingMode(.original)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 155, height: 155)
                    .cornerRadius(5)
            } placeholder: {
                ProgressView()
            }
            .frame(width: 155, height: 155)
            
            Text(recipe.name)
                .font(.caption)
                .frame(maxWidth: 155)
        }
        .padding(.leading, 15)
    }
}

#Preview {
    FolderItem(recipe: PreviewConstants.recipe)
}
