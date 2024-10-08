//
//  BooksContentView.swift
//  GraphQLBootCamp
//
//  Created by Bhavin Thummar on 2024-10-04.
//

import SwiftUI

struct BooksView: View {
    
    @StateObject private var viewModel: BooksViewModel = BooksViewModel()
    
    var body: some View {
        /// Content
        NavigationSplitView {
            List {
                ForEach(viewModel.books, id: \.self) { book in
                    
                    NavigationLink {
                        BookDetailView(viewModel: BookDetailViewModel(id: book.id ?? ""))
                    } label: {
                        BookView(title: book.title ?? "unknown",
                                 author: book.authors?.map({ $0.name ?? "unknown" }).joined(separator: ", ") ?? "unknown",
                                 isFavorite: book.isFavorite ?? false)
                        .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                            Button(role: .destructive) {
                                // viewModel.delete(book)
                            } label: {
                                Label("delete", systemImage: "trash.fill")
                            }
                            Button {
                                // Llamar función para editar nombre
                            } label: {
                                let label = book.isFavorite ?? false ? "remove" : "favorite"
                                let image = book.isFavorite ?? false ? "star.fill" : "star"
                                Label(label, systemImage: image)
                            }
                            .tint(.green)
                        }
                    }
                }
            }
            .navigationTitle("Books")
            .onAppear(perform: { viewModel.getBooks() })
        } detail: {
            Text("Select a Book")
        }
    }
}

#Preview {
    BooksView()
}


