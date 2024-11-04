import SwiftUI
import SwiftData

@main
struct SwiftBitesApp: App {
    
    let container: ModelContainer = {
        let schema = Schema([Recipe.self, Ingredient.self, RecipeIngredient.self, Category.self])

        let container = try! ModelContainer(for: schema, configurations: [])
        
        return container
    }()
    
  var body: some Scene {
    WindowGroup {
      ContentView()
    }.modelContainer(container)
  }
}
