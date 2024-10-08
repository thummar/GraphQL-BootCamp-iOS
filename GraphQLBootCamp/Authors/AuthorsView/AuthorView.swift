//
//  Author.swift
//  GraphQLBootCamp
//
//  Created by Bhavin Thummar on 2024-10-04.
//

import SwiftUI

struct AuthorView: View {
    
    @State var name: String
    @State var isFavorite: Bool
    
    var body: some View {
    
                HStack(alignment: .center, spacing: 16) {
                    AsyncImage(url: URL(string: "https://example.com")) { phase in
                        switch phase {
                        case .failure:
                            Image(systemName: "person.fill")
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
                    .clipShape(Circle())
                    .overlay {
                        Circle().stroke(.white, lineWidth: 2)
                    }
                    
                    VStack(alignment: .leading, spacing: 8){
                        HStack {
                            Text(name)
                                .font(.title2)
                                .fontWeight(.semibold)
                        }
                    }
                    .frame(maxWidth: .infinity,
                            alignment: .leading)
                    .foregroundColor(.black)
                    
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
    AuthorView(name: "Author", isFavorite: true)
}
