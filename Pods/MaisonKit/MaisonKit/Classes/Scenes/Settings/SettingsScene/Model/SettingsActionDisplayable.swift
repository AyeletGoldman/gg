// Copyright © 2022 LVMH. All rights reserved.

import Foundation
import SwiftUI
import StylableSwiftUI

/// A structure that defines a displayable for a settings action that has a title, subtitle, icon and an axis on which to lay out the title and subtitle.
/// The axis controls whether the title and subtitle and next to each other or one above the other.
public struct SettingsActionDisplayable {
    /// The title for this action. This will be shown prominently on the leading edge of the cell.
    public let title: String
    /// Optional. The subtitle for this action. This will be shown on the trailing edge of the cell, with a muted style.
    public let subtitle: String?
    /// Optional. An icon to show on the trailing edge of the cell.
    public let icon: StylistIdentifier?
    /// The axis on which to lay out the title and subtitle. `.horizontal` will lay them next to each other:
    /// | TITLE <SPACER> SUBTITLE |
    /// while `.vertical` will lay the title above the subtitle.
    public let axis: Axis

    /// Creates a new `SettingsActionDisplayable`
    /// - Parameters:
    ///   - title: The title for this action. This will be shown prominently on the leading edge of the cell.
    ///   - subtitle: Optional. The subtitle for this action. This will be shown on the trailing edge of the cell, with a muted style. Defaults to `nil`.
    ///   - icon: Optional. An icon to show on the trailing edge of the cell. Defaults to `nil`.
    ///   - axis: The axis on which to lay out the title and subtitle. `.horizontal` will lay them next to each other:
    ///     | TITLE <SPACER> SUBTITLE |
    ///     while `.vertical` will lay the title above the subtitle.
    public init(title: String,
                subtitle: String? = nil,
                icon: StylistIdentifier? = nil,
                axis: Axis = .horizontal) {
        self.title = title
        self.subtitle = subtitle
        self.icon = icon
        self.axis = axis
    }
}
