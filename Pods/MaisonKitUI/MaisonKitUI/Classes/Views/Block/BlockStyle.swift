// Copyright © 2022 LVMH. All rights reserved.

import Foundation
import SwiftUI

/// A type that applies standard interaction behavior and a custom appearance to
/// all `Block`s within a view hierarchy.
///
/// To configure the current `Block` style for a view hierarchy, use the
/// `View/blockStyle(_:)` modifier.
public protocol BlockStyle {
    /// The configuration that has the views that are available for placing and styling within a `Block`.
    typealias Configuration = BlockStyleConfiguration
    /// The view that will be returned after configuring and placing all `Block` components.
    associatedtype Body: View

    /// Creates the body of the `Block` for each of the particular implementations of `BlockStyle`.
    /// Use the `configuration` parameter passed in to get access to the components in the `Block`.
    /// - Parameter configuration: the `BlockStyleConfiguration` to retrieve the properties of the block from
    /// - Returns: a new view, configured and styled.
    func makeBody(configuration: Self.Configuration) -> Self.Body
}
