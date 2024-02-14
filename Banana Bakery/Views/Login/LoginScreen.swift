//
//  LoginScreen.swift
//  Banana Bakery
//
//  Created by Benjamin Michael on 2/11/24.
//

import SwiftUI

struct LoginScreen: View {
    @ObservedObject var loginModel: LoginViewModel

    var body: some View {
        VStack {
            Spacer()
            
            Text("Login")
                .font(.title)
                .fontWeight(.bold)
                .fontDesign(.rounded)
            
            UserInformation(username: $loginModel.username, password: $loginModel.password)
            
            Button {
                if !loginModel.loggingIn {
                    loginModel.login()
                }
            } label: {
                if !loginModel.loggingIn {
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
        .alert(isPresented: $loginModel.loginFailure) {
            Alert(title: Text("Error!"), message: Text("Unable to login, reason: \(loginModel.errorDetails)"), dismissButton: .default(Text("Ok")))
        }
    }
}

#Preview {
    LoginScreen(loginModel: LoginViewModel())
}
