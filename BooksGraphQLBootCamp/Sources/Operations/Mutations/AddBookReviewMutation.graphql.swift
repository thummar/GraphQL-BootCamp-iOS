// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class AddBookReviewMutation: GraphQLMutation {
  public static let operationName: String = "AddBookReview"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"mutation AddBookReview($bookId: ID!, $review: AddReviewInput!) { addBookReview(bookID: $bookId, review: $review) { __typename content rating id } }"#
    ))

  public var bookId: ID
  public var review: AddReviewInput

  public init(
    bookId: ID,
    review: AddReviewInput
  ) {
    self.bookId = bookId
    self.review = review
  }

  public var __variables: Variables? { [
    "bookId": bookId,
    "review": review
  ] }

  public struct Data: BooksGraphQLBootCamp.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: any ApolloAPI.ParentType { BooksGraphQLBootCamp.Objects.Mutation }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("addBookReview", AddBookReview?.self, arguments: [
        "bookID": .variable("bookId"),
        "review": .variable("review")
      ]),
    ] }

    public var addBookReview: AddBookReview? { __data["addBookReview"] }

    /// AddBookReview
    ///
    /// Parent Type: `BookReview`
    public struct AddBookReview: BooksGraphQLBootCamp.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: any ApolloAPI.ParentType { BooksGraphQLBootCamp.Objects.BookReview }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("content", String.self),
        .field("rating", Int.self),
        .field("id", BooksGraphQLBootCamp.ID.self),
      ] }

      public var content: String { __data["content"] }
      public var rating: Int { __data["rating"] }
      public var id: BooksGraphQLBootCamp.ID { __data["id"] }
    }
  }
}
