// Copyright © 2021 LVMH. All rights reserved.

import Foundation

public extension Localization {
    /// Common localized strings to use
    struct Strings {
        /// A convenience to show a placeholder for a price that isn't set.
        public static let priceOnDemand = MKLocalizedString("product.price.on-demand",
                                                            comment: "The price is not available it is 'Price On Demand'")
        /// A convenience to show a "Not available" text. Usually a short string like "N/A".
        public static let notAvailable = MKLocalizedString("general.not-available",
                                                           comment: "Generic text to show when information is not available")
    }
}
