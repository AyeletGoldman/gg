// Copyright © 2022 LVMH. All rights reserved.

import Foundation
import SwiftUI

/// A type that applies standard interaction behavior and a custom appearance to
/// all `Tag`s within a view hierarchy.
///
/// To configure the current `Tag` style for a view hierarchy, use the
/// `View/tagStyle(_:)` modifier.
public protocol TagStyle {
    /// The configuration that has the views that are available for placing and styling within a `Tag`.
    typealias Configuration = TagStyleConfiguration
    /// The view that will be returned after configuring and placing all `Tag` components.
    associatedtype Body: View

    /// Creates the body of the `Tag` for each of the particular implementations of `TagStyle`.
    /// Use the `configuration` parameter passed in to get access to the components in the `Tag`.
    /// - Parameter configuration: the `TagStyleConfiguration` to retrieve the properties of the block from
    /// - Returns: a new view, configured and styled.
    func makeBody(configuration: Self.Configuration) -> Self.Body
}
