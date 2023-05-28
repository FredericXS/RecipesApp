//
//  RecipesApp.swift
//  Recipes
//
//  Created by Ashb0rn on 21/05/23.
//

import SwiftUI

@main
struct RecipesApp: App {
    @StateObject var recipesViewModel = RecipesViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(recipesViewModel)
        }
    }
}
