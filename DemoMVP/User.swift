//
//  User.swift
//  DemoMVP
//
//  Created by Vasyl Polyuhovich on 6/30/17.
//  Copyright © 2017 Vasyl Polyuhovich. All rights reserved.
//

import Foundation
import SwiftyJSON

public struct User {
    
    // MARK: Declaration for string constants to be used to decode and also serialize.
    private struct SerializationKeys {
        static let age = "age"
        static let lastName = "last_name"
        static let email = "email"
        static let firstName = "first_name"
    }
    
    // MARK: Properties
    public var age: Int?
    public var lastName: String?
    public var email: String?
    public var firstName: String?
    
    // MARK: SwiftyJSON Initializers
    /// Initiates the instance based on the object.
    ///
    /// - parameter object: The object of either Dictionary or Array kind that was passed.
    /// - returns: An initialized instance of the class.
    public init(object: Any) {
        self.init(json: JSON(object))
    }
    
    /// Initiates the instance based on the JSON that was passed.
    ///
    /// - parameter json: JSON object from SwiftyJSON.
    public init(json: JSON) {
        age = json[SerializationKeys.age].int
        lastName = json[SerializationKeys.lastName].string
        email = json[SerializationKeys.email].string
        firstName = json[SerializationKeys.firstName].string
    }
    
    /// Generates description of the object in the form of a NSDictionary.
    ///
    /// - returns: A Key value pair containing all valid values in the object.
    public func dictionaryRepresentation() -> [String: Any] {
        var dictionary: [String: Any] = [:]
        if let value = age { dictionary[SerializationKeys.age] = value }
        if let value = lastName { dictionary[SerializationKeys.lastName] = value }
        if let value = email { dictionary[SerializationKeys.email] = value }
        if let value = firstName { dictionary[SerializationKeys.firstName] = value }
        return dictionary
    }
    
}
