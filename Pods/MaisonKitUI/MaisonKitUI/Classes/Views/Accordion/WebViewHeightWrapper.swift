// Copyright © 2022 LVMH. All rights reserved.

import SwiftUI

/// When including a WebView inside an accordion we need to have a wrapper for it that calculates
/// the height so we know how much to expand it by when its shown.
struct WebViewHeightWrapper: View {

    private let htmlSource: HTMLSource
    private let didTapLink: (URL) -> Void
    @State private var contentHeight: CGFloat = 0

    init(htmlSource: HTMLSource, didTapLink: @escaping (URL) -> Void) {
        self.htmlSource = htmlSource
        self.didTapLink = didTapLink
    }

    var body: some View {
        WebView(htmlSource: self.htmlSource, didTapLink: self.didTapLink, contentHeight: self.$contentHeight)
            .frame(height: self.contentHeight)
    }
}
