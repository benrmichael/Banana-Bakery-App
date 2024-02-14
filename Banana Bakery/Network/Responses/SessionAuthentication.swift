//
//  SessionAuthentication.swift
//  Banana Bakery
//
//  Created by Benjamin Michael on 2/11/24.
//

import Foundation

struct SessionAuthentication: Hashable, Codable {
    var username: String
    var sessionKey: String
}
