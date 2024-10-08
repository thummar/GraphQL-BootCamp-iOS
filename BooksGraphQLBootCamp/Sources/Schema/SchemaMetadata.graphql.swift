// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public protocol SelectionSet: ApolloAPI.SelectionSet & ApolloAPI.RootSelectionSet
where Schema == BooksGraphQLBootCamp.SchemaMetadata {}

public protocol InlineFragment: ApolloAPI.SelectionSet & ApolloAPI.InlineFragment
where Schema == BooksGraphQLBootCamp.SchemaMetadata {}

public protocol MutableSelectionSet: ApolloAPI.MutableRootSelectionSet
where Schema == BooksGraphQLBootCamp.SchemaMetadata {}

public protocol MutableInlineFragment: ApolloAPI.MutableSelectionSet & ApolloAPI.InlineFragment
where Schema == BooksGraphQLBootCamp.SchemaMetadata {}

public enum SchemaMetadata: ApolloAPI.SchemaMetadata {
  public static let configuration: any ApolloAPI.SchemaConfiguration.Type = SchemaConfiguration.self

  public static func objectType(forTypename typename: String) -> ApolloAPI.Object? {
    switch typename {
    case "Query": return BooksGraphQLBootCamp.Objects.Query
    case "Author": return BooksGraphQLBootCamp.Objects.Author
    case "AutherReview": return BooksGraphQLBootCamp.Objects.AutherReview
    case "Book": return BooksGraphQLBootCamp.Objects.Book
    case "Mutation": return BooksGraphQLBootCamp.Objects.Mutation
    case "Subscription": return BooksGraphQLBootCamp.Objects.Subscription
    case "BookReview": return BooksGraphQLBootCamp.Objects.BookReview
    default: return nil
    }
  }
}

public enum Objects {}
public enum Interfaces {}
public enum Unions {}
