//
//  Feed.swift
//
//  Created by  on 30/11/23
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public class Feed {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let comment = "Comment"
    static let title = "title"
    static let userid = "userid"
    static let id = "id"
    static let image = "images"
    static let like = "like"
  }

  // MARK: Properties
  public var comment: [Comment]?
  public var title: String?
  public var userid: Int?
  public var id: Int?
  public var image: String?
  public var like: Int?

  // MARK: SwiftyJSON Initializers
  /// Initiates the instance based on the object.
  ///
  /// - parameter object: The object of either Dictionary or Array kind that was passed.
  /// - returns: An initialized instance of the class.
  public convenience init(object: Any) {
    self.init(json: JSON(object))
  }

  /// Initiates the instance based on the JSON that was passed.
  ///
  /// - parameter json: JSON object from SwiftyJSON.
  public required init(json: JSON) {
    if let items = json[SerializationKeys.comment].array { comment = items.map { Comment(json: $0) } }
    title = json[SerializationKeys.title].string
    userid = json[SerializationKeys.userid].int
    id = json[SerializationKeys.id].int
    image = json[SerializationKeys.image].string
    like = json[SerializationKeys.like].int
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = comment { dictionary[SerializationKeys.comment] = value.map { $0.dictionaryRepresentation() } }
    if let value = title { dictionary[SerializationKeys.title] = value }
    if let value = userid { dictionary[SerializationKeys.userid] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = image { dictionary[SerializationKeys.image] = value }
    if let value = like { dictionary[SerializationKeys.like] = value }
    return dictionary
  }

}
