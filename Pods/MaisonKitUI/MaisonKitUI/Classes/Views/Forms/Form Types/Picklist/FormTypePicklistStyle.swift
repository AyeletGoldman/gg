// Copyright © 2023 LVMH. All rights reserved.

import Foundation
import SwiftUI

/// A type that applies standard interaction behavior and a custom appearance to
/// all `FormTypePicklist`s within a view hierarchy.
///
/// To configure the current `FormTypePicklist` style for a view hierarchy, use the
/// `View/formTypePicklistStyle(_:)` modifier.
public protocol FormTypePicklistStyle {
    /// The configuration that has the views that are available for placing and styling within a `FormTypePicklist`.
    typealias Configuration = FormTypePicklistStyleConfiguration
    /// The view that will be returned after configuring and placing all `FormTypePicklist` components.
    associatedtype Body: View

    /// Creates the body of the `FormTypePicklist` for each of the particular implementations of `FormTypePicklistStyle`.
    /// Use the `configuration` parameter passed in to get access to the components in the `FormTypePicklist`.
    /// - Parameter configuration: the `FormTypePicklistStyleConfiguration` to retrieve the properties of the picklist from
    /// - Returns: a new view, configured and styled.
    func makeBody(configuration: Self.Configuration) -> Self.Body
}
