// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class AuthorReviewUpdateSubscription: GraphQLSubscription {
  public static let operationName: String = "AuthorReviewUpdateSubscription"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"subscription AuthorReviewUpdateSubscription { authorReviewUpdated { __typename content id rating } }"#
    ))

  public init() {}

  public struct Data: BooksGraphQLBootCamp.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: any ApolloAPI.ParentType { BooksGraphQLBootCamp.Objects.Subscription }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("authorReviewUpdated", AuthorReviewUpdated?.self),
    ] }

    public var authorReviewUpdated: AuthorReviewUpdated? { __data["authorReviewUpdated"] }

    /// AuthorReviewUpdated
    ///
    /// Parent Type: `AutherReview`
    public struct AuthorReviewUpdated: BooksGraphQLBootCamp.SelectionSet {
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
