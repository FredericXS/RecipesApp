//
//  RecipesViewModel.swift
//  Recipes
//
//  Created by Ashb0rn on 27/05/23.
//

import SwiftUI

class RecipesViewModel: ObservableObject {
    @Published private(set) var recipes: [Recipe] = []
    @Published var favoriteList: [Recipe] = []
    @Published var showAddRecipe: Bool = false
    @Published var isCardHidden: Bool = false
    
    init() {
        recipes = Recipe.all
    }
    
    func addRecipe(recipe: Recipe) {
        recipes.append(recipe)
    }
    
    func removeRecipe(at index: Int) {
        withAnimation {
            recipes.remove(at: index)
        }
    }
    
    func addToFavorites(_ recipe: Recipe) {
        favoriteList.append(recipe)
    }
    
    func removeFromFavorites(_ recipe: Recipe) {
        withAnimation {
            // Remove only the received recipe
            favoriteList.removeAll(where: { $0.id == recipe.id })
        }
    }
}
