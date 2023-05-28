//
//  RecipePlaceholder.swift
//  Recipes
//
//  Created by Ashb0rn on 28/05/23.
//

import SwiftUI

struct RecipePlaceholder: View {
    var body: some View {
        Image(systemName: "photo")
            .resizable()
            .scaledToFit()
            .frame(width: 40, height: 40, alignment: .center)
            .foregroundColor(.white.opacity(0.7))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct RecipePlaceholder_Previews: PreviewProvider {
    static var previews: some View {
        RecipePlaceholder()
    }
}
