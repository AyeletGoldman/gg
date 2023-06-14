/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct InteractionPayByLinkMetadata: Codable, Equatable {

    enum InteractionPayByLinkMetadataContext: String, Codable, Equatable, CaseIterable {
        case paymentLink = "paymentLink"
    }

    let context: InteractionPayByLinkMetadataContext
    let orderStatus: TransactionStatus
    let paymentStatus: PaymentStatus
    let pblContext: InteractionMetadataPblContext
    let price: Price
    let products: [InteractionMetadataProduct]

    enum CodingKeys: String, CodingKey {
        case context = "context"
        case orderStatus = "orderStatus"
        case paymentStatus = "paymentStatus"
        case pblContext = "pblContext"
        case price = "price"
        case products = "products"
    }

    init(context: InteractionPayByLinkMetadataContext, orderStatus: TransactionStatus, paymentStatus: PaymentStatus, pblContext: InteractionMetadataPblContext, price: Price, products: [InteractionMetadataProduct]) {
        self.context = context
        self.orderStatus = orderStatus
        self.paymentStatus = paymentStatus
        self.pblContext = pblContext
        self.price = price
        self.products = products
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.context = try container.mkDecode(InteractionPayByLinkMetadataContext.self, forKey: .context)
        self.orderStatus = try container.mkDecode(TransactionStatus.self, forKey: .orderStatus)
        self.paymentStatus = try container.mkDecode(PaymentStatus.self, forKey: .paymentStatus)
        self.pblContext = try container.mkDecode(InteractionMetadataPblContext.self, forKey: .pblContext)
        self.price = try container.mkDecode(Price.self, forKey: .price)
        self.products = try container.mkDecode([InteractionMetadataProduct].self, forKey: .products)
    }
}
