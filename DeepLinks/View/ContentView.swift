//
//  ContentView.swift
//  DeepLinks
//
//  Created by Sergey Tarasov on 09.06.2022.
//

import SwiftUI

/// Main view with TabView
struct ContentView: View {
    @EnvironmentObject var model: ModelData
    var body: some View {
        TabView(selection: $model.currentTab) {
            HomeView()
                .environmentObject(model)
                .tag(Tab.home)
                .tabItem {
                    Label("Home", systemImage: "square.grid.2x2")
                }
            SearchView()
                .tag(Tab.search)
                .tabItem {
                    Label("Search", systemImage: "list.dash")
                }
            SettingsView()
                .tag(Tab.settings)
                .tabItem {
                    Label("Settings", systemImage: "gearshape")
                }
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var model: ModelData = ModelData()
    static var previews: some View {
        ContentView()
            .environmentObject(model)
    }
}
#endif
