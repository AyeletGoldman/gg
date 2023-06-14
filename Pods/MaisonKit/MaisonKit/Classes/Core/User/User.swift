// Copyright © 2020 LVMH. All rights reserved.

/// The main object to hold details of a Customer Advisor
public struct User: Codable {
    /// The advisor's ID
    public let id: String
    /// The logged-in advisor's email
    public let email: String
    /// The advisor's name
    public let name: String?
    /// The advisor's role
    public let role: Role?
    /// The store this advisor belongs to
    public let store: Store?
    /// The contact information if this user needs help with the app
    public let contact: UserContact?
    /// A set of fields we want to display for this user
    public let displayFields: [TypedField]?

    /// Creates a new `User` object
    /// - Parameters:
    ///   - id: The advisor's ID
    ///   - email: The logged-in advisor's email
    ///   - name: The advisor's name
    ///   - role: The advisor's role
    ///   - store: The store this advisor belongs to
    ///   - contact: The contact information if this user needs help with the app
    ///   - displayFields: A set of fields we want to display for this user
    public init(id: String, email: String, name: String, role: Role?, store: Store?, contact: UserContact?, displayFields: [TypedField]?) {
        self.id = id
        self.email = email
        self.name = name
        self.role = role
        self.store = store
        self.contact = contact
        self.displayFields = displayFields
    }
}

/// The role of a customer advisor
public struct Role: Codable {
    /// The role's ID, a unique value to identify the role.
    public let id: String
    /// The role's display name.
    public let name: String

    /// Creates a new Role
    /// - Parameters:
    ///   - id: The role's ID, a unique value to identify the role.
    ///   - name: The role's display name.
    public init(id: String, name: String) {
        self.id = id
        self.name = name
    }
}

/// Contains some information text and an email to contact the administrators
/// of the app. Usually this would be the CRM team.
public struct UserContact: Codable {
    /// The information text to display.
    public let information: String
    /// The email to display in the app to allow the user of the app to request help or contact
    /// their CRM team.
    public let email: String

    /// Creates a new UserContact object
    /// - Parameters:
    ///   - information: The information text to display.
    ///   - email: The email to display in the app to allow the user of the app to request help or contact
    ///     their CRM team.
    public init(information: String, email: String) {
        self.email = email
        self.information = information
    }
}

/// Information about the store the user is associated with
public struct Store: Codable {
    /// A unique identifier for the store
    public let id: String
    /// The name of the store
    public let name: String
    /// The store's code
    public let code: String

    /// Creates a new `Store` object
    /// - Parameters:
    ///   - id: A unique identifier for the store
    ///   - code: The name of the store
    ///   - name: The store's code
    public init(id: String, code: String, name: String) {
        self.id = id
        self.code = code
        self.name = name
    }
}
