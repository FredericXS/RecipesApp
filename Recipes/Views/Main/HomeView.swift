//
//  HomeView.swift
//  Recipes
//
//  Created by Ashb0rn on 21/05/23.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var recipesVM: RecipesViewModel
    
    var body: some View {
        NavigationStack {
            ScrollView {
                RecipeList(recipes: recipesVM.recipes)
            }
            .navigationTitle("My Recipes")
            .toolbar {
                Button {
                    // Show the "AddRecipeView"
                    recipesVM.showAddRecipe = true
                } label: {
                    Text("New Recipe")
                }
            }
            .sheet(isPresented: $recipesVM.showAddRecipe) {
                AddRecipeView()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(RecipesViewModel())
    }
}
