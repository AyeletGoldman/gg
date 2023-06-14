// Copyright © 2021 LVMH. All rights reserved.

import Foundation
import Combine

/// A route descriptor for the product stock details `Scene`
public struct ProductStockRouteDescriptor: RouteDescriptor {
    public static let identifier: Identifier = "ProductStockRouteDescriptor"

    /// The source for the information in the stock view
    public let datasource: ProductStockDatasource
    /// The context for the product stock. This informs the view model what typeof product it expects to receive when it makes a request for details.
    public let context: ProductDetailsInitialisationContext
    /// A closure to invoke when the user has finished viewing details stock information
    public let onDismiss: (UIViewController) -> Void

    /// Creates a new `ProductStockRouteDescriptor`
    /// - Parameters:
    ///   - context: The context for the product stock. This informs the view model what typeof product it expects to receive when it makes a request for details.
    ///   - datasource: The source for the information in the stock view
    ///   - onDismiss: A closure to invoke when the user has finished viewing details stock information
    public init(context: ProductDetailsInitialisationContext,
                datasource: ProductStockDatasource,
                onDismiss: @escaping (UIViewController) -> Void) {
        self.context = context
        self.onDismiss = onDismiss
        self.datasource = datasource
    }
}
