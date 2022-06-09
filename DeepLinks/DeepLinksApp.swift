//
//  DeepLinksApp.swift
//  DeepLinks
//
//  Created by Sergey Tarasov on 09.06.2022.
//

import SwiftUI

/// Start point of app
@main
struct DeepLinksApp: App {
    @StateObject var model: ModelData = ModelData()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(model)
                .onOpenURL { url in
                    if model.checkDeepLink(url: url) {
                        print("From deep link: \(url)")
                    } else {
                        print("Fall back deep link: \(url)")
                    }
                }
                .preferredColorScheme(model.isDarkMode ? .dark : .light)
        }
    }
}
