/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

/// Transaction current status.
enum TransactionStatus: String, Codable, Equatable, CaseIterable {
    case draft = "draft"
    case activated = "activated"
    case cancelled = "cancelled"
    case paid = "paid"
    case deliveryInProgress = "deliveryInProgress"
    case deliveredToStore = "deliveredToStore"
    case deliveredToClient = "deliveredToClient"
}
