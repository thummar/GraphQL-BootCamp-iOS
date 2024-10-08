// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class AuthorsQuery: GraphQLQuery {
  public static let operationName: String = "Authors"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query Authors { authors { __typename id isFavorite name } }"#
    ))

  public init() {}

  public struct Data: BooksGraphQLBootCamp.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: any ApolloAPI.ParentType { BooksGraphQLBootCamp.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("authors", [Author?]?.self),
    ] }

    public var authors: [Author?]? { __data["authors"] }

    /// Author
    ///
    /// Parent Type: `Author`
    public struct Author: BooksGraphQLBootCamp.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: any ApolloAPI.ParentType { BooksGraphQLBootCamp.Objects.Author }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("id", BooksGraphQLBootCamp.ID.self),
        .field("isFavorite", Bool.self),
        .field("name", String.self),
      ] }

      public var id: BooksGraphQLBootCamp.ID { __data["id"] }
      public var isFavorite: Bool { __data["isFavorite"] }
      public var name: String { __data["name"] }
    }
  }
}
