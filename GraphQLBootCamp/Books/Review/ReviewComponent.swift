//
//  ReviewComponent.swift
//  GraphQLBootCamp
//
//  Created by Bhavin Thummar on 2024-10-07.
//

import SwiftUI

struct ReviewComponent<ViewModel>: View where ViewModel: ReviewProtocol {
    
    @StateObject var viewModel: ViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack {
                Text("Reviews")
                    .foregroundColor(.primary)
                Text("(\(viewModel.reviews.count))")
            }
            .font(.title3)
            .fontWeight(.bold)
            
            VStack {
                ForEach(viewModel.reviews, id: \.self) { review in
                    ReviewCommentView(rating: Double(review.rating ?? 0),
                                      content: review.content ?? "")
                }
            }
            
            // TextField
            VStack(alignment: .leading, spacing: 8) {
                Text("Add Review")
                    .font(.title2)
                    .fontWeight(.bold)
                                    
                ReviewTextFieldView(buttonAction: { rating, comment in
                    viewModel.addReview(rating: rating, comment: comment)
                }).padding(.vertical)
            }.padding(.vertical)
        }
        .onAppear(perform: { viewModel.getReview() })
    }
}

#Preview {
    ReviewComponent(viewModel: BookReviewViewModel(parentID: "1"))
}
