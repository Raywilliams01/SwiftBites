//
//  RecipeIngredient.swift
//  SwiftBites
//
//  Created by ray williams on 10/5/24.
//

import Foundation
import SwiftData

@Model
final class RecipeIngredient {
    var id: UUID
    var ingredient: Ingredient
    var quantity: String
    
    init(id: UUID = UUID(), ingredient: Ingredient, quantity: String = "") {
        self.id = id
        self.ingredient = ingredient
        self.quantity = quantity
    }
}
