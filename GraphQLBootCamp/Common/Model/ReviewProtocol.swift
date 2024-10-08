//
//  ReviewInterface.swift
//  GraphQLBootCamp
//
//  Created by Bhavin Thummar on 2024-10-07.
//

import Foundation

protocol ReviewProtocol: ObservableObject {
    var reviews: [Review] { set get }

    func getReview()
    func addReview(rating: Double, comment: String)
}

