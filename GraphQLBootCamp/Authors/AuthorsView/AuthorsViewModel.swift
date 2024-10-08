//
//  AuthorsViewModel.swift
//  GraphQLBootCamp
//
//  Created by Bhavin Thummar on 2024-10-04.
//

import Foundation
import BooksGraphQLBootCamp

class AuthorsViewModel: ObservableObject {
    
    @Published var authors: [AuthorsQuery.Data.Author?] = []
    
    init() {}
    
    func getAuthors() {
        ApolloNetwork.shared.apolloClient.fetch(query: AuthorsQuery()) {result in
            print(result)
            switch result {
            case .success(let gQLResult):
                guard let authors = gQLResult.data?.authors else { return }
                self.authors = authors
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
}
