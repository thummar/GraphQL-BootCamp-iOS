// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class GetLaunchDetailsQuery: GraphQLQuery {
  public static let operationName: String = "GetLaunchDetails"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query GetLaunchDetails($launchesLimit2: Int) { company { __typename ceo employees founded founder name summary valuation } launches(limit: $launchesLimit2) { __typename launch_year launch_success id details mission_name mission_id rocket { __typename rocket_name rocket_type } launch_site { __typename site_name site_id } launch_date_utc } }"#
    ))

  public var launchesLimit2: GraphQLNullable<Int>

  public init(launchesLimit2: GraphQLNullable<Int>) {
    self.launchesLimit2 = launchesLimit2
  }

  public var __variables: Variables? { ["launchesLimit2": launchesLimit2] }

  public struct Data: SpaceXBootCamp.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: any ApolloAPI.ParentType { SpaceXBootCamp.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("company", Company?.self),
      .field("launches", [Launch?]?.self, arguments: ["limit": .variable("launchesLimit2")]),
    ] }

    public var company: Company? { __data["company"] }
    public var launches: [Launch?]? { __data["launches"] }

    /// Company
    ///
    /// Parent Type: `Info`
    public struct Company: SpaceXBootCamp.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: any ApolloAPI.ParentType { SpaceXBootCamp.Objects.Info }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("ceo", String?.self),
        .field("employees", Int?.self),
        .field("founded", Int?.self),
        .field("founder", String?.self),
        .field("name", String?.self),
        .field("summary", String?.self),
        .field("valuation", Double?.self),
      ] }

      public var ceo: String? { __data["ceo"] }
      public var employees: Int? { __data["employees"] }
      public var founded: Int? { __data["founded"] }
      public var founder: String? { __data["founder"] }
      public var name: String? { __data["name"] }
      public var summary: String? { __data["summary"] }
      public var valuation: Double? { __data["valuation"] }
    }

    /// Launch
    ///
    /// Parent Type: `Launch`
    public struct Launch: SpaceXBootCamp.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: any ApolloAPI.ParentType { SpaceXBootCamp.Objects.Launch }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("launch_year", String?.self),
        .field("launch_success", Bool?.self),
        .field("id", SpaceXBootCamp.ID?.self),
        .field("details", String?.self),
        .field("mission_name", String?.self),
        .field("mission_id", [String?]?.self),
        .field("rocket", Rocket?.self),
        .field("launch_site", Launch_site?.self),
        .field("launch_date_utc", SpaceXBootCamp.Date?.self),
      ] }

      public var launch_year: String? { __data["launch_year"] }
      public var launch_success: Bool? { __data["launch_success"] }
      public var id: SpaceXBootCamp.ID? { __data["id"] }
      public var details: String? { __data["details"] }
      public var mission_name: String? { __data["mission_name"] }
      public var mission_id: [String?]? { __data["mission_id"] }
      public var rocket: Rocket? { __data["rocket"] }
      public var launch_site: Launch_site? { __data["launch_site"] }
      public var launch_date_utc: SpaceXBootCamp.Date? { __data["launch_date_utc"] }

      /// Launch.Rocket
      ///
      /// Parent Type: `LaunchRocket`
      public struct Rocket: SpaceXBootCamp.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: any ApolloAPI.ParentType { SpaceXBootCamp.Objects.LaunchRocket }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("rocket_name", String?.self),
          .field("rocket_type", String?.self),
        ] }

        public var rocket_name: String? { __data["rocket_name"] }
        public var rocket_type: String? { __data["rocket_type"] }
      }

      /// Launch.Launch_site
      ///
      /// Parent Type: `LaunchSite`
      public struct Launch_site: SpaceXBootCamp.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: any ApolloAPI.ParentType { SpaceXBootCamp.Objects.LaunchSite }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("site_name", String?.self),
          .field("site_id", String?.self),
        ] }

        public var site_name: String? { __data["site_name"] }
        public var site_id: String? { __data["site_id"] }
      }
    }
  }
}
