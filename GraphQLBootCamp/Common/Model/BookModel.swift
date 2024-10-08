//
//  BookModel.swift
//  GraphQLBootCamp
//
//  Created by Bhavin Thummar on 2024-10-05.
//

import Foundation

struct Book: Identifiable, Hashable {
    
    var about: String?
    var isFavorite: Bool?
    var id: String?
    var title: String?
     
    var authors: [Author]?
    var reviews: [Review]?
}

struct Author: Identifiable, Hashable {
    
    var about: String?
    var isFavorite: Bool?
    var id: String?
    var name: String?
    
    var books: [Book]?
    var reviews: [Review]?
}

struct Review: Identifiable, Hashable {
    
    var content: String?
    var id: String?
    var rating: Int?
}
