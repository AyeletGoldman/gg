/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct ClientLists: Codable, Equatable {

    let campaign: [CampaignList]?
    let featured: [FeaturedList]?
    let personal: [PersonalList]?

    enum CodingKeys: String, CodingKey {
        case campaign = "campaign"
        case featured = "featured"
        case personal = "personal"
    }

    init(campaign: [CampaignList]? = nil, featured: [FeaturedList]? = nil, personal: [PersonalList]? = nil) {
        self.campaign = campaign
        self.featured = featured
        self.personal = personal
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.campaign = try container.mkDecodeIfPresent([CampaignList].self, forKey: .campaign)
        self.featured = try container.mkDecodeIfPresent([FeaturedList].self, forKey: .featured)
        self.personal = try container.mkDecodeIfPresent([PersonalList].self, forKey: .personal)
    }
}
