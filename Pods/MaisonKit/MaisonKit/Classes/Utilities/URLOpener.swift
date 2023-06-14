// Copyright © 2020 LVMH. All rights reserved.

import Foundation

/// A protocol that defines a type that can open URLs
public protocol URLOpener {

    /// Asks the implementer whether it can open a given URL or not
    /// - Parameter url: The URL to open.
    /// - Returns: A boolean whether or not the URL can be opened
    func canOpenURL(_ url: URL) -> Bool

    /// Asks the implementer to open the given URL.
    /// - Parameters:
    ///   - url: the URL to open
    ///   - options: the options to for opening the URL
    ///   - completionHandler: a handler to invoke when the URL has been opened with a boolean indicating whether the URL was opened successfully.
    func open(_ url: URL,
              options: [UIApplication.OpenExternalURLOptionsKey: Any],
              completionHandler: ((Bool) -> Void)?)
}

extension UIApplication: URLOpener { }

extension URLOpener {
    func openAppSettingsURL() {
        guard let url = URL(string: UIApplication.openSettingsURLString),
              self.canOpenURL(url) else {
            return
        }
        self.open(url, options: [:], completionHandler: nil)
    }
}
