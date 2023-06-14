// Copyright © 2022 LVMH. All rights reserved.

import Foundation

/// The representation of an item in an action sheet.
/// Items are used to perform actions when tapped. Each item has a title and an aciton.
public struct ActionSheetItem: Identifiable {

    /// The item's ID. Used to enable presenting in lists in SwiftUI.
    public let id = UUID()
    /// The items' title. This title is displayed on the native and custom alert sheets. This title should be localised.
    public let title: String
    /// The item's action. This action is to be performed when this item is tapped.
    public let action: (() -> Void)?

    /// Creates a new `ActionSheetItem`
    /// - Parameters:
    ///   - title: The items' title. This title is displayed on the native and custom alert sheets. This title should be localised.
    ///   - action: The item's action. This action is to be performed when this item is tapped.
    public init(title: String, action: (() -> Void)? = nil) {
        self.title = title
        self.action = action
    }
}

public extension ActionSheetItem {
    /// A default cancel item; this item has a translated `Cancel` text and an action that does nothing.
    /// - Returns: an `ActionSheetItem` pre-configured for `Cancel`.
    static func cancelItem() -> ActionSheetItem {
        return ActionSheetItem(title: MKLocalizedString("alert.buttons.cancel.title",
                                                        comment: "The default 'cancel' button title"),
                               action: { /* needs an empty action to automatically dismiss the sheet.
                                          This can be removed when we remove native action sheets */ })
    }
}
