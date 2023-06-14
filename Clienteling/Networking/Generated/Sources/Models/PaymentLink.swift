/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct PaymentLink: Codable, Equatable {

    /// The amount of the transaction, in [minor units]
    let amount: Int
    let currency: Currency
    /// Expiration date of the payment
    let expiresAt: ISO8601DateTime
    /// Payment link Id
    let id: String
    /// ID of the order this payment is linked to.
    let orderId: String?
    let status: PaymentStatus
    /// The URL at which the shopper can complete the payment.
    let url: URL

    enum CodingKeys: String, CodingKey {
        case amount = "amount"
        case currency = "currency"
        case expiresAt = "expiresAt"
        case id = "id"
        case orderId = "orderId"
        case status = "status"
        case url = "url"
    }

    init(amount: Int, currency: Currency, expiresAt: ISO8601DateTime, id: String, orderId: String? = nil, status: PaymentStatus, url: URL) {
        self.amount = amount
        self.currency = currency
        self.expiresAt = expiresAt
        self.id = id
        self.orderId = orderId
        self.status = status
        self.url = url
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.amount = try container.mkDecode(Int.self, forKey: .amount)
        self.currency = try container.mkDecode(Currency.self, forKey: .currency)
        self.expiresAt = try container.mkDecode(ISO8601DateTime.self, forKey: .expiresAt)
        self.id = try container.mkDecode(String.self, forKey: .id)
        self.orderId = try container.mkDecodeIfPresent(String.self, forKey: .orderId)
        self.status = try container.mkDecode(PaymentStatus.self, forKey: .status)
        self.url = try container.mkDecode(URL.self, forKey: .url)
    }
}
