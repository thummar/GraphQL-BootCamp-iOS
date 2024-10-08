// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class AuthorReviewQuery: GraphQLQuery {
  public static let operationName: String = "AuthorReview"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query AuthorReview($authorId: ID!) { authorReviews(id: $authorId) { __typename content id rating } }"#
    ))

  public var authorId: ID

  public init(authorId: ID) {
    self.authorId = authorId
  }

  public var __variables: Variables? { ["authorId": authorId] }

  public struct Data: BooksGraphQLBootCamp.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: any ApolloAPI.ParentType { BooksGraphQLBootCamp.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("authorReviews", [AuthorReview?]?.self, arguments: ["id": .variable("authorId")]),
    ] }

    public var authorReviews: [AuthorReview?]? { __data["authorReviews"] }

    /// AuthorReview
    ///
    /// Parent Type: `AutherReview`
    public struct AuthorReview: BooksGraphQLBootCamp.SelectionSet {
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
