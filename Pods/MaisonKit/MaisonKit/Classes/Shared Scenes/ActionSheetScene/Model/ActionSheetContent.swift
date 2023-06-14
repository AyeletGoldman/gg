// Copyright © 2020 LVMH. All rights reserved.

import Foundation
import SwiftUI

/// The content to be displayed in a custom action sheet in MaisonKit.
public struct ActionSheetContent: Identifiable {

    /// The identifier for this action sheet content. This is required to use SwiftUI's native `.actionSheet` view modifier.
    public let id = UUID()
    /// The title for the action sheet. In a custom action sheet this will be displayed in the navigation bar.
    public let title: String
    /// The message for the action sheet. In a custom action sheet this text is not currently displayed.
    public let message: String?
    /// The items to be shown in the action sheet. These are presented in a list on a custom action sheet view.
    public let items: [ActionSheetItem]
    /// The cancel item. If available, the custom action sheet will display this as a button in the leading buttons of the navigation bar.
    public let cancelItem: ActionSheetItem?

    /// Creates a new `ActionSheetContent`
    /// - Parameters:
    ///   - title: The title for the action sheet. In a custom action sheet this will be displayed in the navigation bar.
    ///   - message: The message for the action sheet. In a custom action sheet this text is not currently displayed.
    ///   - items: The items to be shown in the action sheet. These are presented in a list on a custom action sheet view.
    ///   - cancelItem: The cancel item. If available, the custom action sheet will display this as a button in the leading buttons of the navigation bar.
    public init(title: String, message: String? = nil, items: [ActionSheetItem], cancelItem: ActionSheetItem? = nil) {
        self.title = title
        self.message = message
        self.items = items
        self.cancelItem = cancelItem
    }
}
