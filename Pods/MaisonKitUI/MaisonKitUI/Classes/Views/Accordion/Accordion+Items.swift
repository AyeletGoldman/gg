// Copyright © 2022 LVMH. All rights reserved.

import SwiftUI

public extension Accordion {

    /// An item that will be shown in an accordion. It contains a title and a body (a view) which will usually be initially hidden.
    struct Item: Identifiable {
        /// The stable identity of the entity associated with this instance.
        public let id: String
        /// The title to be displayed in the accordion. This title is always visible and when tapped expands the body of the accordion.
        public let title: String
        /// The item maximum height. In case the height should be higher there will be a scroll.
        public let maxHeight: CGFloat?
        /// The view that represents the content in the accordion item. Usually this view will be hidden to start with and will
        /// appear when the title is tapped.
        public let body: any View

        /// Creates a new `Accordion.Item`
        /// - Parameters:
        ///   - id: The stable identity of the entity associated with this instance. Defaults to `UUID().uuidString`.
        ///   - title: The title to be displayed in the accordion. This title is always visible and when tapped expands the body of the accordion.
        ///   - maxHeight: Optional. The item maximum height. In case the height should be higher there will be a scroll.
        ///   - body: The view that represents the content in the accordion item. Usually this view will be hidden to start with and will
        /// appear when the title is tapped.
        public init(id: String = UUID().uuidString, title: String, maxHeight: CGFloat? = nil, body: any View) {
            self.id = id
            self.title = title
            self.maxHeight = maxHeight
            self.body = body
        }

        /// Creates a new `Accordion.Item`
        /// - Parameters:
        ///   - id: The stable identity of the entity associated with this instance. Defaults to `UUID().uuidString`.
        ///   - title: The title to be displayed in the accordion. This title is always visible and when tapped expands the body of the accordion.
        ///   - maxHeight: Optional. The item maximum height. In case the height should be higher there will be a scroll.
        ///   - body: The view that represents the content in the accordion item. Usually this view will be hidden to start with and will
        /// appear when the title is tapped.
        public init(id: String = UUID().uuidString, title: String, maxHeight: CGFloat? = nil, body: () -> any View) {
            self.id = id
            self.title = title
            self.maxHeight = maxHeight
            self.body = body()
        }

        /// Creates a new `Accordion.Item`
        /// - Parameters:
        ///   - id: The stable identity of the entity associated with this instance. Defaults to `UUID().uuidString`.
        ///   - title: The title to be displayed in the accordion. This title is always visible and when tapped expands the body of the accordion.
        ///   - maxHeight: Optional. The item maximum height. In case the height should be higher there will be a scroll.
        ///   - body: A text representation of the body. In this case, the Item will create a `Text` styled as `body`.
        ///     The text can contains text with a link inside: `"... [Text to click on](https://example.com) ..."`
        public init(id: String = UUID().uuidString, title: String, maxHeight: CGFloat? = nil, body: String) {
            self.id = id
            self.title = title
            self.maxHeight = maxHeight
            self.body = Text(.init(body))
                .frame(maxWidth: .infinity, alignment: .leading)
                .style("body")
                .fixedSize(horizontal: false, vertical: true)
        }

        /// Creates a new `Accordion.Item`
        /// - Parameters:
        ///   - id: The stable identity of the entity associated with this instance. Defaults to `UUID().uuidString`.
        ///   - title: The title to be displayed in the accordion. This title is always visible and when tapped expands the body of the accordion.
        ///   - maxHeight: Optional. The item maximum height. In case the height should be higher there will be a scroll.
        ///   - html: An HTML representation of the body. In this case, the Item will create a `WebView` and display the HTML string in that webview.
        ///   Make sure you include CSS and at least this meta declararation in your HTML: `<meta name="viewport" content="width=device-width, initial-scale=1">`
        ///   Otherwise MaisonKit will not be able to correctly identify the height of the content in the webview.
        ///   The HTML can contains links to open the browser: `<a href="https://example.com">Text to click on</a>`
        ///   - didTapLink: A closure to define what to do when tapping on a link. For example `UIApplication.shared.open(url)`.
        public init(id: String = UUID().uuidString,
                    title: String,
                    maxHeight: CGFloat? = nil,
                    html: String,
                    didTapLink: @escaping (URL) -> Void) {
            self.id = id
            self.title = title
            self.maxHeight = maxHeight
            self.body = WebViewHeightWrapper(htmlSource: .string(html), didTapLink: didTapLink)
        }
    }
}
