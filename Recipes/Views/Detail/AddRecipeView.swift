//
//  AddRecipeView.swift
//  Recipes
//
//  Created by Ashb0rn on 27/05/23.
//

import SwiftUI
import PhotosUI

struct AddRecipeView: View {
    @EnvironmentObject var recipesVM: RecipesViewModel
    
    @State private var name: String = ""
    @State private var imageItem: PhotosPickerItem?
    @State private var selectedImage: Image?
    @State private var selectedCategory: Category = Category.main
    @State private var description: String = ""
    @State private var ingredients: String = ""
    @State private var directions: String = ""
    @State private var navigateToRecipe = false
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Name")) {
                  TextField("Recipe Name", text: $name)
                }
                Section(header: Text("Photo")) {
                    PhotosPicker("Select a photo", selection: $imageItem, matching: .images)

                    if let selectedImage {
                        selectedImage
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)

                    }
                }
                
                Section(header: Text("Category")) {
                    Picker("Category", selection: $selectedCategory) {
                        // Show all available categories
                        ForEach(Category.allCases) { category in
                            Text(category.rawValue)
                                .tag(category)
                        }
                    }
                }
                Section(header: Text("Description")) {
                    TextEditor(text: $description)
                }
                Section(header: Text("Ingredients")) {
                    TextEditor(text: $ingredients)
                }
                Section(header: Text("Directions")) {
                    TextEditor(text: $directions)
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Text("Cancel")
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        saveRecipe()
                        navigateToRecipe = true
                    } label: {
                        Text("Save")
                    }
                    .disabled(name.isEmpty)
                    // If the name is empty, you can't save a new recipe
                }
            }
            .onChange(of: imageItem) { _ in
                Task {
                    // Getting the image from PhotosPicker
                    if let data = try? await imageItem?.loadTransferable(type: Data.self) {
                        if let uiImage = UIImage(data: data) {
                            selectedImage = Image(uiImage: uiImage)
                            return
                        }
                    }
                }
            }
            .navigationTitle("New Recipe")
            .navigationBarTitleDisplayMode(.inline)
            .navigationDestination(isPresented: $navigateToRecipe) {
                // If there's no recipes, don't navigate to the newest recipe because app will crash
                if recipesVM.recipes.count > 0 {
                    RecipeView(recipe: recipesVM.recipes.sorted{ $0.datePublished > $1.datePublished }[0])
                        .navigationBarBackButtonHidden(true)
                }
            }
        }
    }
}

struct AddRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        AddRecipeView()
            .environmentObject(RecipesViewModel())
    }
}

extension AddRecipeView {
    private func saveRecipe() {
        let now = Date()
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-mm-dd"
        
        let datePublished = dateFormatter.string(from: now)
        
        let recipe = Recipe(name: name, importedImage: selectedImage, description: description, ingredients: ingredients, directions: directions, category: selectedCategory.rawValue, datePublished: datePublished, url: "")
        
        recipesVM.addRecipe(recipe: recipe)
    }
}
