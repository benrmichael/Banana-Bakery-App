//
//  RecipesView.swift
//  Banana Bakery
//
//  Created by Benjamin Michael on 2/11/24.
//

import SwiftUI

struct RecipesView: View {
    var folders: [FolderDto]
    
    var body: some View {
        NavigationSplitView {
            List {
                ForEach(folders) { folder in
                    NavigationLink {
                        RecipeList(folderName: folder.name ,recipes: folder.recipes)
                    } label: {
                        FolderRow(folderName: folder.name, recipes: folder.recipes)
                    }
                }
                .listRowInsets(EdgeInsets())
            }
            .listStyle(.inset)
            .animation(.default, value: folders)
            .navigationTitle("Folders")
        } detail: {
            Text("Select a Folder")
        }
    }
}

#Preview {
    RecipesView(folders: [PreviewConstants.folder])
}
