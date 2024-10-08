//
//  AuthorsView.swift
//  GraphQLBootCamp
//
//  Created by Bhavin Thummar on 2024-10-04.
//

import SwiftUI

struct AuthorsView: View {
    @StateObject private var viewModel: AuthorsViewModel = AuthorsViewModel()
    
    var body: some View {
        /// Content
        NavigationSplitView {

            List {
                ForEach(viewModel.authors, id: \.self) { author in
                    NavigationLink {
                        AuthorDetailView(viewModel: AuthorDetailViewModel(id: author?.id ?? ""))
                    } label: {
                        AuthorView(name: author?.name ?? "",
                               isFavorite: author?.isFavorite ?? false)
                        .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                            Button(role: .destructive) {
                                print("Delete")
                                
                            } label: {
                                Label("delete", systemImage: "trash.fill")
                            }
                            Button {
                                // Make it Favorite
                            } label: {
                                let label = author?.isFavorite ?? false ? "remove" : "favorite"
                                let image = author?.isFavorite ?? false ? "star.fill" : "star"
                                Label(label, systemImage: image)
                            }
                            .tint(.green)
                        }
                    }
                }
            }
            .navigationTitle("Authors")
            .onAppear(perform: { viewModel.getAuthors() })
        } detail: {
            Text("Select a Author")
        }
    }
}

#Preview {
    AuthorsView()
}
