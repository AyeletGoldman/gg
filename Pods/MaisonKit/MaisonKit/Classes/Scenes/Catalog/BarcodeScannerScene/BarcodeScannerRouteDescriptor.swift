//  Copyright © 2022 LVMH. All rights reserved.

/// A route descriptor to display a barcode scanner in a frame.
/// The supported barcodes for scanning are: EAN-8, EAN-13 and UPC-E
public struct BarcodeScannerRouteDescriptor: RouteDescriptor {
    public static let identifier: Identifier = "BarcodeScannerRouteDescriptor"

    /// The closure to invoke when the user taps the "Cancel" button
    /// The parameter in the closure is the view controller that hosts the scanning functionality
    public let onCancel: (UIViewController) -> Void
    /// The closure to invoke when the user has successfully scanned a barcode
    /// The first parameter in the closure is the view controller that hosts the scanning functionality
    /// The second parameter in the closure is the scanned product reference
    public let onDone: (UIViewController, ProductReference) -> Void

    /// Creates a new `BarcodeScannerRouteDescriptor`
    /// - Parameters:
    ///   - onCancel: The closure to invoke when the user taps the "Cancel" button
    /// The parameter in the closure is the view controller that hosts the scanning functionality
    ///   - onDone: The closure to invoke when the user has successfully scanned a barcode
    /// The first parameter in the closure is the view controller that hosts the scanning functionality
    /// The second parameter in the closure is the scanned product reference
    public init(onCancel: @escaping (UIViewController) -> Void,
                onDone: @escaping (UIViewController, ProductReference) -> Void) {
        self.onDone = onDone
        self.onCancel = onCancel
    }
}
