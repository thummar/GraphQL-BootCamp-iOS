//
//  Book.swift
//  GraphQLBootCamp
//
//  Created by Bhavin Thummar on 2024-10-04.
//

import SwiftUI

struct BookView: View {
    @State var title: String
    @State var author: String
    @State var isFavorite: Bool

    var body: some View {
        
        HStack(alignment: .top, spacing: 16) {
            AsyncImage(url: URL(string: "https://example.com")) { phase in
                switch phase {
                case .failure:
                    Image(systemName: "book.fill")
                        .padding()
                        .font(.largeTitle)
                        .background(.placeholder)
                case .success(let image):
                    image.resizable()
                default:
                    ProgressView()
                }
            }
            .frame(width: 60, height: 60, alignment: .center)
            .clipShape(.rect(cornerRadius: 8))
            
            VStack(alignment: .leading, spacing: 8){
                Text(title)
                    .font(.title2)
                    .fontWeight(.semibold)
                Text(author)
            }
            .frame(maxWidth: .infinity,
                    alignment: .leading)
            
            if isFavorite {
                Image(systemName: "star.fill")
                    .padding()
            }
        }
        .padding(.vertical)
        .frame(maxWidth: .infinity,
                alignment: .leading)
    }
}

#Preview {
    BookView(title: "Book", author: "Author", isFavorite: true)
}
