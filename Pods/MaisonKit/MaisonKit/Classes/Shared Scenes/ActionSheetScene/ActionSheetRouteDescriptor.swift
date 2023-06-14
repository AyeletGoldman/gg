// Copyright © 2022 LVMH. All rights reserved.

import Foundation

/// A route descriptor for a scene that will present a UI to replace a regular native action sheet
public struct ActionSheetRouteDescriptor: RouteDescriptor {
    public static let identifier: Identifier = "ActionSheetRouteDescriptor"

    /// The content to show in this view
    public let actionSheetContent: ActionSheetContent
    /// A closure to invoke when the cancel button is pressed
    public let onCancel: (UIViewController) -> Void
    /// A closure to invoke when an item is selected. The first parameter is the view controller to be dismissed,
    /// the second parameter is the action sheet item that was selected.
    public let onItemSelected: (UIViewController, ActionSheetItem) -> Void

    /// - Parameters:
    ///   - actionSheetContent: The content to show in this view
    ///   - onCancel: A closure to invoke when the cancel button is pressed
    ///   - onItemSelected: A closure to invoke when an item is selected
    ///   The first parameter is the view controller to be dismissed, the second parameter is the action sheet item that was selected.
    public init(actionSheetContent: ActionSheetContent,
                onCancel: @escaping (UIViewController) -> Void,
                onItemSelected: @escaping (UIViewController, ActionSheetItem) -> Void) {
        self.actionSheetContent = actionSheetContent
        self.onCancel = onCancel
        self.onItemSelected = onItemSelected
    }
}
