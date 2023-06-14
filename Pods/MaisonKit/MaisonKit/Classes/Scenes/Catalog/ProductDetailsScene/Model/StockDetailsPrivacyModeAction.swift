// Copyright © 2021 LVMH. All rights reserved.

import Foundation
import SwiftUI
import StylableSwiftUI

public extension MenuAction {

    /// Creates a new `MenuAction` that will be used for updating the privacy mode of the stock details
    /// - Returns: an instance of `MenuAction` that will return the action for switching the stock details privacy mode
    static func stockDetailsPrivacyModeAction() -> MenuAction {
        let privacyMode = UserDefaults.standard.privacyMode
        let title = privacyMode == .detail ? MKLocalizedString("product-details.actions.stockPrivacy.hide",
                                                               comment: "The title of stock privacy action in the action sheet in detail mode")
        : MKLocalizedString("product-details.actions.stockPrivacy.show",
                            comment: "The title of stock privacy action in the action sheet in privacy mode")

        let token = privacyMode == .detail ? "icon-eye-closed" : "icon-eye-open"
        let imageIdentifier = Self.buildIdentifier(withToken: token)
        let action = MenuAction(localizedTitle: title,
                                imageIdentifier: imageIdentifier,
                                action: {
                                    let privacyMode = UserDefaults.standard.privacyMode
                                    UserDefaults.standard.privacyMode = privacyMode == .detail ? .privacy : .detail
                                })
        return action
    }
}
