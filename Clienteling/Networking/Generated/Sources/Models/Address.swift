/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct Address: Codable, Equatable {

    /// City
    let city: String?
    /// Country
    let country: String?
    /// Zip/Postal Code
    let postalCode: String?
    /// State/Province
    let state: String?
    /// Street
    let street: String?

    enum CodingKeys: String, CodingKey {
        case city = "city"
        case country = "country"
        case postalCode = "postalCode"
        case state = "state"
        case street = "street"
    }

    init(city: String? = nil, country: String? = nil, postalCode: String? = nil, state: String? = nil, street: String? = nil) {
        self.city = city
        self.country = country
        self.postalCode = postalCode
        self.state = state
        self.street = street
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.city = try container.mkDecodeIfPresent(String.self, forKey: .city)
        self.country = try container.mkDecodeIfPresent(String.self, forKey: .country)
        self.postalCode = try container.mkDecodeIfPresent(String.self, forKey: .postalCode)
        self.state = try container.mkDecodeIfPresent(String.self, forKey: .state)
        self.street = try container.mkDecodeIfPresent(String.self, forKey: .street)
    }
}
