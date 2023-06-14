// Copyright © 2022 LVMH. All rights reserved.

import Foundation
import StylableSwiftUI

public extension ContextualAction {

    /// Creates a new `ContextualAction` that will be used to display the curator share scene
    /// - Parameters:
    ///   - assets: the curator assets to share
    ///   - presentationStyle: the presentation style to present the product share scene. Defaults to `.modal`.
    /// - Returns: an instance of `ContextualAction` that will return the product share scene.
    static func curatorShareAction(assets: [URL],
                                   presentationStyle: PresentationStyle = .modal) -> ContextualAction {
        let title = MKLocalizedString("product-curator.actions.share-curator",
                                      comment: "The title of the curator share action")
        return ContextualAction(localizedTitle: title,
                                preferredPresentationStyle: presentationStyle,
                                routeDescriptorFactory: { onClose in
            let navBarTitle = MKLocalizedString("curator-share.navigationBar.title",
                                                comment: "The title of the curator share search client navigation bar")
            return ShareDataRouteDescriptor(title: navBarTitle,
                                            assets: assets,
                                            adapter: CuratorShareViewModel(),
                                            onClose: onClose)
        })
    }
}
