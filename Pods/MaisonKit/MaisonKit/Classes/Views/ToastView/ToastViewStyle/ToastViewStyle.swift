// Copyright © 2021 LVMH. All rights reserved.

import SwiftUI

/// A configuration object that holds the data for a `ToastView`.
/// This configuration object is used when styling a `ToastView` via `ToastViewStyle` to create the different views required.
public struct ToastViewStyleConfiguration {

    /// The title shown in a toast view
    public struct Title: View {
        private let text: String

        init(text: String) {
            self.text = text
        }

        public var body: some View {
            return Text(self.text)
        }
    }

    /// The image shown in a toast view
    public struct Image: View {
        private let source: ImageSource

        init(source: ImageSource) {
            self.source = source
        }

        public var body: some View {
            return MaisonKitImage(source: self.source)
        }
    }

    /// A description of the toast view item.
    public private(set) var title: ToastViewStyleConfiguration.Title

    /// A symbolic representation of the toast view item.
    public private(set) var image: ToastViewStyleConfiguration.Image?
}

/// A style that can be applied to a `ToastView`.
public protocol ToastViewStyle {
    /// The configuration that has the views that are available for placing and styling within a `ToastView`.
    typealias Configuration = ToastViewStyleConfiguration
    /// The view that will be returned after configuring and placing all `ToastView` components.
    associatedtype Body: View

    /// Creates the body of the `ToastView` for each of the particular implementations of `ToastViewStyle`.
    /// Use the `configuration` parameter passed in to get access to the (optional) image and title in the `ToastView`.
    /// - Parameter configuration: The configuration that has the views that are available for placing and styling within a `ToastView`.
    /// - Returns: a new view, configured and styled.
    func makeBody(configuration: Self.Configuration) -> Self.Body
}

public extension View {
    /// Sets the style for any `ToastView` in the hierarchy to the given `ToastViewStyle`.
    /// - Parameter style: A `ToastViewStyle` to use to style this view.
    /// - Returns: a new view, with the environment configured for the new toast view.
    func toastViewStyle<S: ToastViewStyle>(_ style: S) -> some View {
        self.environment(\.toastStyle, AnyToastViewStyle(style: style))
    }
}
