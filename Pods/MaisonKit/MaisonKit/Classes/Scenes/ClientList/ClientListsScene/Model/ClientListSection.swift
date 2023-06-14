// Copyright © 2023 LVMH. All rights reserved.

import Foundation

/// An amalgamation of sections to be shown on the client lists screen.
/// Currently contains:
///  - Featured lists: lists that are created and managed by the back office
///  - Personal lists: lists that are created and managed by the CA
public struct ClientListSection {
    /// The section holding all featured lists
    public var featured: ClientListSectionDisplayable
    /// The section holding all personal lists
    public var personal: ClientListSectionDisplayable

    /// Creates a new `ClientListSection` with the given featured and personal lists
    /// - Parameter featured: the container for all featured lists to be displayed
    /// - Parameter personal: the container for all personal lists to be displayed
    public init(featured: ClientListSectionDisplayable,
                personal: ClientListSectionDisplayable) {
        self.featured = featured
        self.personal = personal
    }
}
