//
//  RecipesView.swift
//  Banana Bakery
//
//  Created by Benjamin Michael on 2/11/24.
//

import SwiftUI

struct RecipesView: View {
    var credentials: Credentials
    @State private var viewModel: RecipesViewModel = RecipesViewModel()
    
    var body: some View {
        NavigationSplitView {
            List {
                ForEach(viewModel.folders) { folder in
                    NavigationLink {
                       // Go somewhere
                    } label: {
                        Text(folder.name)
                    }
                }
            }
            .animation(.default, value: viewModel.folders)
            .navigationTitle("Folders")
        } detail: {
            Text("Select a Folder")
        }
        .task {
            viewModel.fetchFolders(credentials)
        }
    }
}

#Preview {
    RecipesView(credentials: Credentials(username: "Admin", key: "Idk"))
}
