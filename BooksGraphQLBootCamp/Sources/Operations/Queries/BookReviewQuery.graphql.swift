// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class BookReviewQuery: GraphQLQuery {
  public static let operationName: String = "BookReview"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query BookReview($bookId: ID!) { bookReviews(id: $bookId) { __typename content id rating } }"#
    ))

  public var bookId: ID

  public init(bookId: ID) {
    self.bookId = bookId
  }

  public var __variables: Variables? { ["bookId": bookId] }

  public struct Data: BooksGraphQLBootCamp.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: any ApolloAPI.ParentType { BooksGraphQLBootCamp.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("bookReviews", [BookReview?]?.self, arguments: ["id": .variable("bookId")]),
    ] }

    public var bookReviews: [BookReview?]? { __data["bookReviews"] }

    /// BookReview
    ///
    /// Parent Type: `BookReview`
    public struct BookReview: BooksGraphQLBootCamp.SelectionSet {
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
