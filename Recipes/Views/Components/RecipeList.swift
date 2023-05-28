//
//  RecipeList.swift
//  Recipes
//
//  Created by Ashb0rn on 21/05/23.
//

import SwiftUI

struct RecipeList: View {
    @EnvironmentObject var recipesVM: RecipesViewModel
    var recipes: [Recipe]
    var isFavoriteList: Bool = false
    
    var body: some View {
        VStack {
            HStack {
                Text("\(recipes.count) \(recipes.count != 1 ? "recipes" : "recipe")")
                    .font(.headline)
                    .fontWeight(.medium)
                    .opacity(0.7)
                
                Spacer()
            }
            
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 160), spacing: 15)], spacing: 15) {
                ForEach(recipes) { recipe in
                    // Getting the index of the current element
                    let index = recipes.firstIndex(where: { $0 == recipe })!
                    
                    NavigationLink(destination: RecipeView(recipe: recipe)) {
                        RecipeCard(recipe: recipe)
                            .opacity(recipesVM.isCardHidden ? 0 : 1)
                            .contextMenu {
                                if recipesVM.favoriteList.contains(recipe) {
                                    Button {
                                        recipesVM.isCardHidden = true
                                        recipesVM.removeFromFavorites(recipe)
                                        recipesVM.isCardHidden = false
                                    } label: {
                                        Label("Unfavorite", systemImage: "star.slash")
                                    }
                                } else {
                                    Button {
                                        recipesVM.addToFavorites(recipe)
                                    } label: {
                                        Label("Favorite", systemImage: "star")
                                    }
                                }
                                
                                if !isFavoriteList {
                                    Button(role: .destructive) {
                                        recipesVM.isCardHidden = true
                                        recipesVM.removeRecipe(at: index)
                                        recipesVM.removeFromFavorites(recipe)
                                        recipesVM.isCardHidden = false
                                    } label: {
                                        Label("Delete", systemImage: "trash")
                                    }
                                }
                            }
                    }
                }
            }
            .padding(.top)
        }
        .padding(.horizontal)
    }
}

struct RecipeList_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            RecipeList(recipes: Recipe.all)
                .environmentObject(RecipesViewModel())
        }
    }
}
