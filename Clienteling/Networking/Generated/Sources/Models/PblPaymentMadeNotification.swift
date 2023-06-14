/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct PblPaymentMadeNotification: Codable, Equatable {

    enum PblPaymentMadeNotificationType: String, Codable, Equatable, CaseIterable {
        case pblPaymentMade = "pblPaymentMade"
    }

    struct PblPaymentMadeNotificationPayload: Codable, Equatable {

        /// The amount of the transaction
        let amount: Double
        /// A currency code in ISO-4217. 3 letters, uppercase.
        let currency: String
        let divisor: Int
        /// Time and date of the order's payment
        let paymentDate: ISO8601DateTime
        /// ID of the transaction
        let transactionId: String

        enum CodingKeys: String, CodingKey {
            case amount = "amount"
            case currency = "currency"
            case divisor = "divisor"
            case paymentDate = "paymentDate"
            case transactionId = "transactionId"
        }

        init(amount: Double, currency: String, divisor: Int, paymentDate: ISO8601DateTime, transactionId: String) {
            self.amount = amount
            self.currency = currency
            self.divisor = divisor
            self.paymentDate = paymentDate
            self.transactionId = transactionId
        }

        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.amount = try container.mkDecode(Double.self, forKey: .amount)
            self.currency = try container.mkDecode(String.self, forKey: .currency)
            self.divisor = try container.mkDecode(Int.self, forKey: .divisor)
            self.paymentDate = try container.mkDecode(ISO8601DateTime.self, forKey: .paymentDate)
            self.transactionId = try container.mkDecode(String.self, forKey: .transactionId)
        }
    }

    let payload: PblPaymentMadeNotificationPayload
    let type: PblPaymentMadeNotificationType

    enum CodingKeys: String, CodingKey {
        case payload = "payload"
        case type = "type"
    }

    init(payload: PblPaymentMadeNotificationPayload, type: PblPaymentMadeNotificationType) {
        self.payload = payload
        self.type = type
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.payload = try container.mkDecode(PblPaymentMadeNotificationPayload.self, forKey: .payload)
        self.type = try container.mkDecode(PblPaymentMadeNotificationType.self, forKey: .type)
    }
}
