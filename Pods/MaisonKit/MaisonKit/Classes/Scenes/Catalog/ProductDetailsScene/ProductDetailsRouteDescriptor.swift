// Copyright © 2021 LVMH. All rights reserved.

import Foundation

/// The two ways to initialise a product details `Scene`. Products will either be a "master" or a "purchaseable product".
public enum ProductDetailsInitialisationContext {
    /// The context for a "master" product. e.g. a product that has different properties that can be selected.
    case master(masterId: String)
    /// The context for a "detailed" product. e.g. a product whose properties are all selected (size, color, material... etc)
    case product(productId: String, masterId: String?)
}

/// The route descriptor for the product details `Scene`
public struct ProductDetailsRouteDescriptor: RouteDescriptor {
    public static let identifier: Identifier = "ProductDetailsRouteDescriptor"

    /// The context for the product details. This informs the view model what typeof product it expects to receive when it makes a request for details.
    public let context: ProductDetailsInitialisationContext
    /// A closure to call when this descriptor has been presented modally and the user taps the "close" button.
    public let onClose: ((UIViewController) -> Void)?

    /// Creates a new `ProductDetailsRouteDescriptor`
    /// - Parameter context: The context for the product details. This informs the view model what typeof product it expects to receive when it makes a request for details.
    /// - Parameter onClose: A closure to call when this descriptor has been presented modally and the user taps the "close" button.
    public init(context: ProductDetailsInitialisationContext, onClose: ((UIViewController) -> Void)? = nil) {
        self.context = context
        self.onClose = onClose
    }
}
