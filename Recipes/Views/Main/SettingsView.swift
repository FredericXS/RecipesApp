//
//  SettingsView.swift
//  Recipes
//
//  Created by Ashb0rn on 21/05/23.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationStack {
            List {
                Section {
                    AuthorCard()
                } header: {
                    Label("Created by", systemImage: "wrench.and.screwdriver")
                }
                Section {
                    Text("Version \((Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String)!)")
                } header: {
                    Label("App info", systemImage: "info.circle")
                }
            }
            .navigationTitle("Settings")
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
