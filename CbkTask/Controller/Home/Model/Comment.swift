//
//  Comment.swift
//
//  Created by  on 30/11/23
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public class Comment {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let comment = "comment"
  }

  // MARK: Properties
  public var comment: String?

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
    comment = json[SerializationKeys.comment].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = comment { dictionary[SerializationKeys.comment] = value }
    return dictionary
  }

}
