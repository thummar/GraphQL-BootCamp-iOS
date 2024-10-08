//
//  BookDetailViewModel.swift
//  GraphQLBootCamp
//
//  Created by Bhavin Thummar on 2024-10-04.
//

import Foundation
import BooksGraphQLBootCamp
import Apollo

class BookDetailViewModel: ObservableObject {
    
    private var id: String
    @Published private(set) var book: Book?
    
    lazy var reviewViewModel: BookReviewViewModel = {
        BookReviewViewModel(parentID: id)
    }()

    init(id: String) {
        self.id = id
    }

    func getBook() {
        ApolloNetwork.shared.apolloClient.fetch(query: BookQuery(bookId: id)) { [weak self] result in
            switch result {
            case .success(let gQLResult):
                guard let book = gQLResult.data?.book else { return }
                self?.updateBook(book)
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
    }

}

private extension BookDetailViewModel {
    
    func updateBook(_ book: BookQuery.Data.Book) {
        let authors = book.authors?.compactMap({ $0 }).map ({ Author(isFavorite: $0.isFavorite, id: $0.id, name: $0.name) })
        self.book = Book(about: book.about,
                         isFavorite: book.isFavorite,
                         id: book.id, title: book.title,
                         authors: authors,
                         reviews: nil)
    }
    
}
