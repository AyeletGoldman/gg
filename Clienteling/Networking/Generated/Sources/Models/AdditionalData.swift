/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

/// Additional information about the shopper or the transaction. For more information about the fields that you can receive in additionalData, refer to https://docs.adyen.com/development-resources/webhooks/additional-settings

struct AdditionalData: Codable, Equatable {

    let name1: String?
    let name2: String?
    let authCode: String?
    let cardSummary: String?
    let expiryDate: String?
    let fraudCheck6ShopperIpUsage: String?
    let hmacSignature: String?
    let paymentLinkId: String?
    let threeds2CardEnrolled: String?
    let totalFraudScore: String?

    enum CodingKeys: String, CodingKey {
        case name1 = "NAME1"
        case name2 = "NAME2"
        case authCode = "authCode"
        case cardSummary = "cardSummary"
        case expiryDate = "expiryDate"
        case fraudCheck6ShopperIpUsage = "fraudCheck-6-ShopperIpUsage"
        case hmacSignature = "hmacSignature"
        case paymentLinkId = "paymentLinkId"
        case threeds2CardEnrolled = "threeds2.cardEnrolled"
        case totalFraudScore = "totalFraudScore"
    }

    init(name1: String? = nil, name2: String? = nil, authCode: String? = nil, cardSummary: String? = nil, expiryDate: String? = nil, fraudCheck6ShopperIpUsage: String? = nil, hmacSignature: String? = nil, paymentLinkId: String? = nil, threeds2CardEnrolled: String? = nil, totalFraudScore: String? = nil) {
        self.name1 = name1
        self.name2 = name2
        self.authCode = authCode
        self.cardSummary = cardSummary
        self.expiryDate = expiryDate
        self.fraudCheck6ShopperIpUsage = fraudCheck6ShopperIpUsage
        self.hmacSignature = hmacSignature
        self.paymentLinkId = paymentLinkId
        self.threeds2CardEnrolled = threeds2CardEnrolled
        self.totalFraudScore = totalFraudScore
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name1 = try container.mkDecodeIfPresent(String.self, forKey: .name1)
        self.name2 = try container.mkDecodeIfPresent(String.self, forKey: .name2)
        self.authCode = try container.mkDecodeIfPresent(String.self, forKey: .authCode)
        self.cardSummary = try container.mkDecodeIfPresent(String.self, forKey: .cardSummary)
        self.expiryDate = try container.mkDecodeIfPresent(String.self, forKey: .expiryDate)
        self.fraudCheck6ShopperIpUsage = try container.mkDecodeIfPresent(String.self, forKey: .fraudCheck6ShopperIpUsage)
        self.hmacSignature = try container.mkDecodeIfPresent(String.self, forKey: .hmacSignature)
        self.paymentLinkId = try container.mkDecodeIfPresent(String.self, forKey: .paymentLinkId)
        self.threeds2CardEnrolled = try container.mkDecodeIfPresent(String.self, forKey: .threeds2CardEnrolled)
        self.totalFraudScore = try container.mkDecodeIfPresent(String.self, forKey: .totalFraudScore)
    }
}
