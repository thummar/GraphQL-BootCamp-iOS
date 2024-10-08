// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class BookReviewDeleteSubscription: GraphQLSubscription {
  public static let operationName: String = "BookReviewDeleteSubscription"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"subscription BookReviewDeleteSubscription { bookReviewDeleted { __typename content id rating } }"#
    ))

  public init() {}

  public struct Data: BooksGraphQLBootCamp.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: any ApolloAPI.ParentType { BooksGraphQLBootCamp.Objects.Subscription }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("bookReviewDeleted", BookReviewDeleted?.self),
    ] }

    public var bookReviewDeleted: BookReviewDeleted? { __data["bookReviewDeleted"] }

    /// BookReviewDeleted
    ///
    /// Parent Type: `BookReview`
    public struct BookReviewDeleted: BooksGraphQLBootCamp.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: any ApolloAPI.ParentType { BooksGraphQLBootCamp.Objects.BookReview }
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
