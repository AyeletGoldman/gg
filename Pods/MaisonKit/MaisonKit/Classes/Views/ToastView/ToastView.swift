// Copyright © 2020 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

/// A view used to display a toast message with a title and an optional image.
public struct ToastView: View {

    @Environment(\.toastStyle) private var style

    let text: String
    let imageSource: ImageSource?

    /// Creates a new `ToastView` instance
    /// - Parameters:
    ///   - text: the text to display on the toast
    ///   - imageSource: an optional image to show on the toast view.
    ///   Note that whether or not this image is displayed is also controlled by the `style` of this `ToastView`.
    public init(text: String, imageSource: ImageSource? = nil) {
        self.text = text
        self.imageSource = imageSource
    }

    public var body: some View {
        self.style
            .makeBody(
                configuration: ToastViewStyleConfiguration(
                    title: ToastViewStyleConfiguration.Title(text: self.text),
                    image: self.imageSource.map { ToastViewStyleConfiguration.Image(source: $0) }
                )
            )
    }
}
