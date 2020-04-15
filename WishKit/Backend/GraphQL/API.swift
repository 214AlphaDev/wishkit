//  This file was automatically generated and should not be edited.

import Apollo

/// API namespace
public enum API {
  public enum Category: RawRepresentable, Equatable, Hashable, Apollo.JSONDecodable, Apollo.JSONEncodable {
    public typealias RawValue = String
    case book
    case seed
    case other
    /// Auto generated constant for unknown enum values
    case __unknown(RawValue)

    public init?(rawValue: RawValue) {
      switch rawValue {
        case "Book": self = .book
        case "Seed": self = .seed
        case "Other": self = .other
        default: self = .__unknown(rawValue)
      }
    }

    public var rawValue: RawValue {
      switch self {
        case .book: return "Book"
        case .seed: return "Seed"
        case .other: return "Other"
        case .__unknown(let value): return value
      }
    }

    public static func == (lhs: Category, rhs: Category) -> Bool {
      switch (lhs, rhs) {
        case (.book, .book): return true
        case (.seed, .seed): return true
        case (.other, .other): return true
        case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
        default: return false
      }
    }
  }

  public enum VoteError: RawRepresentable, Equatable, Hashable, Apollo.JSONDecodable, Apollo.JSONEncodable {
    public typealias RawValue = String
    case wishDoesNotExist
    case noVotesLeft
    case unauthenticated
    /// Auto generated constant for unknown enum values
    case __unknown(RawValue)

    public init?(rawValue: RawValue) {
      switch rawValue {
        case "WishDoesNotExist": self = .wishDoesNotExist
        case "NoVotesLeft": self = .noVotesLeft
        case "Unauthenticated": self = .unauthenticated
        default: self = .__unknown(rawValue)
      }
    }

    public var rawValue: RawValue {
      switch self {
        case .wishDoesNotExist: return "WishDoesNotExist"
        case .noVotesLeft: return "NoVotesLeft"
        case .unauthenticated: return "Unauthenticated"
        case .__unknown(let value): return value
      }
    }

    public static func == (lhs: VoteError, rhs: VoteError) -> Bool {
      switch (lhs, rhs) {
        case (.wishDoesNotExist, .wishDoesNotExist): return true
        case (.noVotesLeft, .noVotesLeft): return true
        case (.unauthenticated, .unauthenticated): return true
        case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
        default: return false
      }
    }
  }

  public enum WithdrawVoteError: RawRepresentable, Equatable, Hashable, Apollo.JSONDecodable, Apollo.JSONEncodable {
    public typealias RawValue = String
    case wishDoesNotExist
    case unauthenticated
    /// Auto generated constant for unknown enum values
    case __unknown(RawValue)

    public init?(rawValue: RawValue) {
      switch rawValue {
        case "WishDoesNotExist": self = .wishDoesNotExist
        case "Unauthenticated": self = .unauthenticated
        default: self = .__unknown(rawValue)
      }
    }

    public var rawValue: RawValue {
      switch self {
        case .wishDoesNotExist: return "WishDoesNotExist"
        case .unauthenticated: return "Unauthenticated"
        case .__unknown(let value): return value
      }
    }

    public static func == (lhs: WithdrawVoteError, rhs: WithdrawVoteError) -> Bool {
      switch (lhs, rhs) {
        case (.wishDoesNotExist, .wishDoesNotExist): return true
        case (.unauthenticated, .unauthenticated): return true
        case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
        default: return false
      }
    }
  }

  public enum CreateWishError: RawRepresentable, Equatable, Hashable, Apollo.JSONDecodable, Apollo.JSONEncodable {
    public typealias RawValue = String
    case unauthenticated
    /// Auto generated constant for unknown enum values
    case __unknown(RawValue)

    public init?(rawValue: RawValue) {
      switch rawValue {
        case "Unauthenticated": self = .unauthenticated
        default: self = .__unknown(rawValue)
      }
    }

    public var rawValue: RawValue {
      switch self {
        case .unauthenticated: return "Unauthenticated"
        case .__unknown(let value): return value
      }
    }

    public static func == (lhs: CreateWishError, rhs: CreateWishError) -> Bool {
      switch (lhs, rhs) {
        case (.unauthenticated, .unauthenticated): return true
        case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
        default: return false
      }
    }
  }

  public final class VoteForWishMutation: GraphQLMutation {
    public let operationDefinition =
      "mutation VoteForWish($id: UUIDV4!) {\n  vote(id: $id) {\n    __typename\n    wish {\n      __typename\n      id\n      name\n      description\n      story\n      votes\n      votedOnIt\n      category\n    }\n    votesLeft\n    error\n  }\n}"

    public var id: String

    public init(id: String) {
      self.id = id
    }

    public var variables: GraphQLMap? {
      return ["id": id]
    }

    public struct Data: GraphQLSelectionSet {
      public static let possibleTypes = ["Mutation"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("vote", arguments: ["id": GraphQLVariable("id")], type: .nonNull(.object(Vote.selections))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(vote: Vote) {
        self.init(unsafeResultMap: ["__typename": "Mutation", "vote": vote.resultMap])
      }

      /// vote on a wish
      public var vote: Vote {
        get {
          return Vote(unsafeResultMap: resultMap["vote"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "vote")
        }
      }

      public struct Vote: GraphQLSelectionSet {
        public static let possibleTypes = ["VoteResponse"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("wish", type: .object(Wish.selections)),
          GraphQLField("votesLeft", type: .scalar(Int.self)),
          GraphQLField("error", type: .scalar(VoteError.self)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(wish: Wish? = nil, votesLeft: Int? = nil, error: VoteError? = nil) {
          self.init(unsafeResultMap: ["__typename": "VoteResponse", "wish": wish.flatMap { (value: Wish) -> ResultMap in value.resultMap }, "votesLeft": votesLeft, "error": error])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// wish
        public var wish: Wish? {
          get {
            return (resultMap["wish"] as? ResultMap).flatMap { Wish(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "wish")
          }
        }

        /// votes that are left
        public var votesLeft: Int? {
          get {
            return resultMap["votesLeft"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "votesLeft")
          }
        }

        /// error that might happen during voting
        public var error: VoteError? {
          get {
            return resultMap["error"] as? VoteError
          }
          set {
            resultMap.updateValue(newValue, forKey: "error")
          }
        }

        public struct Wish: GraphQLSelectionSet {
          public static let possibleTypes = ["Wish"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(String.self))),
            GraphQLField("name", type: .nonNull(.scalar(String.self))),
            GraphQLField("description", type: .nonNull(.scalar(String.self))),
            GraphQLField("story", type: .scalar(String.self)),
            GraphQLField("votes", type: .nonNull(.scalar(Int.self))),
            GraphQLField("votedOnIt", type: .nonNull(.scalar(Bool.self))),
            GraphQLField("category", type: .nonNull(.scalar(Category.self))),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: String, name: String, description: String, story: String? = nil, votes: Int, votedOnIt: Bool, category: Category) {
            self.init(unsafeResultMap: ["__typename": "Wish", "id": id, "name": name, "description": description, "story": story, "votes": votes, "votedOnIt": votedOnIt, "category": category])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// unique id of the wish
          public var id: String {
            get {
              return resultMap["id"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          /// name of the wish
          public var name: String {
            get {
              return resultMap["name"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
            }
          }

          /// description of the wish
          public var description: String {
            get {
              return resultMap["description"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "description")
            }
          }

          /// story behind this wish
          public var story: String? {
            get {
              return resultMap["story"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "story")
            }
          }

          /// votes on that wish
          public var votes: Int {
            get {
              return resultMap["votes"]! as! Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "votes")
            }
          }

          /// did the currently authenticated person voted on it
          public var votedOnIt: Bool {
            get {
              return resultMap["votedOnIt"]! as! Bool
            }
            set {
              resultMap.updateValue(newValue, forKey: "votedOnIt")
            }
          }

          /// category of wish
          public var category: Category {
            get {
              return resultMap["category"]! as! Category
            }
            set {
              resultMap.updateValue(newValue, forKey: "category")
            }
          }
        }
      }
    }
  }

  public final class WithdrawVoteFromWishMutation: GraphQLMutation {
    public let operationDefinition =
      "mutation WithdrawVoteFromWish($id: UUIDV4!) {\n  withdrawVote(id: $id) {\n    __typename\n    wish {\n      __typename\n      id\n      name\n      description\n      story\n      votes\n      votedOnIt\n      category\n    }\n    votesLeft\n    error\n  }\n}"

    public var id: String

    public init(id: String) {
      self.id = id
    }

    public var variables: GraphQLMap? {
      return ["id": id]
    }

    public struct Data: GraphQLSelectionSet {
      public static let possibleTypes = ["Mutation"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("withdrawVote", arguments: ["id": GraphQLVariable("id")], type: .nonNull(.object(WithdrawVote.selections))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(withdrawVote: WithdrawVote) {
        self.init(unsafeResultMap: ["__typename": "Mutation", "withdrawVote": withdrawVote.resultMap])
      }

      /// remove vote from wish
      public var withdrawVote: WithdrawVote {
        get {
          return WithdrawVote(unsafeResultMap: resultMap["withdrawVote"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "withdrawVote")
        }
      }

      public struct WithdrawVote: GraphQLSelectionSet {
        public static let possibleTypes = ["WithdrawVoteResponse"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("wish", type: .object(Wish.selections)),
          GraphQLField("votesLeft", type: .scalar(Int.self)),
          GraphQLField("error", type: .scalar(WithdrawVoteError.self)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(wish: Wish? = nil, votesLeft: Int? = nil, error: WithdrawVoteError? = nil) {
          self.init(unsafeResultMap: ["__typename": "WithdrawVoteResponse", "wish": wish.flatMap { (value: Wish) -> ResultMap in value.resultMap }, "votesLeft": votesLeft, "error": error])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// wish
        public var wish: Wish? {
          get {
            return (resultMap["wish"] as? ResultMap).flatMap { Wish(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "wish")
          }
        }

        /// votes that the current logged in user has left
        public var votesLeft: Int? {
          get {
            return resultMap["votesLeft"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "votesLeft")
          }
        }

        /// error happend during withdrawing a vote
        public var error: WithdrawVoteError? {
          get {
            return resultMap["error"] as? WithdrawVoteError
          }
          set {
            resultMap.updateValue(newValue, forKey: "error")
          }
        }

        public struct Wish: GraphQLSelectionSet {
          public static let possibleTypes = ["Wish"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(String.self))),
            GraphQLField("name", type: .nonNull(.scalar(String.self))),
            GraphQLField("description", type: .nonNull(.scalar(String.self))),
            GraphQLField("story", type: .scalar(String.self)),
            GraphQLField("votes", type: .nonNull(.scalar(Int.self))),
            GraphQLField("votedOnIt", type: .nonNull(.scalar(Bool.self))),
            GraphQLField("category", type: .nonNull(.scalar(Category.self))),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: String, name: String, description: String, story: String? = nil, votes: Int, votedOnIt: Bool, category: Category) {
            self.init(unsafeResultMap: ["__typename": "Wish", "id": id, "name": name, "description": description, "story": story, "votes": votes, "votedOnIt": votedOnIt, "category": category])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// unique id of the wish
          public var id: String {
            get {
              return resultMap["id"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          /// name of the wish
          public var name: String {
            get {
              return resultMap["name"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
            }
          }

          /// description of the wish
          public var description: String {
            get {
              return resultMap["description"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "description")
            }
          }

          /// story behind this wish
          public var story: String? {
            get {
              return resultMap["story"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "story")
            }
          }

          /// votes on that wish
          public var votes: Int {
            get {
              return resultMap["votes"]! as! Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "votes")
            }
          }

          /// did the currently authenticated person voted on it
          public var votedOnIt: Bool {
            get {
              return resultMap["votedOnIt"]! as! Bool
            }
            set {
              resultMap.updateValue(newValue, forKey: "votedOnIt")
            }
          }

          /// category of wish
          public var category: Category {
            get {
              return resultMap["category"]! as! Category
            }
            set {
              resultMap.updateValue(newValue, forKey: "category")
            }
          }
        }
      }
    }
  }

  public final class WishesQuery: GraphQLQuery {
    public let operationDefinition =
      "query Wishes($fromId: UUIDV4, $count: Int!) {\n  wishes(start: $fromId, next: $count) {\n    __typename\n    id\n    name\n    description\n    story\n    votes\n    votedOnIt\n    category\n  }\n}"

    public var fromId: String?
    public var count: Int

    public init(fromId: String? = nil, count: Int) {
      self.fromId = fromId
      self.count = count
    }

    public var variables: GraphQLMap? {
      return ["fromId": fromId, "count": count]
    }

    public struct Data: GraphQLSelectionSet {
      public static let possibleTypes = ["Query"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("wishes", arguments: ["start": GraphQLVariable("fromId"), "next": GraphQLVariable("count")], type: .nonNull(.list(.nonNull(.object(Wish.selections))))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(wishes: [Wish]) {
        self.init(unsafeResultMap: ["__typename": "Query", "wishes": wishes.map { (value: Wish) -> ResultMap in value.resultMap }])
      }

      /// get all wishes
      public var wishes: [Wish] {
        get {
          return (resultMap["wishes"] as! [ResultMap]).map { (value: ResultMap) -> Wish in Wish(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: Wish) -> ResultMap in value.resultMap }, forKey: "wishes")
        }
      }

      public struct Wish: GraphQLSelectionSet {
        public static let possibleTypes = ["Wish"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(String.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
          GraphQLField("description", type: .nonNull(.scalar(String.self))),
          GraphQLField("story", type: .scalar(String.self)),
          GraphQLField("votes", type: .nonNull(.scalar(Int.self))),
          GraphQLField("votedOnIt", type: .nonNull(.scalar(Bool.self))),
          GraphQLField("category", type: .nonNull(.scalar(Category.self))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: String, name: String, description: String, story: String? = nil, votes: Int, votedOnIt: Bool, category: Category) {
          self.init(unsafeResultMap: ["__typename": "Wish", "id": id, "name": name, "description": description, "story": story, "votes": votes, "votedOnIt": votedOnIt, "category": category])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// unique id of the wish
        public var id: String {
          get {
            return resultMap["id"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        /// name of the wish
        public var name: String {
          get {
            return resultMap["name"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }

        /// description of the wish
        public var description: String {
          get {
            return resultMap["description"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "description")
          }
        }

        /// story behind this wish
        public var story: String? {
          get {
            return resultMap["story"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "story")
          }
        }

        /// votes on that wish
        public var votes: Int {
          get {
            return resultMap["votes"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "votes")
          }
        }

        /// did the currently authenticated person voted on it
        public var votedOnIt: Bool {
          get {
            return resultMap["votedOnIt"]! as! Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "votedOnIt")
          }
        }

        /// category of wish
        public var category: Category {
          get {
            return resultMap["category"]! as! Category
          }
          set {
            resultMap.updateValue(newValue, forKey: "category")
          }
        }
      }
    }
  }

  public final class CreateWishMutation: GraphQLMutation {
    public let operationDefinition =
      "mutation CreateWish($name: WishName!, $description: WishDescription!, $story: WishStory, $category: Category!) {\n  create(name: $name, description: $description, story: $story, category: $category) {\n    __typename\n    wish {\n      __typename\n      id\n      name\n      description\n      story\n      votes\n      votedOnIt\n      category\n    }\n    error\n  }\n}"

    public var name: String
    public var description: String
    public var story: String?
    public var category: Category

    public init(name: String, description: String, story: String? = nil, category: Category) {
      self.name = name
      self.description = description
      self.story = story
      self.category = category
    }

    public var variables: GraphQLMap? {
      return ["name": name, "description": description, "story": story, "category": category]
    }

    public struct Data: GraphQLSelectionSet {
      public static let possibleTypes = ["Mutation"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("create", arguments: ["name": GraphQLVariable("name"), "description": GraphQLVariable("description"), "story": GraphQLVariable("story"), "category": GraphQLVariable("category")], type: .nonNull(.object(Create.selections))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(create: Create) {
        self.init(unsafeResultMap: ["__typename": "Mutation", "create": create.resultMap])
      }

      /// create a new wish
      public var create: Create {
        get {
          return Create(unsafeResultMap: resultMap["create"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "create")
        }
      }

      public struct Create: GraphQLSelectionSet {
        public static let possibleTypes = ["CreateWishResponse"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("wish", type: .object(Wish.selections)),
          GraphQLField("error", type: .scalar(CreateWishError.self)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(wish: Wish? = nil, error: CreateWishError? = nil) {
          self.init(unsafeResultMap: ["__typename": "CreateWishResponse", "wish": wish.flatMap { (value: Wish) -> ResultMap in value.resultMap }, "error": error])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// the created wish
        public var wish: Wish? {
          get {
            return (resultMap["wish"] as? ResultMap).flatMap { Wish(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "wish")
          }
        }

        /// error that happend during wish creation
        public var error: CreateWishError? {
          get {
            return resultMap["error"] as? CreateWishError
          }
          set {
            resultMap.updateValue(newValue, forKey: "error")
          }
        }

        public struct Wish: GraphQLSelectionSet {
          public static let possibleTypes = ["Wish"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(String.self))),
            GraphQLField("name", type: .nonNull(.scalar(String.self))),
            GraphQLField("description", type: .nonNull(.scalar(String.self))),
            GraphQLField("story", type: .scalar(String.self)),
            GraphQLField("votes", type: .nonNull(.scalar(Int.self))),
            GraphQLField("votedOnIt", type: .nonNull(.scalar(Bool.self))),
            GraphQLField("category", type: .nonNull(.scalar(Category.self))),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: String, name: String, description: String, story: String? = nil, votes: Int, votedOnIt: Bool, category: Category) {
            self.init(unsafeResultMap: ["__typename": "Wish", "id": id, "name": name, "description": description, "story": story, "votes": votes, "votedOnIt": votedOnIt, "category": category])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// unique id of the wish
          public var id: String {
            get {
              return resultMap["id"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          /// name of the wish
          public var name: String {
            get {
              return resultMap["name"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
            }
          }

          /// description of the wish
          public var description: String {
            get {
              return resultMap["description"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "description")
            }
          }

          /// story behind this wish
          public var story: String? {
            get {
              return resultMap["story"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "story")
            }
          }

          /// votes on that wish
          public var votes: Int {
            get {
              return resultMap["votes"]! as! Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "votes")
            }
          }

          /// did the currently authenticated person voted on it
          public var votedOnIt: Bool {
            get {
              return resultMap["votedOnIt"]! as! Bool
            }
            set {
              resultMap.updateValue(newValue, forKey: "votedOnIt")
            }
          }

          /// category of wish
          public var category: Category {
            get {
              return resultMap["category"]! as! Category
            }
            set {
              resultMap.updateValue(newValue, forKey: "category")
            }
          }
        }
      }
    }
  }
}