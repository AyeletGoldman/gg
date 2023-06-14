// Copyright © 2022 LVMH. All rights reserved.

import SwiftUI

/// The representation of a view that will be displayed in a product list cell
/// and shows the available colors a product is in. Usually, you will not need to
/// use the initializers in this class directly unless you need to create a display with a custom view.
/// Instead, consider using `.color(hex:)` and `.image(source:)`.
public struct ColorItem {

    private let backingView: any View

    /// Creates a new `ColorItem` with the given `View`
    /// - Parameter view: the view to wrap in this display
    public init(view: some View) {
        self.backingView = view
    }

    /// Creates a new `ColorItem` with the given closure
    /// - Parameter closure: the closure to execute to get the view
    public init(closure: () -> some View) {
        self.backingView = closure()
    }

    /// Creates the body (view) that will be displayed in the product list cell. This will, in most cases, be restricted in size (around 16x16),
    /// so a small image or a color is the most appropriate representation.
    /// - Returns: a view to be used for display
    func makeBody() -> some View {
        self.backingView.eraseToAnyView()
    }
}

public extension ColorItem {
    /// Creates a new `ColorItem` with a given hex value. The underlying view is a `Color`.
    /// - Parameter hex: the hex code (with a leading `#`) to use to create a `Color`
    /// - Returns: a `ColorItem` instance that wraps a `Color` created from the given hex code
    static func color(hex: String) -> ColorItem {
        return ColorItem(view: Color(hex: hex))
    }

    /// Creates a new `ColorItem` with a given image source. The underlying view is a `MaisonKitImage`.
    /// - Parameter source: the source of the image.
    /// - Returns: a `ColorItem` instance that wraps a `MaisonKitImage` created from the given image source.
    static func image(source: ImageSource) -> ColorItem {
        return ColorItem(view: MaisonKitImage(source: source))
    }
}
