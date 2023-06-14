/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct User: Codable, Equatable {

    /// A currency code in ISO-4217. 3 letters, uppercase.
    let currencyCode: String
    /// The customer advisor's email
    let email: String
    /// The customer first name
    let firstName: String?
    let id: String
    /// The customer last name
    let lastName: String
    let role: UserRole?

    enum CodingKeys: String, CodingKey {
        case currencyCode = "currencyCode"
        case email = "email"
        case firstName = "firstName"
        case id = "id"
        case lastName = "lastName"
        case role = "role"
    }

    init(currencyCode: String, email: String, firstName: String? = nil, id: String, lastName: String, role: UserRole? = nil) {
        self.currencyCode = currencyCode
        self.email = email
        self.firstName = firstName
        self.id = id
        self.lastName = lastName
        self.role = role
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.currencyCode = try container.mkDecode(String.self, forKey: .currencyCode)
        self.email = try container.mkDecode(String.self, forKey: .email)
        self.firstName = try container.mkDecodeIfPresent(String.self, forKey: .firstName)
        self.id = try container.mkDecode(String.self, forKey: .id)
        self.lastName = try container.mkDecode(String.self, forKey: .lastName)
        self.role = try container.mkDecodeIfPresent(UserRole.self, forKey: .role)
    }
}
