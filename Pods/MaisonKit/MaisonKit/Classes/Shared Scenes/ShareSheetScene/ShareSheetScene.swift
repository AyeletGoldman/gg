//  Copyright © 2022 LVMH. All rights reserved.

import Foundation

/// A `Scene` used to present a share sheet via `UIActivityViewController`
public struct ShareSheetScene: Scene {

    private let items: [UIActivityItemProvider]
    private let onDone: ((UIViewController, Bool) -> Void)?

    /// Creates a new `ShareSheetScene`
    /// - Parameter shareItems: the items to share. Depending on the resources shared and the
    /// application that they are shared to not all resources may be delivered.
    /// - Parameter onDone: a closure to execute when the sharing has completed.
    /// The first parameter is the controller presented, the second one is whether the sharing was successful or not.
    public init(shareItems: [UIActivityItemProvider],
                onDone: ((UIViewController, Bool) -> Void)? = nil) {
        self.items = shareItems
        self.onDone = onDone
    }

    public func createViewController() -> UIActivityViewController {
        return UIActivityViewController(activityItems: self.items, applicationActivities: nil)
    }

    public func configure(controller: UIActivityViewController,
                          using factory: SceneFactory) {
        controller.completionWithItemsHandler = { [weak controller] _, completed, _, _ in
            guard let controller = controller else { return }
            self.onDone?(controller, completed)
        }
    }
}
