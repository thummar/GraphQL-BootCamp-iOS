//
//  AuthorDetailView.swift
//  GraphQLBootCamp
//
//  Created by Bhavin Thummar on 2024-10-07.
//

import SwiftUI

struct AuthorDetailView: View {
    @StateObject var viewModel: AuthorDetailViewModel
    
    var body: some View {
        
        ScrollView {
            VStack(spacing: 16) {
                // Discription
                DiscriptionView(title: viewModel.author?.about ?? "",
                                imageURL: nil,
                                placeholderImage: UIImage(systemName: "person.fill"))
                .padding(.vertical)
                
                // Author
                VStack(alignment: .leading, spacing: 0) {
                    Text("Books")
                        .font(.title3)
                        .fontWeight(.bold)
                        .frame(alignment: .leading)
                        .foregroundColor(.primary)
                    
                    ForEach(viewModel.author?.books ?? [], id: \.self) { book in
                        BookView(title: book.title ?? "unknown",
                                 author: book.authors?.map({ $0.name ?? "unknown" }).joined(separator: ", ") ?? "unknown",
                                 isFavorite: book.isFavorite ?? false)
                    }
                }
                .padding(.horizontal)
                
                // Review
                ReviewComponent(viewModel: viewModel.reviewViewModel)
                    .padding(.horizontal)
                
            }
        }
        .scrollIndicators(.hidden)
        .navigationTitle(viewModel.author?.name ?? "")
        .onAppear(perform: { viewModel.getAutherDetails() })
    }
}

#Preview {
    AuthorDetailView(viewModel: AuthorDetailViewModel(id: "1"))
}
