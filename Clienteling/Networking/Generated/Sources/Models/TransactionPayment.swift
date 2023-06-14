/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct TransactionPayment: Codable, Equatable {

    let amount: Price?
    /// Date when the payment was done
    let datetime: ISO8601DateTime?
    /// Date from when the payment link will expire (if applicable)
    let expirationDate: ISO8601DateTime?
    /// Payment id within OMS
    let id: String
    /// Invoice reference Number
    let invoiceReference: String?
    /// Payment Name
    let name: String?
    /// Payment link (if applicable)
    let paymentLink: URL?
    /// Payment provider
    let paymentProvider: String?
    /// Payment id within payment provider (if applicable)
    let paymentProviderId: String?
    /// Refund Method
    let refundMethod: String?
    let status: PaymentStatus?

    enum CodingKeys: String, CodingKey {
        case amount = "amount"
        case datetime = "datetime"
        case expirationDate = "expirationDate"
        case id = "id"
        case invoiceReference = "invoiceReference"
        case name = "name"
        case paymentLink = "paymentLink"
        case paymentProvider = "paymentProvider"
        case paymentProviderId = "paymentProviderId"
        case refundMethod = "refundMethod"
        case status = "status"
    }

    init(amount: Price? = nil, datetime: ISO8601DateTime? = nil, expirationDate: ISO8601DateTime? = nil, id: String, invoiceReference: String? = nil, name: String? = nil, paymentLink: URL? = nil, paymentProvider: String? = nil, paymentProviderId: String? = nil, refundMethod: String? = nil, status: PaymentStatus? = nil) {
        self.amount = amount
        self.datetime = datetime
        self.expirationDate = expirationDate
        self.id = id
        self.invoiceReference = invoiceReference
        self.name = name
        self.paymentLink = paymentLink
        self.paymentProvider = paymentProvider
        self.paymentProviderId = paymentProviderId
        self.refundMethod = refundMethod
        self.status = status
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.amount = try container.mkDecodeIfPresent(Price.self, forKey: .amount)
        self.datetime = try container.mkDecodeIfPresent(ISO8601DateTime.self, forKey: .datetime)
        self.expirationDate = try container.mkDecodeIfPresent(ISO8601DateTime.self, forKey: .expirationDate)
        self.id = try container.mkDecode(String.self, forKey: .id)
        self.invoiceReference = try container.mkDecodeIfPresent(String.self, forKey: .invoiceReference)
        self.name = try container.mkDecodeIfPresent(String.self, forKey: .name)
        self.paymentLink = try container.mkDecodeIfPresent(URL.self, forKey: .paymentLink)
        self.paymentProvider = try container.mkDecodeIfPresent(String.self, forKey: .paymentProvider)
        self.paymentProviderId = try container.mkDecodeIfPresent(String.self, forKey: .paymentProviderId)
        self.refundMethod = try container.mkDecodeIfPresent(String.self, forKey: .refundMethod)
        self.status = try container.mkDecodeIfPresent(PaymentStatus.self, forKey: .status)
    }
}
