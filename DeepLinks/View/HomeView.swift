//
//  HomeView.swift
//  DeepLinks
//
//  Created by Sergey Tarasov on 09.06.2022.
//

import SwiftUI

/// Home view tab with grid
struct HomeView: View {
    @EnvironmentObject var model: ModelData
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(
                    columns: [
                        GridItem(.flexible(minimum: 100, maximum: 500), spacing: 8, alignment: .center),
                        GridItem(.flexible(minimum: 100, maximum: 500), spacing: 8, alignment: .center)],
                    alignment: .center,
                    spacing: 8) {
                        ForEach(logos) { logo in
                            NavigationLink {
                                DetailView(logo)
                            } label: {
                                Image(logo.imageA)
                                    .resizable()
                                    .scaleEffect(1.7)
                                    .scaledToFill()
                                    .cornerRadius(6)
                                    .overlay {
                                        RoundedRectangle(cornerRadius: 6)
                                            .stroke(.gray, lineWidth: 0.3)
                                    }
                            }
                        }
                    }
                    .padding(.horizontal, 8)
                    .padding(.bottom)
            }
            .navigationTitle("Home")
        }
    }
    
    @ViewBuilder
    func DetailView(_ logo: Logo) -> some View {
        ScrollView(showsIndicators: false) {
            VStack {
                Image(logo.imageA)
                    .resizable()
                    .padding(.horizontal, -160)
                    .padding(.vertical, -60)
                    .scaledToFill()
                    .clipped()
                VStack(alignment: .leading, spacing: 12) {
                    Button {
                        UIApplication.shared.open(URL(string: "deeplinksapp://\(logo.id)")!, options: [:])
                        print("Opened view through open(URL)")
                    } label: {
                        Text(logo.title)
                            .font(.title.bold())
                    }
                    Text(logo.description)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            }
        }
        .navigationTitle(logo.title)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            if model.isShowArrowOnDetailHomeView {
                Button {
                    if model.checkDeepLink(url: URL(string: "deeplinksapp://\(logo.id)")!) {
                        print("Deep link to other view")
                    }
                } label: {
                    Image(systemName: "arrow.right")
                }
            }
        }
    }
}

#if DEBUG
struct HomeView_Previews: PreviewProvider {
    static var model: ModelData = ModelData()
    static var previews: some View {
        HomeView()
            .environmentObject(model)
            .preferredColorScheme(.dark)
    }
}
#endif
