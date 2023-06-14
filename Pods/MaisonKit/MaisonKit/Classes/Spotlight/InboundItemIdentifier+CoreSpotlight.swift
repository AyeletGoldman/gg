// Copyright © 2021 LVMH. All rights reserved.

import Foundation
import CoreSpotlight

public extension InboundItemIdentifier {
    /// An identifier to identify inbound items coming from CoreSpotlight.
    static let coreSpotlightSearch = InboundItemIdentifier(value: CSSearchableItemActionType)
}
