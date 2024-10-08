//
//  ReviewCommentView.swift
//  GraphQLBootCamp
//
//  Created by Bhavin Thummar on 2024-10-04.
//
import SwiftUI

struct ReviewCommentView: View {
    
    @State var rating: Double
    @State var content: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            StarsView(rating: .constant(rating),
                      font: .body)
            
            Text(content)
                .font(.title3)
        }
        .padding(.vertical)
        .frame(maxWidth: .infinity,
                alignment: .leading)
    }
}

#Preview {
    ReviewCommentView(rating: 5, content: "Review content")
}
