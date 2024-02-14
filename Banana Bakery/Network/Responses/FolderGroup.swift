//
//  FolderGroup.swift
//  Banana Bakery
//
//  Created by Benjamin Michael on 2/11/24.
//

import Foundation

struct FolderGroup: Hashable, Codable {
    var folders: [FolderDto]
}

struct FolderDto: Hashable, Codable, Identifiable {
    var id: CLong
    var name: String
    var recipes: [FolderRecipeDto]
}
