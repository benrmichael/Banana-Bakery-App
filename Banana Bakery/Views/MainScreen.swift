//
//  MainScreen.swift
//  Banana Bakery
//
//  Created by Michael, Ben on 2/14/24.
//

import SwiftUI

struct MainScreen: View {
    var credentials: Credentials
    @State private var mainModel: MainViewModel?
    
    var body: some View {
        TabView {
            RecipesView(credentials: credentials)
                .tabItem {
                    Label("Recipes", systemImage: "globe")
                }
            
            SearchView()
                .tabItem {
                    Label("Seach", systemImage: "globe")
                }
        }
        .task {
            mainModel = MainViewModel(credentials: credentials)
        }
    }
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}
