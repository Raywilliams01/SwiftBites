import SwiftUI
import SwiftData

typealias CategoryGroup = [String: [Category]]

struct CategoriesView: View {
  @Environment(\.modelContext) var modelContext
  @Query private var categories: [Category]
    
  @State private var query = ""
  @State private var sortOrder = SortDescriptor(\Category.name)
  
    // MARK: - INIT
   init(searchTerm: String) {
       
       self.query = searchTerm
       _categories = Query(filter: #Predicate {
           if searchTerm.isEmpty  {
               return true
           } else {
               return $0.name.localizedStandardContains(searchTerm)
           }
       }, sort: [sortOrder])
   }
    
  // MARK: - Body
  var body: some View {
    NavigationStack {
      content
        .navigationTitle("Categories")
        .toolbar {
            if !categories.isEmpty {
                NavigationLink(value: CategoryForm.Mode.add) {
                  Label("Add", systemImage: "plus")
                }
            }
        }
        .navigationDestination(for: CategoryForm.Mode.self) { mode in
          CategoryForm(mode: mode)
        }
        .navigationDestination(for: RecipeForm.Mode.self) { mode in
          RecipeForm(mode: mode)
        }
    }
  }

  // MARK: - Views

  @ViewBuilder
  private var content: some View {
      if categories.isEmpty {
          empty
      } else {
          list(for: categories)
      }
      
  }

  private var empty: some View {
    ContentUnavailableView(
      label: {
        Label("No Categories", systemImage: "list.clipboard")
      },
      description: {
        Text("Categories you add will appear here.")
      },
      actions: {
        NavigationLink("Add Category", value: CategoryForm.Mode.add)
          .buttonBorderShape(.roundedRectangle)
          .buttonStyle(.borderedProminent)
      }
    )
  }

  private var noResults: some View {
    ContentUnavailableView(
      label: {
        Text("Couldn't find \"\(query)\"")
      }
    )
  }

  private func list(for categories: [Category]) -> some View {
    ScrollView(.vertical) {
      if categories.isEmpty {
          noResults
      } else {
          ForEach(categories, content: CategorySection.init)
      }
    }
  }
}


#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let schema = Schema([Recipe.self, Ingredient.self, RecipeIngredient.self, Category.self])
    let container = try! ModelContainer(for: schema, configurations: config)

    return CategoriesView(searchTerm: "").modelContainer(container)
}
