//
//  ReviewViewModel.swift
//  GraphQLBootCamp
//
//  Created by Bhavin Thummar on 2024-10-07.
//

import Foundation
import BooksGraphQLBootCamp
import Apollo

class BookReviewViewModel {
    
    private var parentID: String
    
    @Published var reviews: [Review] = []
    
    var addSubscription: Cancellable?
    var updateSubscription: Cancellable?
    var deleteSubscription: Cancellable?

    init(parentID: String) {
        self.parentID = parentID
    }
    
    deinit {
        addSubscription?.cancel()
        updateSubscription?.cancel()
        deleteSubscription?.cancel()
    }
}

extension BookReviewViewModel: ReviewProtocol {
    
    func getReview() {
        ApolloNetwork.shared.apolloClient.fetch(query: BookReviewQuery(bookId: parentID)) { [weak self] result in
            switch result {
            case .success(let gQLResult):
                
                // Subscription
                self?.configureSubscription()
                
                guard let reviews = gQLResult.data?.bookReviews else { return }
                self?.updateReview(reviews)
                
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
    func addReview(rating: Double, comment: String) {
        let mutation = AddBookReviewMutation(bookId: parentID,
                                             review: AddReviewInput(rating: "\(Int(rating))", content: comment))
        ApolloNetwork.shared.apolloClient.perform(mutation: mutation) { [weak self] result in
            switch result {
            case .success(let gQLResult):
                guard let review = gQLResult.data?.addBookReview else { return }
                guard let availableReview = self?.reviews.filter ({ $0.id == review.id }),
                        availableReview.count < 1 else {
                    return
                }
                self?.reviews.append(Review(content: review.content, id: review.id, rating: review.rating))
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
    }
}

private extension BookReviewViewModel {

    func updateReview(_ reviews: [BookReviewQuery.Data.BookReview?]) {
        self.reviews = reviews.compactMap({ $0 }).map ({ Review(content: $0.content, id: $0.id, rating: $0.rating) })
    }
    
    func configureSubscription() {
        configureAddSubscription()
        configureUpdateSubscription()
        configureDeleteSubscription()
    }
    
    func configureAddSubscription() {
        addSubscription = ApolloNetwork.shared.apolloClient.subscribe(subscription: BookReviewAddSubscription()) { [weak self] result in
            switch result {
            case .success(let graphQLResult):
                guard let review = graphQLResult.data?.bookReviewAdded else { return }
                guard let availableReview = self?.reviews.filter ({ $0.id == review.id }),
                        availableReview.count < 1 else {
                    return
                }
                self?.reviews.append(Review(content: review.content, id: review.id, rating: review.rating))
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
    func configureUpdateSubscription() {
        updateSubscription = ApolloNetwork.shared.apolloClient.subscribe(subscription: BookReviewUpdateSubscription()) { [weak self] result in
            switch result {
            case .success(let graphQLResult):
                guard let updatedReview = graphQLResult.data?.bookReviewUpdated else { return }
                self?.reviews = self?.reviews.map ({ review in
                    return review.id == updatedReview.id ? Review(content: updatedReview.content,
                                                                  id: updatedReview.id,
                                                                  rating: updatedReview.rating) : review
                }) ?? []
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
    func configureDeleteSubscription() {
        deleteSubscription = ApolloNetwork.shared.apolloClient.subscribe(subscription: BookReviewDeleteSubscription()) { [weak self] result in
            switch result {
            case .success(let graphQLResult):
                guard let review = graphQLResult.data?.bookReviewDeleted else { return }
                self?.reviews = self?.reviews.filter ({ $0.id != review.id }) ?? []
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
    }
}
