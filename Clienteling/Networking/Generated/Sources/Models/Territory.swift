/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct Territory: Codable, Equatable {

    /// City of the territory
    let city: String
    /// Country of the territory
    let country: String
    /// Id of the territory
    let id: String
    /// Latitude coordinates of the territory
    let latitude: Float
    /// Longitude coordinates of the territory
    let longitude: Float
    /// Name of the territory
    let name: String
    /// Postal code of the territory
    let postalCode: String
    /// State code of the territory
    let state: String?
    /// Street address of the territory
    let street: String

    enum CodingKeys: String, CodingKey {
        case city = "city"
        case country = "country"
        case id = "id"
        case latitude = "latitude"
        case longitude = "longitude"
        case name = "name"
        case postalCode = "postalCode"
        case state = "state"
        case street = "street"
    }

    init(city: String, country: String, id: String, latitude: Float, longitude: Float, name: String, postalCode: String, state: String? = nil, street: String) {
        self.city = city
        self.country = country
        self.id = id
        self.latitude = latitude
        self.longitude = longitude
        self.name = name
        self.postalCode = postalCode
        self.state = state
        self.street = street
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.city = try container.mkDecode(String.self, forKey: .city)
        self.country = try container.mkDecode(String.self, forKey: .country)
        self.id = try container.mkDecode(String.self, forKey: .id)
        self.latitude = try container.mkDecode(Float.self, forKey: .latitude)
        self.longitude = try container.mkDecode(Float.self, forKey: .longitude)
        self.name = try container.mkDecode(String.self, forKey: .name)
        self.postalCode = try container.mkDecode(String.self, forKey: .postalCode)
        self.state = try container.mkDecodeIfPresent(String.self, forKey: .state)
        self.street = try container.mkDecode(String.self, forKey: .street)
    }
}
