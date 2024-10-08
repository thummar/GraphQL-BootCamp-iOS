// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class BookQuery: GraphQLQuery {
  public static let operationName: String = "Book"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query Book($bookId: ID!) { book(id: $bookId) { __typename about authors { __typename name isFavorite id } isFavorite id title reviews { __typename content id rating } } }"#
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
      .field("book", Book?.self, arguments: ["id": .variable("bookId")]),
    ] }

    public var book: Book? { __data["book"] }

    /// Book
    ///
    /// Parent Type: `Book`
    public struct Book: BooksGraphQLBootCamp.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: any ApolloAPI.ParentType { BooksGraphQLBootCamp.Objects.Book }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("about", String.self),
        .field("authors", [Author]?.self),
        .field("isFavorite", Bool?.self),
        .field("id", BooksGraphQLBootCamp.ID.self),
        .field("title", String.self),
        .field("reviews", [Review]?.self),
      ] }

      public var about: String { __data["about"] }
      public var authors: [Author]? { __data["authors"] }
      public var isFavorite: Bool? { __data["isFavorite"] }
      public var id: BooksGraphQLBootCamp.ID { __data["id"] }
      public var title: String { __data["title"] }
      public var reviews: [Review]? { __data["reviews"] }

      /// Book.Author
      ///
      /// Parent Type: `Author`
      public struct Author: BooksGraphQLBootCamp.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: any ApolloAPI.ParentType { BooksGraphQLBootCamp.Objects.Author }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("name", String.self),
          .field("isFavorite", Bool.self),
          .field("id", BooksGraphQLBootCamp.ID.self),
        ] }

        public var name: String { __data["name"] }
        public var isFavorite: Bool { __data["isFavorite"] }
        public var id: BooksGraphQLBootCamp.ID { __data["id"] }
      }

      /// Book.Review
      ///
      /// Parent Type: `BookReview`
      public struct Review: BooksGraphQLBootCamp.SelectionSet {
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
}
