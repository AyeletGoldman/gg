// Copyright © 2023 LVMH. All rights reserved.

import Foundation

/// A tuple of data for displaying a `BadgeView`. Includes the `title` for the tag and an optional variant.
public struct BadgeViewData {
    /// The title to be displayed on a badge view. This should be localised.
    public let title: String
    /// The variant to configure the badge view with.
    public let variant: String?
}
