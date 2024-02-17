//
//  Recipe.swift
//  Banana Bakery
//
//  Created by Benjamin Michael on 2/14/24.
//

import SwiftUI

struct Recipe: View {
    var recipe: FolderRecipeDto
    
    var body: some View {
        ScrollView {
            VStack {
                HStack(alignment: .center) {
                    AsyncImage(url: URL(string: recipe.imageUrl)) { image in
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 250, height: 250)
                            .clipped()
                    } placeholder: {
                        ProgressView()
                    }
                    
                    Text(recipe.name)
                        .background(.gray)
                        .font(.title)
                        .offset(x: -100)
                }
                .scaledToFill()
                
                List {
                    ForEach(recipe.ingredients, id: \.section) { section in
                        Text(section.section)
                    }
                }
            }
        }
    }
}

#Preview {
    Recipe(recipe: PreviewConstants.recipe)
}
