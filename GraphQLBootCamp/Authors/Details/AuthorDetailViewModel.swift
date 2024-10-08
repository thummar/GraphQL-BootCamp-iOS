//
//  AuthorDetailViewModel.swift
//  GraphQLBootCamp
//
//  Created by Bhavin Thummar on 2024-10-07.
//

import Foundation
import BooksGraphQLBootCamp
import Apollo

class AuthorDetailViewModel: ObservableObject {
    
    private var id: String
    @Published private(set) var author: Author?
    
    lazy var reviewViewModel: AuthorReviewViewModel = {
        AuthorReviewViewModel(parentID: id)
    }()

    init(id: String) {
        self.id = id
    }

    func getAutherDetails() {
        ApolloNetwork.shared.apolloClient.fetch(query: AuthorQuery(authorId: id)) { [weak self] result in
            switch result {
            case .success(let gQLResult):
                guard let author = gQLResult.data?.author else { return }
                self?.updateAuthor(author)
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
    }
}

private extension AuthorDetailViewModel {
    
    func updateAuthor(_ author: AuthorQuery.Data.Author) {
                
        let books = author.books?.compactMap({ $0 }).map { book in
            let authors = book.authors?.map({ Author(name: $0.name) })
            return Book(isFavorite: book.isFavorite, id: book.id, title: book.title, authors: authors)
        }
        
        self.author = Author(about: author.about,
                             isFavorite: author.isFavorite,
                             id: author.id,
                             name: author.name,
                             books: books,
                             reviews: nil)
    }
    
}
