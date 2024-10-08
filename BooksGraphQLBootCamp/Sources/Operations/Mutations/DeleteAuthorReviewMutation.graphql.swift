// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class DeleteAuthorReviewMutation: GraphQLMutation {
  public static let operationName: String = "DeleteAuthorReview"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"mutation DeleteAuthorReview($reviewId: ID!) { deleteAuthorReview(id: $reviewId) { __typename content rating id } }"#
    ))

  public var reviewId: ID

  public init(reviewId: ID) {
    self.reviewId = reviewId
  }

  public var __variables: Variables? { ["reviewId": reviewId] }

  public struct Data: BooksGraphQLBootCamp.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: any ApolloAPI.ParentType { BooksGraphQLBootCamp.Objects.Mutation }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("deleteAuthorReview", DeleteAuthorReview?.self, arguments: ["id": .variable("reviewId")]),
    ] }

    public var deleteAuthorReview: DeleteAuthorReview? { __data["deleteAuthorReview"] }

    /// DeleteAuthorReview
    ///
    /// Parent Type: `AutherReview`
    public struct DeleteAuthorReview: BooksGraphQLBootCamp.SelectionSet {
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
  }
}
