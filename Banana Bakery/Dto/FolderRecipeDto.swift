//
//  FolderRecipeDto.swift
//  Banana Bakery
//
//  Created by Benjamin Michael on 2/11/24.
//

import Foundation

struct FolderRecipeDto: Hashable, Codable {
    var id: CLong
    var name: String
    var instructions: [RecipeSection]
    var ingredients: [RecipeSection]
    var imageUrl: String
    var bakery: String
    var category: String
    var folderID: CLong
    var username: String
}
