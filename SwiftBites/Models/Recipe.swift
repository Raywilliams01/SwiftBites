//
//  Recipe.swift
//  SwiftBites
//
//  Created by ray williams on 10/5/24.
//

import Foundation
import SwiftData

@Model
final class Recipe {
    var id: UUID
    var name: String
    var summary: String
    var category: Category?
    var serving: Int
    var time: Int
    
    @Relationship(deleteRule: .cascade)
    var ingredients: [RecipeIngredient]
    var instructions: String
    var imageData: Data?

    init(
        id: UUID = UUID(),
        name: String,
        summary: String,
        category: Category? = nil,
        serving: Int,
        time: Int,
        ingredients: [RecipeIngredient],
        instructions: String,
        imageData: Data? = nil
    ) {
        self.id = id
        self.name = name
        self.summary = summary
        self.category = category
        self.serving = serving
        self.time = time
        self.ingredients = ingredients
        self.instructions = instructions
        self.imageData = imageData
    }
}
