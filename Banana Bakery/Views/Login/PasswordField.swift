//
//  PasswordField.swift
//  Banana Bakery
//
//  Created by Benjamin Michael on 2/11/24.
//

import SwiftUI

struct PasswordField: View {
    @Binding var password: String
    @Binding var showPassword: Bool
    
    var body: some View {
        if showPassword {
            TextField("Password", text: $password)
                .overlay(
                    Button {
                        showPassword.toggle()
                    } label: {
                        Image(systemName: "eye")
                    }
                        .padding(.trailing, 8)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                )
        } else {
            SecureField("Password", text: $password)
                .overlay(
                    Button(action: {
                        showPassword.toggle()
                    }) {
                        Image(systemName: showPassword ? "eye" : "eye.slash")
                    }
                    .padding(.trailing, 8)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                )
        }
    }
}

#Preview {
    @State var show: Bool = true
    
    return PasswordField(password: Binding.constant(""), showPassword: $show)
}
