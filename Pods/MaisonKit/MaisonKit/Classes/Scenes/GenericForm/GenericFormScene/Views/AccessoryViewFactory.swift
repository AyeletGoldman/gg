// Copyright © 2022 LVMH. All rights reserved.

import SwiftUI

/// A struct with static helper functions that build views for generic form fields
public struct AccessoryViewFactory {

    /// Creates a loading view with a fixed frame.
    /// - Parameter isHidden: whether the view should be hidden or not
    /// - Returns: a view that shows a loading status
    @ViewBuilder
    public static func loadingView(isHidden: Bool) -> some View {
        LoadingView()
            .frame(width: 20, height: 20)
            .hidden(isHidden)
    }

    /// Build retry button view, usually in use when having a field error for loading the field options
    /// - Parameters:
    ///   - action: the button action
    ///   - isHidden: whether to show the retry button view, or not
    /// - Returns: a view that shows a button with a retry icon defined by the `icon-retry` identifier.
    @ViewBuilder
    public static func retryButton(action: @escaping () -> Void, isHidden: Bool) -> some View {
        Button(action: action, label: {
            StyledFormIconView(identifier: "icon-retry")
        }).hidden(isHidden)
    }

    /// Build lock icon view, usually in use to mark a field with lock mode
    /// - Parameters:
    ///   - isHidden: whether to show the lock icon view or not
    /// - Returns: a view representing an icon defined by the `icon-lock` identifier.
    @ViewBuilder
    public static func lockIcon(isHidden: Bool) -> some View {
        StyledFormIconView(identifier: "icon-lock")
            .hidden(isHidden)
    }

    /// Build disclosure indicator view, usually in use to mark a field that could be clickable to open a modal
    /// - Parameters:
    ///   - isHidden: whether to show the disclosure indicator view or not
    /// - Returns: a view representing an icon defined by the `icon-right` identifier.
    @ViewBuilder
    public static func disclosureIndicator(isHidden: Bool) -> some View {
        StyledFormIconView(identifier: ViewStackIdentifierConstants.defaultDisclosureIndicator)
            .hidden(isHidden)
    }
}
