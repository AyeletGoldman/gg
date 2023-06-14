/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct TransactionV2: Codable, Equatable {

    /// Array of transaction additional data.
    let additionalData: [TransactionAdditionalData]
    let advisorName: String
    let billingAddress: Address?
    let client: Client
    let datetime: ISO8601DateTimeString
    /// Transaction Id.
    let id: String
    /// ID of the payment if it exists (deprecated, use payments[].id)
    let paymentId: String?
    let payments: [TransactionPayment]
    /// Array of transaction items.
    let products: [TransactionItemV2]
    let shippingAddress: Address?
    let status: TransactionStatus?
    let store: Store?
    /// Subtotal amount.
    let subtotal: Price
    /// Total amount of taxes.
    let tax: Price
    let totalPrice: Price

    enum CodingKeys: String, CodingKey {
        case additionalData = "additionalData"
        case advisorName = "advisorName"
        case billingAddress = "billingAddress"
        case client = "client"
        case datetime = "datetime"
        case id = "id"
        case paymentId = "paymentId"
        case payments = "payments"
        case products = "products"
        case shippingAddress = "shippingAddress"
        case status = "status"
        case store = "store"
        case subtotal = "subtotal"
        case tax = "tax"
        case totalPrice = "totalPrice"
    }

    init(additionalData: [TransactionAdditionalData], advisorName: String, billingAddress: Address? = nil, client: Client, datetime: ISO8601DateTimeString, id: String, paymentId: String? = nil, payments: [TransactionPayment], products: [TransactionItemV2], shippingAddress: Address? = nil, status: TransactionStatus? = nil, store: Store? = nil, subtotal: Price, tax: Price, totalPrice: Price) {
        self.additionalData = additionalData
        self.advisorName = advisorName
        self.billingAddress = billingAddress
        self.client = client
        self.datetime = datetime
        self.id = id
        self.paymentId = paymentId
        self.payments = payments
        self.products = products
        self.shippingAddress = shippingAddress
        self.status = status
        self.store = store
        self.subtotal = subtotal
        self.tax = tax
        self.totalPrice = totalPrice
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.additionalData = try container.mkDecode([TransactionAdditionalData].self, forKey: .additionalData)
        self.advisorName = try container.mkDecode(String.self, forKey: .advisorName)
        self.billingAddress = try container.mkDecodeIfPresent(Address.self, forKey: .billingAddress)
        self.client = try container.mkDecode(Client.self, forKey: .client)
        self.datetime = try container.mkDecode(ISO8601DateTimeString.self, forKey: .datetime)
        self.id = try container.mkDecode(String.self, forKey: .id)
        self.paymentId = try container.mkDecodeIfPresent(String.self, forKey: .paymentId)
        self.payments = try container.mkDecode([TransactionPayment].self, forKey: .payments)
        self.products = try container.mkDecode([TransactionItemV2].self, forKey: .products)
        self.shippingAddress = try container.mkDecodeIfPresent(Address.self, forKey: .shippingAddress)
        self.status = try container.mkDecodeIfPresent(TransactionStatus.self, forKey: .status)
        self.store = try container.mkDecodeIfPresent(Store.self, forKey: .store)
        self.subtotal = try container.mkDecode(Price.self, forKey: .subtotal)
        self.tax = try container.mkDecode(Price.self, forKey: .tax)
        self.totalPrice = try container.mkDecode(Price.self, forKey: .totalPrice)
    }
}
