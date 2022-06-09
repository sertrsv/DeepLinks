//
//  ModelData.swift
//  DeepLinks
//
//  Created by Sergey Tarasov on 09.06.2022.
//

import SwiftUI

/// Simple ViewModel
class ModelData: ObservableObject {
    @Published var isDarkMode: Bool = true
    @Published var isShowMenuOnSearchView: Bool = true
    @Published var isShowArrowOnDetailHomeView: Bool = true
    
    @Published var currentTab: Tab = Tab.home
    @Published var currentDetailPage: String?
    
    /// Check the deep link and go through it
    ///
    /// - Parameter url: url like logoapp://id
    func checkDeepLink(url: URL) -> Bool {
        guard let host = URLComponents(url: url, resolvingAgainstBaseURL: true)?.host else { return false }
        
        currentDetailPage = nil
        
        switch host {
        case Tab.home.rawValue:
            currentTab = .home
        case Tab.search.rawValue:
            currentTab = .search
        case Tab.settings.rawValue:
            currentTab = .settings
        default:
            return checkInternalLink(host: host)
        }
        
        return true
    }
    
    /// Open a specific view in search tab by id
    ///
    /// - Parameter host: from 'URLComponents().host
    func checkInternalLink(host: String) -> Bool {
        guard let index = logos.firstIndex(where: { $0.id == host }) else { return false }
        print("host: \(host), index: \(index)")
        currentTab = .search
        currentDetailPage = logos[index].id
        return true
    }
}

/// Main tabs of app
enum Tab: String {
    case home = "home"
    case search = "search"
    case settings = "settings"
}
