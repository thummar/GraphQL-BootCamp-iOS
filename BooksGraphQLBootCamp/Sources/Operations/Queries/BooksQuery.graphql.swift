// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class BooksQuery: GraphQLQuery {
  public static let operationName: String = "Books"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query Books { books { __typename title isFavorite id authors { __typename name } } }"#
    ))

  public init() {}

  public struct Data: BooksGraphQLBootCamp.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: any ApolloAPI.ParentType { BooksGraphQLBootCamp.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("books", [Book?]?.self),
    ] }

    public var books: [Book?]? { __data["books"] }

    /// Book
    ///
    /// Parent Type: `Book`
    public struct Book: BooksGraphQLBootCamp.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: any ApolloAPI.ParentType { BooksGraphQLBootCamp.Objects.Book }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("title", String.self),
        .field("isFavorite", Bool?.self),
        .field("id", BooksGraphQLBootCamp.ID.self),
        .field("authors", [Author]?.self),
      ] }

      public var title: String { __data["title"] }
      public var isFavorite: Bool? { __data["isFavorite"] }
      public var id: BooksGraphQLBootCamp.ID { __data["id"] }
      public var authors: [Author]? { __data["authors"] }

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
        ] }

        public var name: String { __data["name"] }
      }
    }
  }
}
