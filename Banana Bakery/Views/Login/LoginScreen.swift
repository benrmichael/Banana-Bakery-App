//
//  LoginScreen.swift
//  Banana Bakery
//
//  Created by Benjamin Michael on 2/11/24.
//

import SwiftUI

struct LoginScreen: View {
    @Binding var authData: AuthData
    @State private var showPassword: Bool = false
    @State private var showAlert: Bool = false
    @State private var loggingIn: Bool = false
    @State private var username: String = ""
    @State private var password: String = ""

    var body: some View {
        VStack {
            Spacer()
            
            Text("Login")
                .font(.title)
                .fontWeight(.bold)
                .fontDesign(.rounded)
            
            LoginField(username: $username, password: $password)
            
            Button {
                if !loggingIn {
                    loggingIn.toggle()
                    Login(parameters: LoginRequest(username: username, password: password)).call { response in
                        authData.setCredentials(username: response.username, key: response.sessionKey)
                        loggingIn.toggle()
                    } failure: { ErrorResponse in
                        loggingIn.toggle()
                        showAlert.toggle()
                    }
                }
            } label: {
                if !loggingIn {
                    Label("Sign in", systemImage: "paperplane.fill")
                        .frame(maxWidth: .infinity)
                } else {
                    ProgressView()
                        .frame(maxWidth: .infinity)
                }
            }
            .buttonStyle(.bordered)
            .padding()
            .padding(.leading, 25)
            .padding(.trailing, 25)
            
            Spacer()
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Error!"), message: Text("Failed to login. Please try again."), dismissButton: .default(Text("Ok")))
        }
    }
}

#Preview {
    LoginScreen(authData: Binding.constant(AuthData()))
}
