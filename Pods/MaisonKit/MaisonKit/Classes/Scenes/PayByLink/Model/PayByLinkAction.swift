// Copyright © 2021 LVMH. All rights reserved.

import Foundation
import StylableSwiftUI

public extension MenuAction {

    /// Creates a pay by link menu action
    /// - Parameter payByLinkData: the data for pay by link
    /// - Returns: an `MenuAction` that will display the pay by link
    static func payByLinkMenuAction(payByLinkData: PayByLinkData?) -> MenuAction {
        let title = MKLocalizedString("product-details.actions.pay-by-link",
                                      comment: "The title of the pay by link action in the action sheet")

        let iconIdentifier: StylistIdentifier = Self.buildIdentifier(withToken: "icon-pay-by-link")
        if let payByLinkData = payByLinkData {
            return self.payByLinkAction(payByLinkData: payByLinkData, title: title, iconIdentifier: iconIdentifier)
        } else {
            let action = MenuAction(localizedTitle: title,
                                    imageIdentifier: iconIdentifier,
                                    isEnabled: false,
                                    action: {})
            return action
        }
    }

    /// Creates a pay by link menu action
    /// - Parameters:
    ///   - payByLinkData: the data for pay by link
    ///   - title: the title of the button to display, if any is appropriate for this action
    ///   - isEnabled: whether the pay by link action is enabled or not
    ///   - iconIdentifier: the icon identifier to display an icon if it is appropriate. Optional, defaults to `nil`.
    ///   - presentationStyle: the presentation style to use when presenting the pay by link scene. Defaults to `.fullScreenModal`.
    /// - Returns: a `MenuAction` that will display the pay by link
    static func payByLinkAction(payByLinkData: PayByLinkData,
                                title: String,
                                isEnabled: Bool = true,
                                iconIdentifier: StylistIdentifier? = nil,
                                presentationStyle: PresentationStyle = .fullScreenModal) -> MenuAction {
        return MenuAction(localizedTitle: title,
                          imageIdentifier: iconIdentifier,
                          preferredPresentationStyle: presentationStyle,
                          isEnabled: isEnabled,
                          routeDescriptorFactory: { onClose in
            let navigationTitle = MKLocalizedString("pay-by-link.create-order.navigation-bar.title",
                                                    comment: "The title of the pay by link navigation bar")
            return PBLCreateOrderDescriptor(data: payByLinkData, title: navigationTitle, onClose: onClose)
        })
    }

}
