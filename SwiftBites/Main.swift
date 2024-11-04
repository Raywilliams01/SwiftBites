import SwiftUI
import SwiftData
/// The main view that appears when the app is launched.
struct ContentView: View {
 @Environment(\.modelContext) var modelContext
    
 @State private var categoryQuery = ""
 @State private var recipeQuery = ""
 @State private var ingredientsQuery = ""

  var body: some View {
    TabView {
        RecipesView(searchTerm: recipeQuery)
        .searchable(text: $recipeQuery)
        .tabItem {
          Label("Recipes", systemImage: "frying.pan")
        }

        CategoriesView(searchTerm: categoryQuery)
        .searchable(text: $categoryQuery)
        .tabItem {
          Label("Categories", systemImage: "tag")
        }

      IngredientsView(searchTerm: ingredientsQuery)
        .searchable(text: $ingredientsQuery)
        .tabItem {
          Label("Ingredients", systemImage: "carrot")
        }
    }
  }
}
