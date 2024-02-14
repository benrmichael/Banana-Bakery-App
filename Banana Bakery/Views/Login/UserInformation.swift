//
//  LoginField.swift
//  Banana Bakery
//
//  Created by Benjamin Michael on 2/11/24.
//

import SwiftUI

struct UserInformation: View {
    @Binding var username: String
    @Binding var password: String
    @State private var showPassword: Bool = false
    
    var body: some View {
        VStack {
            TextField ("Username", text: $username)
            PasswordField(password: $password, showPassword: $showPassword)
        }
        .shadow(radius: 3)
        .autocorrectionDisabled()
        .textInputAutocapitalization(.never)
        .textFieldStyle(.roundedBorder)
        .padding()
        .padding(.leading, 25)
        .padding(.trailing, 25)
    }
}

#Preview {
    let username = Binding.constant("")
    let password = Binding.constant("")
    return UserInformation(username: username, password: password)
}
