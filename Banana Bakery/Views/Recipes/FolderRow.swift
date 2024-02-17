//
//  FolderRow.swift
//  Banana Bakery
//
//  Created by Benjamin Michael on 2/14/24.
//

import SwiftUI

struct FolderRow: View {
    var folderName: String
    var recipes: [FolderRecipeDto]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(folderName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 15)
            
            ScrollView(.horizontal) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(recipes) { recipe in
                        NavigationLink {
                            // go somewhere
                        } label: {
                            FolderItem(recipe: recipe)
                        }
                    }
                }
            }
            .padding(.bottom, 15)
        }
        .cornerRadius(5)
    }
}

#Preview {
    FolderRow(folderName: "Brownies", recipes: [PreviewConstants.recipe])
}
