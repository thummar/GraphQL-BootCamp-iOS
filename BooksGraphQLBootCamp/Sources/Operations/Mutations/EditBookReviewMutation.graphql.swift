// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class EditBookReviewMutation: GraphQLMutation {
  public static let operationName: String = "EditBookReview"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"mutation EditBookReview($reviewId: ID!, $edits: EditReviewInput) { updateBookReview(id: $reviewId, edits: $edits) { __typename content rating id } }"#
    ))

  public var reviewId: ID
  public var edits: GraphQLNullable<EditReviewInput>

  public init(
    reviewId: ID,
    edits: GraphQLNullable<EditReviewInput>
  ) {
    self.reviewId = reviewId
    self.edits = edits
  }

  public var __variables: Variables? { [
    "reviewId": reviewId,
    "edits": edits
  ] }

  public struct Data: BooksGraphQLBootCamp.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: any ApolloAPI.ParentType { BooksGraphQLBootCamp.Objects.Mutation }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("updateBookReview", UpdateBookReview?.self, arguments: [
        "id": .variable("reviewId"),
        "edits": .variable("edits")
      ]),
    ] }

    public var updateBookReview: UpdateBookReview? { __data["updateBookReview"] }

    /// UpdateBookReview
    ///
    /// Parent Type: `BookReview`
    public struct UpdateBookReview: BooksGraphQLBootCamp.SelectionSet {
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
