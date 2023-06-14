/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct NotificationRequestItem: Codable, Equatable {

    /// The type of event that triggered the notification. For a list of possible eventCode values, refer to https://docs.adyen.com/development-resources/webhooks/understand-notifications#event-codes.
    enum NotificationRequestItemEventCode: String, Codable, Equatable, CaseIterable {
        case authorisation = "AUTHORISATION"
        case authorisationAdjustment = "AUTHORISATION_ADJUSTMENT"
        case cancellation = "CANCELLATION"
        case cancelOrRefund = "CANCEL_OR_REFUND"
        case capture = "CAPTURE"
        case captureFailed = "CAPTURE_FAILED"
        case handledExternally = "HANDLED_EXTERNALLY"
        case orderOpened = "ORDER_OPENED"
        case orderClosed = "ORDER_CLOSED"
        case refund = "REFUND"
        case refundFailed = "REFUND_FAILED"
        case refundedReversed = "REFUNDED_REVERSED"
        case refundWithData = "REFUND_WITH_DATA"
        case reportAvailable = "REPORT_AVAILABLE"
        case voidPendingRefund = "VOID_PENDING_REFUND"
    }

    /// The outcome of the event, set to either "true" or "false".
    enum NotificationRequestItemSuccess: String, Codable, Equatable, CaseIterable {
        case _true = "true"
        case _false = "false"
    }

    let additionalData: AdditionalData
    let amount: Amount?
    /// The type of event that triggered the notification. For a list of possible eventCode values, refer to https://docs.adyen.com/development-resources/webhooks/understand-notifications#event-codes.
    let eventCode: NotificationRequestItemEventCode
    /// The time of the event. Format: ISO 8601 (http://www.w3.org/TR/NOTE-datetime); YYYY-MM-DDThh:mm:ssTZD
    let eventDate: ISO8601DateTime
    /// The merchant account identifier for which the payment link is created.
    let merchantAccountCode: String?
    /// This reference allows linking multiple transactions to each other for reporting purposes (for example, order auth-rate). The reference should be unique per billing cycle.
    let merchantReference: String?
    /// Payment method the shopper paid with.
    let paymentMethod: String?
    /// Adyen's 16-character unique reference associated with the transaction/the request. This value is globally unique; quote it when communicating with us about this request.
    let pspReference: String?
    /// In case of a failure, contains a short description of the problem
    let reason: String?
    /// The outcome of the event, set to either "true" or "false".
    let success: NotificationRequestItemSuccess

    enum CodingKeys: String, CodingKey {
        case additionalData = "additionalData"
        case amount = "amount"
        case eventCode = "eventCode"
        case eventDate = "eventDate"
        case merchantAccountCode = "merchantAccountCode"
        case merchantReference = "merchantReference"
        case paymentMethod = "paymentMethod"
        case pspReference = "pspReference"
        case reason = "reason"
        case success = "success"
    }

    init(additionalData: AdditionalData, amount: Amount? = nil, eventCode: NotificationRequestItemEventCode, eventDate: ISO8601DateTime, merchantAccountCode: String? = nil, merchantReference: String? = nil, paymentMethod: String? = nil, pspReference: String? = nil, reason: String? = nil, success: NotificationRequestItemSuccess) {
        self.additionalData = additionalData
        self.amount = amount
        self.eventCode = eventCode
        self.eventDate = eventDate
        self.merchantAccountCode = merchantAccountCode
        self.merchantReference = merchantReference
        self.paymentMethod = paymentMethod
        self.pspReference = pspReference
        self.reason = reason
        self.success = success
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.additionalData = try container.mkDecode(AdditionalData.self, forKey: .additionalData)
        self.amount = try container.mkDecodeIfPresent(Amount.self, forKey: .amount)
        self.eventCode = try container.mkDecode(NotificationRequestItemEventCode.self, forKey: .eventCode)
        self.eventDate = try container.mkDecode(ISO8601DateTime.self, forKey: .eventDate)
        self.merchantAccountCode = try container.mkDecodeIfPresent(String.self, forKey: .merchantAccountCode)
        self.merchantReference = try container.mkDecodeIfPresent(String.self, forKey: .merchantReference)
        self.paymentMethod = try container.mkDecodeIfPresent(String.self, forKey: .paymentMethod)
        self.pspReference = try container.mkDecodeIfPresent(String.self, forKey: .pspReference)
        self.reason = try container.mkDecodeIfPresent(String.self, forKey: .reason)
        self.success = try container.mkDecode(NotificationRequestItemSuccess.self, forKey: .success)
    }
}
