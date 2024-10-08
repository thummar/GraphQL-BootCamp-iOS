//
//  BookDetailView.swift
//  GraphQLBootCamp
//
//  Created by Bhavin Thummar on 2024-10-04.
//

import SwiftUI

struct BookDetailView: View {
    
    @StateObject var viewModel: BookDetailViewModel
    
    var body: some View {
        
        ScrollView {
            VStack(spacing: 16) {
                // Discription
                DiscriptionView(title: viewModel.book?.about ?? "",
                                imageURL: nil,
                                placeholderImage: UIImage(systemName: "book.fill"))
                .padding(.vertical)
                
                // Author
                VStack(alignment: .leading, spacing: 0) {
                    Text("Authors")
                        .font(.title3)
                        .fontWeight(.bold)
                        .frame(alignment: .leading)
                        .foregroundColor(.primary)
                    
                    ForEach(viewModel.book?.authors ?? [], id: \.self) { author in
                        AuthorView(name: author.name ?? "unknown",
                                       isFavorite: author.isFavorite ?? false)
                    }
                }
                .padding(.horizontal)
                
                // Review
                ReviewComponent(viewModel: viewModel.reviewViewModel)
                .padding(.horizontal)

            }
        }
        .scrollIndicators(.hidden)
        .navigationTitle(viewModel.book?.title ?? "")
        .onAppear(perform: { viewModel.getBook() })
    }
}

#Preview {
    BookDetailView(viewModel: BookDetailViewModel(id: "1"))
}
