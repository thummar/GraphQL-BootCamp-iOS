//
//  ReviewTextFieldView.swift
//  GraphQLBootCamp
//
//  Created by Bhavin Thummar on 2024-10-07.
//

import SwiftUI

struct ReviewTextFieldView: View {
    
    @State private(set) var text: String = ""
    @State private(set) var rating: Double = 0.0
    
    var buttonAction: ((Double, String) -> Void)?

    init(buttonAction: ((Double, String) -> Void)? = nil) {
        self.buttonAction = buttonAction
    }
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 8) {
            
            StarsView(rating: $rating, isEditable: true, font: .title)
            
            ZStack(alignment: .bottom) {
                TextField("Comment...", text: $text, axis: .vertical)
                    .padding(.trailing, 25)
                    .padding(16)
                    .background(
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(lineWidth: 1.0)
                            .foregroundStyle(Color(uiColor: .clear))
                            .background(Color.gray.opacity(0.1)
                                .clipShape(RoundedRectangle(cornerRadius: 25))
                            )
                    )
                
                HStack(alignment: .bottom) {
                    Spacer()
                    
                    Button( action: {
                        self.buttonAction?(rating, text)
                    }, label: {
                        Image(systemName: "arrow.up.circle.fill")
                            .foregroundColor(Color(uiColor: (rating > 0 && text.count > 0) ? .systemBlue : .systemGray))
                            .font(.title)
                            .padding(.trailing, 10)
                    })
                    .disabled((rating > 0 && text.count > 0) ? false : true)

                }.padding(.bottom, 10)
            }
        }
    }
}

#Preview {
    ReviewTextFieldView() { rating, message in
        print(rating)
        print(message)
    }
}
