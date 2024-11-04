//
//  Ingredient.swift
//  SwiftBites
//
//  Created by ray williams on 10/5/24.
//

import Foundation
import SwiftData

@Model
final class Ingredient {
    var id: UUID
    var name: String
    
    init(id: UUID = UUID(), name: String = "") {
        self.id = id
        self.name = name
    }
}
