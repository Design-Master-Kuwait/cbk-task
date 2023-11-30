//
//  User.swift
//  CbkTask
//
//  Created by bhikhu on 28/11/23.
//

import Foundation
import SwiftyJSON

public final class User: NSObject, NSCoding, NSSecureCoding {

    public static var supportsSecureCoding: Bool {
        get { return true }
    }

    // MARK: Declaration for string constants to be used to decode and also serialize.
    private struct SerializationKeys {
        static let image = "image"
        static let id = "id"
        static let email = "email"
        static let name = "name"
        
    }

    // MARK: Properties
    public var socialType: RegistationType = .normal
    public var id: String?
    public var image: String?
    public var name: String?
    public var email: String?
    
    
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
        id = json[SerializationKeys.id].string
        image = json[SerializationKeys.image].string
        name = json[SerializationKeys.name].string
        email = json[SerializationKeys.email].string
        

    }
    /// Generates description of the object in the form of a NSDictionary.
    ///
    /// - returns: A Key value pair containing all valid values in the object.
    public func dictionaryRepresentation() -> [String: Any] {
        var dictionary: [String: Any] = [:]
        
        if let value = name { dictionary[SerializationKeys.name] = value }
        if let value = email { dictionary[SerializationKeys.email] = value }
        if let value = id { dictionary[SerializationKeys.id] = value }
        if let value = image { dictionary[SerializationKeys.image] = value }
        return dictionary
    }

    // MARK: NSCoding Protocol
    required public init(coder aDecoder: NSCoder) {
        
        self.name = aDecoder.decodeObject(forKey: SerializationKeys.name) as? String
        self.id = aDecoder.decodeObject(forKey: SerializationKeys.id) as? String
        self.image = aDecoder.decodeObject(forKey: SerializationKeys.image) as? String
    }
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: SerializationKeys.name)
        aCoder.encode(id, forKey: SerializationKeys.id)
        aCoder.encode(image, forKey: SerializationKeys.image)
        
    }
}
