//
//  FavoritesView.swift
//  Recipes
//
//  Created by Ashb0rn on 21/05/23.
//

import SwiftUI

struct FavoritesView: View {
    @EnvironmentObject var recipesVM: RecipesViewModel
    
    var body: some View {
        NavigationStack {
            ZStack {
                if recipesVM.favoriteList.isEmpty {
                    Text("You haven't saved any recipe to your favorites yet.")
                        .multilineTextAlignment(.center)
                        .foregroundColor(.gray)
                        .padding(.horizontal)
                } else {
                    ScrollView {
                        RecipeList(recipes: recipesVM.favoriteList, isFavoriteList: true)
                    }
                }
            }
            .navigationTitle("Favorites")
        }
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
            .environmentObject(RecipesViewModel())
    }
}
