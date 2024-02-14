//
//  SaveRecipeDto.swift
//  Banana Bakery
//
//  Created by Benjamin Michael on 2/11/24.
//

import Foundation

struct SaveRecipeDto: Hashable, Codable {
    var name: String
    var instructions: [RecipeSection]
    var ingredients: [RecipeSection]
    var imageUrl: String
    var bakery: String
    var category: String
    var folderId: CLong
    var sessionAuthentication: SessionAuthentication
}
