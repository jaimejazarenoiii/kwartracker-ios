// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

/// Autogenerated input type of SignUpWithEmail
public struct SignUpWithEmailInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - email
  ///   - password
  ///   - passwordConfirmation
  ///   - profile
  ///   - clientMutationId: A unique identifier for the client performing the mutation.
  public init(email: String, password: String, passwordConfirmation: String, profile: ProfileInput, clientMutationId: Swift.Optional<String?> = nil) {
    graphQLMap = ["email": email, "password": password, "passwordConfirmation": passwordConfirmation, "profile": profile, "clientMutationId": clientMutationId]
  }

  public var email: String {
    get {
      return graphQLMap["email"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "email")
    }
  }

  public var password: String {
    get {
      return graphQLMap["password"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "password")
    }
  }

  public var passwordConfirmation: String {
    get {
      return graphQLMap["passwordConfirmation"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "passwordConfirmation")
    }
  }

  public var profile: ProfileInput {
    get {
      return graphQLMap["profile"] as! ProfileInput
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "profile")
    }
  }

  /// A unique identifier for the client performing the mutation.
  public var clientMutationId: Swift.Optional<String?> {
    get {
      return graphQLMap["clientMutationId"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "clientMutationId")
    }
  }
}

/// Arguments for user profile
public struct ProfileInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - firstName
  ///   - middleName
  ///   - lastName
  ///   - gender
  ///   - age
  public init(firstName: String, middleName: Swift.Optional<String?> = nil, lastName: String, gender: Int, age: Int) {
    graphQLMap = ["firstName": firstName, "middleName": middleName, "lastName": lastName, "gender": gender, "age": age]
  }

  public var firstName: String {
    get {
      return graphQLMap["firstName"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "firstName")
    }
  }

  public var middleName: Swift.Optional<String?> {
    get {
      return graphQLMap["middleName"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "middleName")
    }
  }

  public var lastName: String {
    get {
      return graphQLMap["lastName"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "lastName")
    }
  }

  public var gender: Int {
    get {
      return graphQLMap["gender"] as! Int
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "gender")
    }
  }

  public var age: Int {
    get {
      return graphQLMap["age"] as! Int
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "age")
    }
  }
}

public struct CredentialsInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - email
  ///   - password
  public init(email: String, password: String) {
    graphQLMap = ["email": email, "password": password]
  }

  public var email: String {
    get {
      return graphQLMap["email"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "email")
    }
  }

  public var password: String {
    get {
      return graphQLMap["password"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "password")
    }
  }
}

public final class AuthenticationMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation Authentication($signUpEmailInput: SignUpWithEmailInput!, $signInCredential: CredentialsInput!) {
      signUpWithEmail(input: $signUpEmailInput) {
        __typename
        token
      }
      signInWithEmail(input: {credentials: $signInCredential}) {
        __typename
        token
        user {
          __typename
          id
          email
          firstName
          lastName
          middleName
          gender
          age
        }
      }
    }
    """

  public let operationName: String = "Authentication"

  public var signUpEmailInput: SignUpWithEmailInput
  public var signInCredential: CredentialsInput

  public init(signUpEmailInput: SignUpWithEmailInput, signInCredential: CredentialsInput) {
    self.signUpEmailInput = signUpEmailInput
    self.signInCredential = signInCredential
  }

  public var variables: GraphQLMap? {
    return ["signUpEmailInput": signUpEmailInput, "signInCredential": signInCredential]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("signUpWithEmail", arguments: ["input": GraphQLVariable("signUpEmailInput")], type: .object(SignUpWithEmail.selections)),
        GraphQLField("signInWithEmail", arguments: ["input": ["credentials": GraphQLVariable("signInCredential")]], type: .object(SignInWithEmail.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(signUpWithEmail: SignUpWithEmail? = nil, signInWithEmail: SignInWithEmail? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "signUpWithEmail": signUpWithEmail.flatMap { (value: SignUpWithEmail) -> ResultMap in value.resultMap }, "signInWithEmail": signInWithEmail.flatMap { (value: SignInWithEmail) -> ResultMap in value.resultMap }])
    }

    /// Sign up user using email and password credentials
    public var signUpWithEmail: SignUpWithEmail? {
      get {
        return (resultMap["signUpWithEmail"] as? ResultMap).flatMap { SignUpWithEmail(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "signUpWithEmail")
      }
    }

    /// Sign in user
    public var signInWithEmail: SignInWithEmail? {
      get {
        return (resultMap["signInWithEmail"] as? ResultMap).flatMap { SignInWithEmail(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "signInWithEmail")
      }
    }

    public struct SignUpWithEmail: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["AuthenticatedUser"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("token", type: .nonNull(.scalar(String.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(token: String) {
        self.init(unsafeResultMap: ["__typename": "AuthenticatedUser", "token": token])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var token: String {
        get {
          return resultMap["token"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "token")
        }
      }
    }

    public struct SignInWithEmail: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["AuthenticatedUser"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("token", type: .nonNull(.scalar(String.self))),
          GraphQLField("user", type: .nonNull(.object(User.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(token: String, user: User) {
        self.init(unsafeResultMap: ["__typename": "AuthenticatedUser", "token": token, "user": user.resultMap])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var token: String {
        get {
          return resultMap["token"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "token")
        }
      }

      public var user: User {
        get {
          return User(unsafeResultMap: resultMap["user"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "user")
        }
      }

      public struct User: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["User"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("email", type: .nonNull(.scalar(String.self))),
            GraphQLField("firstName", type: .nonNull(.scalar(String.self))),
            GraphQLField("lastName", type: .nonNull(.scalar(String.self))),
            GraphQLField("middleName", type: .scalar(String.self)),
            GraphQLField("gender", type: .nonNull(.scalar(String.self))),
            GraphQLField("age", type: .nonNull(.scalar(Int.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, email: String, firstName: String, lastName: String, middleName: String? = nil, gender: String, age: Int) {
          self.init(unsafeResultMap: ["__typename": "User", "id": id, "email": email, "firstName": firstName, "lastName": lastName, "middleName": middleName, "gender": gender, "age": age])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var email: String {
          get {
            return resultMap["email"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "email")
          }
        }

        public var firstName: String {
          get {
            return resultMap["firstName"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "firstName")
          }
        }

        public var lastName: String {
          get {
            return resultMap["lastName"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "lastName")
          }
        }

        public var middleName: String? {
          get {
            return resultMap["middleName"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "middleName")
          }
        }

        public var gender: String {
          get {
            return resultMap["gender"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "gender")
          }
        }

        public var age: Int {
          get {
            return resultMap["age"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "age")
          }
        }
      }
    }
  }
}

public final class SignInMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation SignIn($signInCredential: CredentialsInput!) {
      signInWithEmail(input: {credentials: $signInCredential}) {
        __typename
        token
        user {
          __typename
          id
          email
          firstName
          lastName
          middleName
          gender
          age
        }
      }
    }
    """

  public let operationName: String = "SignIn"

  public var signInCredential: CredentialsInput

  public init(signInCredential: CredentialsInput) {
    self.signInCredential = signInCredential
  }

  public var variables: GraphQLMap? {
    return ["signInCredential": signInCredential]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("signInWithEmail", arguments: ["input": ["credentials": GraphQLVariable("signInCredential")]], type: .object(SignInWithEmail.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(signInWithEmail: SignInWithEmail? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "signInWithEmail": signInWithEmail.flatMap { (value: SignInWithEmail) -> ResultMap in value.resultMap }])
    }

    /// Sign in user
    public var signInWithEmail: SignInWithEmail? {
      get {
        return (resultMap["signInWithEmail"] as? ResultMap).flatMap { SignInWithEmail(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "signInWithEmail")
      }
    }

    public struct SignInWithEmail: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["AuthenticatedUser"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("token", type: .nonNull(.scalar(String.self))),
          GraphQLField("user", type: .nonNull(.object(User.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(token: String, user: User) {
        self.init(unsafeResultMap: ["__typename": "AuthenticatedUser", "token": token, "user": user.resultMap])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var token: String {
        get {
          return resultMap["token"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "token")
        }
      }

      public var user: User {
        get {
          return User(unsafeResultMap: resultMap["user"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "user")
        }
      }

      public struct User: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["User"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("email", type: .nonNull(.scalar(String.self))),
            GraphQLField("firstName", type: .nonNull(.scalar(String.self))),
            GraphQLField("lastName", type: .nonNull(.scalar(String.self))),
            GraphQLField("middleName", type: .scalar(String.self)),
            GraphQLField("gender", type: .nonNull(.scalar(String.self))),
            GraphQLField("age", type: .nonNull(.scalar(Int.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, email: String, firstName: String, lastName: String, middleName: String? = nil, gender: String, age: Int) {
          self.init(unsafeResultMap: ["__typename": "User", "id": id, "email": email, "firstName": firstName, "lastName": lastName, "middleName": middleName, "gender": gender, "age": age])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var email: String {
          get {
            return resultMap["email"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "email")
          }
        }

        public var firstName: String {
          get {
            return resultMap["firstName"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "firstName")
          }
        }

        public var lastName: String {
          get {
            return resultMap["lastName"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "lastName")
          }
        }

        public var middleName: String? {
          get {
            return resultMap["middleName"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "middleName")
          }
        }

        public var gender: String {
          get {
            return resultMap["gender"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "gender")
          }
        }

        public var age: Int {
          get {
            return resultMap["age"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "age")
          }
        }
      }
    }
  }
}

public final class SignUpMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation SignUp($signUpEmailInput: SignUpWithEmailInput!) {
      signUpWithEmail(input: $signUpEmailInput) {
        __typename
        token
      }
    }
    """

  public let operationName: String = "SignUp"

  public var signUpEmailInput: SignUpWithEmailInput

  public init(signUpEmailInput: SignUpWithEmailInput) {
    self.signUpEmailInput = signUpEmailInput
  }

  public var variables: GraphQLMap? {
    return ["signUpEmailInput": signUpEmailInput]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("signUpWithEmail", arguments: ["input": GraphQLVariable("signUpEmailInput")], type: .object(SignUpWithEmail.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(signUpWithEmail: SignUpWithEmail? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "signUpWithEmail": signUpWithEmail.flatMap { (value: SignUpWithEmail) -> ResultMap in value.resultMap }])
    }

    /// Sign up user using email and password credentials
    public var signUpWithEmail: SignUpWithEmail? {
      get {
        return (resultMap["signUpWithEmail"] as? ResultMap).flatMap { SignUpWithEmail(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "signUpWithEmail")
      }
    }

    public struct SignUpWithEmail: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["AuthenticatedUser"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("token", type: .nonNull(.scalar(String.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(token: String) {
        self.init(unsafeResultMap: ["__typename": "AuthenticatedUser", "token": token])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var token: String {
        get {
          return resultMap["token"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "token")
        }
      }
    }
  }
}

public final class FetchProfileQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query FetchProfile {
      profile {
        __typename
        email
        id
        firstName
        middleName
        lastName
        age
        gender
      }
    }
    """

  public let operationName: String = "FetchProfile"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("profile", type: .object(Profile.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(profile: Profile? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "profile": profile.flatMap { (value: Profile) -> ResultMap in value.resultMap }])
    }

    /// Current user profile
    public var profile: Profile? {
      get {
        return (resultMap["profile"] as? ResultMap).flatMap { Profile(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "profile")
      }
    }

    public struct Profile: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["User"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("email", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("firstName", type: .nonNull(.scalar(String.self))),
          GraphQLField("middleName", type: .scalar(String.self)),
          GraphQLField("lastName", type: .nonNull(.scalar(String.self))),
          GraphQLField("age", type: .nonNull(.scalar(Int.self))),
          GraphQLField("gender", type: .nonNull(.scalar(String.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(email: String, id: GraphQLID, firstName: String, middleName: String? = nil, lastName: String, age: Int, gender: String) {
        self.init(unsafeResultMap: ["__typename": "User", "email": email, "id": id, "firstName": firstName, "middleName": middleName, "lastName": lastName, "age": age, "gender": gender])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var email: String {
        get {
          return resultMap["email"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "email")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var firstName: String {
        get {
          return resultMap["firstName"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "firstName")
        }
      }

      public var middleName: String? {
        get {
          return resultMap["middleName"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "middleName")
        }
      }

      public var lastName: String {
        get {
          return resultMap["lastName"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "lastName")
        }
      }

      public var age: Int {
        get {
          return resultMap["age"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "age")
        }
      }

      public var gender: String {
        get {
          return resultMap["gender"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "gender")
        }
      }
    }
  }
}
