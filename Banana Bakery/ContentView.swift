//
//  ContentView.swift
//  Banana Bakery
//
//  Created by Benjamin Michael on 2/11/24.
//

import SwiftUI

struct ContentView: View {
    @State private var authData: AuthData = AuthData()
    
    var body: some View {
        if !authData.isLoggedIn() {
            LoginScreen(authData: $authData)
        } else {
            RecipesView(credentials: authData.credentials!)
        }
    }
}

#Preview {
    ContentView()
}
