//
//  SearchRecipeDto.swift
//  Banana Bakery
//
//  Created by Benjamin Michael on 2/11/24.
//

import Foundation

// Returned from searching for recipes
struct SearchRecipeDto: Hashable, Codable, Identifiable {
    var id: CLong
    var bakery: String
    var category: String
    var name: String
    var ingredients: [RecipeSection]
    var instructions: [RecipeSection]
    var image: String
}
