//
//  RecipeSection.swift
//  Banana Bakery
//
//  Created by Benjamin Michael on 2/11/24.
//

import Foundation

struct RecipeSection: Hashable, Codable {
    var section: String
    var items: [String]
}
