//
//  LoginRequest.swift
//  Banana Bakery
//
//  Created by Benjamin Michael on 2/11/24.
//

import Foundation

struct LoginRequest: Hashable, Codable {
    var username: String
    var password: String
}
