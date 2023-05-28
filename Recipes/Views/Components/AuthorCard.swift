//
//  AuthorCard.swift
//  Recipes
//
//  Created by Ashb0rn on 28/05/23.
//

import SwiftUI

struct AuthorCard: View {
    var url: String = "https://www.github.com/FredericXS"
            
    var body: some View {
        HStack(alignment: .center) {
            AsyncImage(url: URL(string: "https://avatars.githubusercontent.com/u/100254007?v=4")) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                Image(systemName: "photo")
            }
            .cornerRadius(.infinity)
            .frame(width: 48, height: 48)
                
            VStack {
                HStack {
                    Button {
                        UIApplication.shared.open(URL(string: url)!)
                    } label: {
                        Text("FredericXS")
                            .fontWeight(.bold)
                    }
                    .padding(.horizontal, 6)
                    Spacer()
                }
                HStack {
                    Text("Visit my GitHub")
                        .padding(.horizontal, 6)
                        .font(.footnote)
                    Spacer()
                }
            }
        }
        .foregroundColor(.blue)
    }
}

struct AuthorCard_Previews: PreviewProvider {
    static var previews: some View {
        AuthorCard()
    }
}
