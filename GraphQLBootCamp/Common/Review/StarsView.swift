//
//  StarsView.swift
//  GraphQLBootCamp
//
//  Created by Bhavin Thummar on 2024-10-07.
//

import SwiftUI

struct StarsView: View {
    
    private let maxRating = 5
    private let spacing: CGFloat = 0
    
    @Binding var rating: Double
    var isEditable: Bool
    var font: Font
    
    init(
        rating: Binding<Double>,
        isEditable: Bool = false,
        font: Font) {
        _rating = rating
        self.isEditable = isEditable
        self.font = font
    }
    
    var body: some View {
        HStack(spacing: 1) {
            ForEach(.zero..<maxRating, id: \.self) { index in
                Image(systemName: "star.fill")
                    .font(font)
                    .overlay(
                        GeometryReader { proxy in
                            Rectangle()
                                .foregroundStyle(!isEditable ? .yellow : .red)
                                .frame(
                                    width: proxy.size.width * fillStar(at: index),
                                    height: proxy.size.height
                                )
                        }.mask(Image(systemName: "star.fill").font(font))
                    )
                    .onTapGesture {
                        if isEditable {
                            rating = Double(index) + 1
                        }
                    }
            }
            .foregroundStyle(Color.gray)
        }
    }
    
    private func fillStar(at index: Int) -> CGFloat {
        return rating >= Double(index) + 1
        ? 1
        : (rating > Double(index) ? CGFloat(rating - Double(index)) : .zero)
    }
}


#Preview {
    StarsView(rating: .constant(4.0), font: .title)
}
