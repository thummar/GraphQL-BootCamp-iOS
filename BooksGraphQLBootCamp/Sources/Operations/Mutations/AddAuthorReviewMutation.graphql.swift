// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class AddAuthorReviewMutation: GraphQLMutation {
  public static let operationName: String = "AddAuthorReview"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"mutation AddAuthorReview($authorId: ID!, $review: AddReviewInput!) { addAuthorReview(authorID: $authorId, review: $review) { __typename content id rating } }"#
    ))

  public var authorId: ID
  public var review: AddReviewInput

  public init(
    authorId: ID,
    review: AddReviewInput
  ) {
    self.authorId = authorId
    self.review = review
  }

  public var __variables: Variables? { [
    "authorId": authorId,
    "review": review
  ] }

  public struct Data: BooksGraphQLBootCamp.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: any ApolloAPI.ParentType { BooksGraphQLBootCamp.Objects.Mutation }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("addAuthorReview", AddAuthorReview?.self, arguments: [
        "authorID": .variable("authorId"),
        "review": .variable("review")
      ]),
    ] }

    public var addAuthorReview: AddAuthorReview? { __data["addAuthorReview"] }

    /// AddAuthorReview
    ///
    /// Parent Type: `AutherReview`
    public struct AddAuthorReview: BooksGraphQLBootCamp.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: any ApolloAPI.ParentType { BooksGraphQLBootCamp.Objects.AutherReview }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("content", String.self),
        .field("id", BooksGraphQLBootCamp.ID.self),
        .field("rating", Int.self),
      ] }

      public var content: String { __data["content"] }
      public var id: BooksGraphQLBootCamp.ID { __data["id"] }
      public var rating: Int { __data["rating"] }
    }
  }
}
