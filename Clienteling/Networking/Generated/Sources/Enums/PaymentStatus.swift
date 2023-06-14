/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

/// Status of a payment.
enum PaymentStatus: String, Codable, Equatable, CaseIterable {
    case active = "active"
    case completed = "completed"
    case expired = "expired"
    case paymentPending = "paymentPending"
    case cancelled = "cancelled"
    case refunded = "refunded"
}
