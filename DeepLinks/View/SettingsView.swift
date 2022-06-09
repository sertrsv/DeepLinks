//
//  SettingsView.swift
//  DeepLinks
//
//  Created by Sergey Tarasov on 09.06.2022.
//

import SwiftUI

/// Settings view tab with toggles
struct SettingsView: View {
    @EnvironmentObject var model: ModelData
    var body: some View {
        NavigationView {
            List {
                Toggle(isOn: $model.isDarkMode) {
                    Text("Dark mode")
                }
                Toggle(isOn: $model.isShowMenuOnSearchView) {
                    Text("Show menu on search view")
                }
                Toggle(isOn: $model.isShowArrowOnDetailHomeView) {
                    Text("Show arrow on detail home view")
                }
            }
            .navigationTitle("Settings")
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var model: ModelData = ModelData()
    static var previews: some View {
        SettingsView()
            .preferredColorScheme(.dark)
            .environmentObject(model)
    }
}
