//
//  HomeView.swift
//  GraphQLBootCamp
//
//  Created by Bhavin Thummar on 2024-10-04.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        
        TabView {
            BooksView()
                .tabItem { Label("Books", systemImage: "books.vertical") }
            AuthorsView()
                .tabItem { Label("Authors", systemImage: "person.3") }
        }
    }
}

#Preview {
    HomeView()
}
