//
//  SearchView.swift
//  DeepLinks
//
//  Created by Sergey Tarasov on 09.06.2022.
//

import SwiftUI

/// Search view tab with list
struct SearchView: View {
    @EnvironmentObject var model: ModelData
    var body: some View {
        NavigationView {
                ScrollView {
                    ForEach(logos) { logo in
                        NavigationLink(tag: logo.id, selection: $model.currentDetailPage) {
                            DetailView(logo)
                        } label: {
                            ZStack {
                                Image(logo.imageB)
                                    .resizable()
                                    .padding(.horizontal, -0)
                                    .offset(x: -40)
                                    .scaleEffect(1.3)
                                    .scaledToFill()
                                    .cornerRadius(6)
                                Image(logo.imageA)
                                    .resizable()
                                    .scaleEffect(1.7)
                                    .scaledToFit()
                                    .frame(width: 120)
                                    .cornerRadius(6)
                                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
                                    .padding(4)
                            }
                        }
                    }
                    .padding([.horizontal, .bottom])
            }
            .navigationTitle("Search")
            .toolbar {
                if model.isShowMenuOnSearchView {
                    Menu("To") {
                        ForEach(logos.indices, id: \.self) { index in
                            Button {
                                model.currentDetailPage = logos[index].id
                            } label: {
                                Text("To \(index + 1)")
                            }
                        }
                    }
                }
            }
        }
    }
    
    @ViewBuilder
    func DetailView(_ logo: Logo) -> some View {
        ScrollView(showsIndicators: false) {
            VStack {
                Image(logo.imageB)
                    .resizable()
                    .scaleEffect(1.3)
                    .scaledToFill()
                    .clipped()
                Image(systemName: "arrow.down")
                    .font(.system(size: 40, weight: .light))
                Image(logo.imageA)
                    .resizable()
                    .scaleEffect(1.5)
                    .scaledToFill()
                    .clipped()
                VStack(alignment: .leading, spacing: 12) {
                    Text(logo.title)
                        .font(.title.bold())
                    Text(logo.description)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            }
        }
        .navigationTitle(logo.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#if DEBUG
struct SearchView_Previews: PreviewProvider {
    static var model: ModelData = ModelData()
    static var previews: some View {
        SearchView()
            .environmentObject(model)
            .preferredColorScheme(.dark)
    }
}
#endif
