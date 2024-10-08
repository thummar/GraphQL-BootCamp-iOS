//
//  BooksViewModel.swift
//  GraphQLBootCamp
//
//  Created by Bhavin Thummar on 2024-10-04.
//

import Foundation
import BooksGraphQLBootCamp

class BooksViewModel: ObservableObject {
    
    @Published var books: [Book] = []
    
    init() {}
    
    func getBooks() {
        ApolloNetwork.shared.apolloClient.fetch(query: BooksQuery()) { [weak self] result in
            switch result {
            case .success(let gQLResult):
                guard let books = gQLResult.data?.books else { return }
                self?.updateBooks(books)
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
    func updateBooks(_ books: [BooksQuery.Data.Book?]) {
        self.books = books.compactMap({ $0 }).map { book in
            let authors = book.authors?.compactMap({ $0 }).map({ Author(name: $0.name) })
            return Book(isFavorite: book.isFavorite, id: book.id, title: book.title, authors: authors)
        }
    }
    
    //    func delete(_ book: BooksQuery.Data.Book?) {
    //
    //        guard let selectedBook = book else { return }
    //
    //        ApolloNetwork.shared.apolloClient?.perform(mutation: DeleteBookMutation(bookId: selectedBook.id)) { [weak self] result in
    //           switch result {
    //           case .success(let graphqlResult):
    //
    //               if let data = graphqlResult.data {
    //                   guard let index = self?.books.firstIndex(of: selectedBook) else { return }
    //                   self?.books.remove(at: index)
    //               }
    //
    //               if let errors = graphqlResult.errors, !errors.isEmpty {
    //                   errors.forEach { print($0.localizedDescription) }
    //               }
    //           case .failure(let error):
    //               print(error.localizedDescription)
    //           }
    //       }
    //    }
}
