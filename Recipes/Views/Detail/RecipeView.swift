//
//  RecipeView.swift
//  Recipes
//
//  Created by Ashb0rn on 21/05/23.
//

import SwiftUI

struct RecipeView: View {
    var recipe: Recipe
    
    var body: some View {
        ScrollView {
            if recipe.image != nil {
                AsyncImage(url: URL(string: recipe.image!)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                } placeholder: {}
                
            } else if recipe.importedImage != nil {
                recipe.importedImage!
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .scaledToFill()
                    .frame(height: 300, alignment: .center)
                    .clipped()
                    .background(LinearGradient(gradient: Gradient(colors: [Color(.gray).opacity(0.3), Color.gray]), startPoint: .top, endPoint: .bottom))
            } else {
                RecipePlaceholder()
                    .scaledToFill()
                    .frame(height: 300, alignment: .center)
                    .clipped()
                    .background(LinearGradient(gradient: Gradient(colors: [Color(.gray).opacity(0.3), Color.gray]), startPoint: .top, endPoint: .bottom))
            }
            
            VStack(spacing: 30) {
                Text(recipe.name)
                    .font(.largeTitle)
                    .bold()
                    .multilineTextAlignment(.center)
                
                VStack(alignment: .leading, spacing: 30) {
                    if !recipe.description.isEmpty {
                        Text(recipe.description)
                    }
                    
                    if !recipe.ingredients.isEmpty {
                        VStack(alignment: .leading, spacing: 20) {
                            Text("Ingredients")
                                .font(.headline)
                            
                            Text(recipe.ingredients)
                        }
                    }
                    
                    if !recipe.directions.isEmpty {
                        VStack(alignment: .leading, spacing: 20) {
                            Text("Directions")
                                .font(.headline)
                            
                            Text(recipe.directions)
                        }
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.horizontal)
        }
        .ignoresSafeArea(.container, edges: .top)
    }
}

struct RecipeView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeView(recipe: Recipe.all[0])
    }
}
