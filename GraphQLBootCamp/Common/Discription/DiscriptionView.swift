//
//  DiscriptionView.swift
//  GraphQLBootCamp
//
//  Created by Bhavin Thummar on 2024-10-07.
//

import SwiftUI

struct DiscriptionView: View {
    var title: String
    var imageURL: URL?
    var placeholderImage: UIImage?
    
    var body: some View {
        VStack {
            Image(uiImage: placeholderImage ?? UIImage())
                .resizable()
                .scaledToFit()
                .frame(height: 100)
                .frame(maxWidth: .infinity)
                .padding(75)
                .background(.placeholder)
            
            Text(title)
                .font(.title2)
                .foregroundColor(.secondary)
                .padding(EdgeInsets(top: 4,leading: 4,bottom: 4,trailing: 4))

        }
    }
}

#Preview {
    DiscriptionView(title: "title", placeholderImage: UIImage(systemName: "book"))
}
