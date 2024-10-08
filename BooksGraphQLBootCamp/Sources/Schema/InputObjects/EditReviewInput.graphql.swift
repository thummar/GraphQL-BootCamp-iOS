// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public struct EditReviewInput: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    rating: String,
    content: String
  ) {
    __data = InputDict([
      "rating": rating,
      "content": content
    ])
  }

  public var rating: String {
    get { __data["rating"] }
    set { __data["rating"] = newValue }
  }

  public var content: String {
    get { __data["content"] }
    set { __data["content"] = newValue }
  }
}
