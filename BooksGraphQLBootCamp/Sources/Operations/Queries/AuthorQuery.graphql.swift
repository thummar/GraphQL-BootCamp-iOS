// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class AuthorQuery: GraphQLQuery {
  public static let operationName: String = "Author"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query Author($authorId: ID!) { author(id: $authorId) { __typename about id isFavorite name reviews { __typename content rating id } books { __typename id title isFavorite authors { __typename name } } } }"#
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
      .field("author", Author?.self, arguments: ["id": .variable("authorId")]),
    ] }

    public var author: Author? { __data["author"] }

    /// Author
    ///
    /// Parent Type: `Author`
    public struct Author: BooksGraphQLBootCamp.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: any ApolloAPI.ParentType { BooksGraphQLBootCamp.Objects.Author }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("about", String.self),
        .field("id", BooksGraphQLBootCamp.ID.self),
        .field("isFavorite", Bool.self),
        .field("name", String.self),
        .field("reviews", [Review]?.self),
        .field("books", [Book]?.self),
      ] }

      public var about: String { __data["about"] }
      public var id: BooksGraphQLBootCamp.ID { __data["id"] }
      public var isFavorite: Bool { __data["isFavorite"] }
      public var name: String { __data["name"] }
      public var reviews: [Review]? { __data["reviews"] }
      public var books: [Book]? { __data["books"] }

      /// Author.Review
      ///
      /// Parent Type: `AutherReview`
      public struct Review: BooksGraphQLBootCamp.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: any ApolloAPI.ParentType { BooksGraphQLBootCamp.Objects.AutherReview }
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

      /// Author.Book
      ///
      /// Parent Type: `Book`
      public struct Book: BooksGraphQLBootCamp.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: any ApolloAPI.ParentType { BooksGraphQLBootCamp.Objects.Book }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("id", BooksGraphQLBootCamp.ID.self),
          .field("title", String.self),
          .field("isFavorite", Bool?.self),
          .field("authors", [Author]?.self),
        ] }

        public var id: BooksGraphQLBootCamp.ID { __data["id"] }
        public var title: String { __data["title"] }
        public var isFavorite: Bool? { __data["isFavorite"] }
        public var authors: [Author]? { __data["authors"] }

        /// Author.Book.Author
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
}
