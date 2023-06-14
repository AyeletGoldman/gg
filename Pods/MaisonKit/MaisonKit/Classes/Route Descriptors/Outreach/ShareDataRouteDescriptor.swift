// Copyright © 2022 LVMH. All rights reserved.

import Foundation

/// The route descriptor for the template selection scene.
public struct ShareDataRouteDescriptor: RouteDescriptor {
    public static let identifier: Identifier = "ShareDataRouteDescriptor"

    /// The title that will be used for this scene
    public let title: String

    /// The list of assets to share
    public let assets: [URL]

    /// The adapter protocol methods
    public let adapter: ShareDataAdapter

    /// A closure to invoke when we have finished the sharing
    public let onClose: ((UIViewController) -> Void)?

    /// Creates a new `ShareDataScene`
    /// - Parameters:
    ///   - title: the title that will be used for this scene
    ///   - assets: the list of images to share
    ///   - adapter: the adapter protocol methods
    ///   - onClose: a closure to invoke when we have finished the sharing
    init(title: String,
         assets: [URL],
         adapter: ShareDataAdapter,
         onClose: ((UIViewController) -> Void)?) {
        self.title = title
        self.assets = assets
        self.adapter = adapter
        self.onClose = onClose
    }
}
