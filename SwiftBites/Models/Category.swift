//
//  Category.swift
//  SwiftBites
//
//  Created by ray williams on 10/5/24.
//

import Foundation
import SwiftData

@Model
final class Category {
    @Attribute(.unique)
    var id: UUID
    @Attribute(.unique)
    var name: String

    
    @Relationship(deleteRule: .cascade)
    var recipes: [Recipe]
    
    
    init(id: UUID = UUID(), name: String = "", recipes: [Recipe] = []) {
        self.id = id
        self.name = name
        self.recipes = recipes
    }
}
