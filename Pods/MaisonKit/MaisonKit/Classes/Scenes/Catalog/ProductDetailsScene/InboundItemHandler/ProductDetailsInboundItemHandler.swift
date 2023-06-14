// Copyright © 2021 LVMH. All rights reserved.

import Foundation
import CoreSpotlight

/// A handler for product details inbound items.
public struct CoreSpotlightProductDetailsItemHandler: InboundItemRegistration {

    /// Creates a new `CoreSpotlightProductDetailsItemHandler`
    public init() { }

    /// Attempts to handle an inbound item from core spotlight to present a product details scene
    /// - Parameters:
    ///   - identifier: the identifier. Must be `.coreSpotlightSearch`
    ///   - data: a dictionary containing data to be gathered to aid presentation of the scene
    ///   - onDone: A closure to invoke when the scene that has been returned has finished doing any work it required.
    /// - Returns: a wrapped `ProductDetailsScene` if we were able to parse the identifier and data, `nil` otherwise.
    public func handleInboundItem(identifier: InboundItemIdentifier, data: [String: Any], onDone: @escaping (UIViewController) -> Void) -> RouteDescriptor? {
        guard identifier == .coreSpotlightSearch else { return nil }

        // Get the product ID
        guard let productId = data[CSSearchableItemActivityIdentifier] as? String else { return nil }

        guard let context = SearchableProductIdentifier(string: productId)?.context else { return nil }

        return ProductDetailsRouteDescriptor(context: context, onClose: onDone)
    }
}
