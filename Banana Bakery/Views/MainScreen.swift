//
//  MainScreen.swift
//  Banana Bakery
//
//  Created by Michael, Ben on 2/14/24.
//

import SwiftUI

struct MainScreen: View {
    var authentication: SessionAuthentication
    @State private var mainModel: MainViewModel = MainViewModel()
    
    var body: some View {
        TabView {
            RecipesView(folders: mainModel.folders)
                .tabItem {
                    Label("Recipes", systemImage: "folder.fill")
                }
            
            SearchView(auth: authentication)
                .tabItem {
                    Label("Seach", systemImage: "magnifyingglass")
                }
        }
        .task {
            mainModel.initialize(authentication: authentication)
        }
    }
}

#Preview {
    MainScreen(authentication: SessionAuthentication(username: "Admin", sessionKey: "SomeKey"))
}
