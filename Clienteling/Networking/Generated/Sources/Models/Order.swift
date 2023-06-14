/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct Order: Codable, Equatable {

    /// Order current status.
    enum OrderStatus: String, Codable, Equatable, CaseIterable {
        case draft = "draft"
        case activated = "activated"
        case cancelled = "cancelled"
        case paid = "paid"
        case deliveryInProgress = "deliveryInProgress"
        case deliveredToStore = "deliveredToStore"
        case deliveredToClient = "deliveredToClient"
    }

    let client: Client
    let currency: Currency
    let delivery: Delivery
    /// Order Id.
    let id: String
    /// Array of order items.
    let items: [OrderItem]
    /// ID of the payment if it exists
    let paymentId: String?
    /// Order current status.
    let status: OrderStatus
    /// Subtotal amount.
    let subtotal: Double
    /// Total amount of taxes.
    let tax: Double
    /// Total amount including taxes.
    let total: Double

    enum CodingKeys: String, CodingKey {
        case client = "client"
        case currency = "currency"
        case delivery = "delivery"
        case id = "id"
        case items = "items"
        case paymentId = "paymentId"
        case status = "status"
        case subtotal = "subtotal"
        case tax = "tax"
        case total = "total"
    }

    init(client: Client, currency: Currency, delivery: Delivery, id: String, items: [OrderItem], paymentId: String? = nil, status: OrderStatus, subtotal: Double, tax: Double, total: Double) {
        self.client = client
        self.currency = currency
        self.delivery = delivery
        self.id = id
        self.items = items
        self.paymentId = paymentId
        self.status = status
        self.subtotal = subtotal
        self.tax = tax
        self.total = total
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.client = try container.mkDecode(Client.self, forKey: .client)
        self.currency = try container.mkDecode(Currency.self, forKey: .currency)
        self.delivery = try container.mkDecode(Delivery.self, forKey: .delivery)
        self.id = try container.mkDecode(String.self, forKey: .id)
        self.items = try container.mkDecode([OrderItem].self, forKey: .items)
        self.paymentId = try container.mkDecodeIfPresent(String.self, forKey: .paymentId)
        self.status = try container.mkDecode(OrderStatus.self, forKey: .status)
        self.subtotal = try container.mkDecode(Double.self, forKey: .subtotal)
        self.tax = try container.mkDecode(Double.self, forKey: .tax)
        self.total = try container.mkDecode(Double.self, forKey: .total)
    }
}
