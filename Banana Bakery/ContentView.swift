//
//  ContentView.swift
//  Banana Bakery
//
//  Created by Benjamin Michael on 2/11/24.
//

import SwiftUI

struct ContentView: View {
    @State private var loginModel: LoginViewModel = LoginViewModel()
    
    var body: some View {
        if loginModel.loginSucess {
            RecipesView(credentials: loginModel.credentials!)
        } else {
            LoginScreen(loginModel: loginModel)
        }
    }
}

#Preview {
    ContentView()
}
