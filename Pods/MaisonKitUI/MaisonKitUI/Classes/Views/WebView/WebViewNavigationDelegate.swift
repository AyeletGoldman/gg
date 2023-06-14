// Copyright © 2022 LVMH. All rights reserved.

import Foundation
import WebKit

protocol WebViewNavigationDelegate: AnyObject {

    func didStartNavigating(to url: URL)

    func didFinishNavigating(to url: URL)

    func didFailNavigation(to url: URL, with error: Error)

    func shouldAllowNavigation(to url: URL) -> WKNavigationActionPolicy
}

extension WebViewNavigationDelegate {

    func didStartNavigating(to url: URL) { }

    func didFinishNavigating(to url: URL) { }

    func didFailNavigation(to url: URL, with error: Error) { }

    func shouldAllowNavigation(to url: URL) -> WKNavigationActionPolicy { return .allow }
}
