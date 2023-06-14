// Copyright © 2023 LVMH. All rights reserved.

import Foundation
import SwiftUI

/// A type that applies standard interaction behavior and a custom appearance to
/// all `FormTypeSelect`s within a view hierarchy.
///
/// To configure the current `FormTypeSelect` style for a view hierarchy, use the
/// `View/formTypeSelectStyle(_:)` modifier.
public protocol FormTypeSelectStyle {
    /// The configuration that has the views that are available for placing and styling within a `FormTypeSelect`.
    typealias Configuration = FormTypeSelectStyleConfiguration
    /// The view that will be returned after configuring and placing all `FormTypeSelect` components.
    associatedtype Body: View

    /// Creates the body of the `FormTypeSelect` for each of the particular implementations of `FormTypeSelectStyle`.
    /// Use the `configuration` parameter passed in to get access to the components in the `FormTypeSelect`.
    /// - Parameter configuration: the `FormTypeSelectStyleConfiguration` to retrieve the properties of the `FormTypeSelect`
    /// - Returns: a new view, configured and styled.
    func makeBody(configuration: Self.Configuration) -> Self.Body
}
