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
        static let apiToken = "api_token"
        static let openTime = "open_time"
        static let type = "type"
        static let closeTime = "close_time"
        static let id = "id"
        static let image = "image"
        static let phone = "phone"
        static let iban = "iban"
        static let name = "name"
        static let updatedAt = "updated_at"
        static let email = "email"
        static let commission = "commission"
        static let pickupAddress = "pickup_address"
        static let priority = "priority"
        static let returnPolicyArabic = "return_policy_arabic"
        static let status = "status"
        static let verified = "verified"
        static let notificationStatus = "notification_status"
        static let createdAt = "created_at"
        static let returnPolicy = "return_policy"
        static let totalCart_item = "totalCart_item"

    }

    // MARK: Properties
    public var socialType: RegistationType = .normal
    public var apiToken: String?
    public var openTime: String?
    public var type: Int?
    public var closeTime: String?
    public var id: String?
    public var image: String?
    public var phone: Int?
    public var iban: String?
    public var name: String?
    public var updatedAt: String?
    public var email: String?
    public var commission: Int?
    public var pickupAddress: String?
    public var priority: Int?
    public var returnPolicyArabic: String?
    public var status: Int?
    public var verified: Int?
    public var notificationStatus: Int?
    public var createdAt: String?
    public var returnPolicy: String?
    public var totalCart_item: Int?
    
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
        apiToken = json[SerializationKeys.apiToken].string
        openTime = json[SerializationKeys.openTime].string
        type = json[SerializationKeys.type].int
        closeTime = json[SerializationKeys.closeTime].string
        id = json[SerializationKeys.id].string
        image = json[SerializationKeys.image].string
        phone = json[SerializationKeys.phone].int
        iban = json[SerializationKeys.iban].string
        name = json[SerializationKeys.name].string
        updatedAt = json[SerializationKeys.updatedAt].string
        email = json[SerializationKeys.email].string
        commission = json[SerializationKeys.commission].int
        pickupAddress = json[SerializationKeys.pickupAddress].string
        priority = json[SerializationKeys.priority].int
        returnPolicyArabic = json[SerializationKeys.returnPolicyArabic].string
        status = json[SerializationKeys.status].int
        verified = json[SerializationKeys.verified].int
        notificationStatus = json[SerializationKeys.notificationStatus].int
        createdAt = json[SerializationKeys.createdAt].string
        returnPolicy = json[SerializationKeys.returnPolicy].string
        totalCart_item = json[SerializationKeys.totalCart_item].int

    }
    /// Generates description of the object in the form of a NSDictionary.
    ///
    /// - returns: A Key value pair containing all valid values in the object.
    public func dictionaryRepresentation() -> [String: Any] {
        var dictionary: [String: Any] = [:]
        if let value = apiToken { dictionary[SerializationKeys.apiToken] = value }
        if let value = openTime { dictionary[SerializationKeys.openTime] = value }
        if let value = type { dictionary[SerializationKeys.type] = value }
        if let value = closeTime { dictionary[SerializationKeys.closeTime] = value }
        if let value = id { dictionary[SerializationKeys.id] = value }
        if let value = image { dictionary[SerializationKeys.image] = value }
        if let value = phone { dictionary[SerializationKeys.phone] = value }
        if let value = iban { dictionary[SerializationKeys.iban] = value }
        if let value = name { dictionary[SerializationKeys.name] = value }
        if let value = updatedAt { dictionary[SerializationKeys.updatedAt] = value }
        if let value = email { dictionary[SerializationKeys.email] = value }
        if let value = commission { dictionary[SerializationKeys.commission] = value }
        if let value = pickupAddress { dictionary[SerializationKeys.pickupAddress] = value }
        if let value = priority { dictionary[SerializationKeys.priority] = value }
        if let value = returnPolicyArabic { dictionary[SerializationKeys.returnPolicyArabic] = value }
        if let value = status { dictionary[SerializationKeys.status] = value }
        if let value = verified { dictionary[SerializationKeys.verified] = value }
        if let value = notificationStatus { dictionary[SerializationKeys.notificationStatus] = value }
        if let value = createdAt { dictionary[SerializationKeys.createdAt] = value }
        if let value = returnPolicy { dictionary[SerializationKeys.returnPolicy] = value }
        if let value = totalCart_item { dictionary[SerializationKeys.totalCart_item] = value }
        return dictionary
    }

    // MARK: NSCoding Protocol
    required public init(coder aDecoder: NSCoder) {
        self.apiToken = aDecoder.decodeObject(forKey: SerializationKeys.apiToken) as? String
        self.openTime = aDecoder.decodeObject(forKey: SerializationKeys.openTime) as? String
        self.type = aDecoder.decodeObject(forKey: SerializationKeys.type) as? Int
        self.closeTime = aDecoder.decodeObject(forKey: SerializationKeys.closeTime) as? String
        self.id = aDecoder.decodeObject(forKey: SerializationKeys.id) as? String
        self.image = aDecoder.decodeObject(forKey: SerializationKeys.image) as? String
        self.phone = aDecoder.decodeObject(forKey: SerializationKeys.phone) as? Int
        self.iban = aDecoder.decodeObject(forKey: SerializationKeys.iban) as? String
        self.name = aDecoder.decodeObject(forKey: SerializationKeys.name) as? String
        self.updatedAt = aDecoder.decodeObject(forKey: SerializationKeys.updatedAt) as? String
        self.email = aDecoder.decodeObject(forKey: SerializationKeys.email) as? String
        self.commission = aDecoder.decodeObject(forKey: SerializationKeys.commission) as? Int
        self.pickupAddress = aDecoder.decodeObject(forKey: SerializationKeys.pickupAddress) as? String
        self.priority = aDecoder.decodeObject(forKey: SerializationKeys.priority) as? Int
        self.returnPolicyArabic = aDecoder.decodeObject(forKey: SerializationKeys.returnPolicyArabic) as? String
        self.status = aDecoder.decodeObject(forKey: SerializationKeys.status) as? Int
        self.verified = aDecoder.decodeObject(forKey: SerializationKeys.verified) as? Int
        self.notificationStatus = aDecoder.decodeObject(forKey: SerializationKeys.notificationStatus) as? Int
        self.createdAt = aDecoder.decodeObject(forKey: SerializationKeys.createdAt) as? String
        self.returnPolicy = aDecoder.decodeObject(forKey: SerializationKeys.returnPolicy) as? String
        self.totalCart_item = aDecoder.decodeObject(forKey: SerializationKeys.totalCart_item) as? Int
    }
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(apiToken, forKey: SerializationKeys.apiToken)
        aCoder.encode(openTime, forKey: SerializationKeys.openTime)
        aCoder.encode(type, forKey: SerializationKeys.type)
        aCoder.encode(closeTime, forKey: SerializationKeys.closeTime)
        aCoder.encode(id, forKey: SerializationKeys.id)
        aCoder.encode(image, forKey: SerializationKeys.image)
        aCoder.encode(phone, forKey: SerializationKeys.phone)
        aCoder.encode(iban, forKey: SerializationKeys.iban)
        aCoder.encode(name, forKey: SerializationKeys.name)
        aCoder.encode(updatedAt, forKey: SerializationKeys.updatedAt)
        aCoder.encode(email, forKey: SerializationKeys.email)
        aCoder.encode(commission, forKey: SerializationKeys.commission)
        aCoder.encode(pickupAddress, forKey: SerializationKeys.pickupAddress)
        aCoder.encode(priority, forKey: SerializationKeys.priority)
        aCoder.encode(returnPolicyArabic, forKey: SerializationKeys.returnPolicyArabic)
        aCoder.encode(status, forKey: SerializationKeys.status)
        aCoder.encode(verified, forKey: SerializationKeys.verified)
        aCoder.encode(notificationStatus, forKey: SerializationKeys.notificationStatus)
        aCoder.encode(createdAt, forKey: SerializationKeys.createdAt)
        aCoder.encode(returnPolicy, forKey: SerializationKeys.returnPolicy)
        aCoder.encode(totalCart_item, forKey: SerializationKeys.totalCart_item)
    }
}
