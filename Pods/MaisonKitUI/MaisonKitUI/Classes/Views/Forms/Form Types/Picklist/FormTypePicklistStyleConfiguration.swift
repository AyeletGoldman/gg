// Copyright © 2022 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

/// The configuration for a given `FormTypePicklist` view's style.
/// This configuration object holds the views that are available for any given `FormTypePicklistStyle` to work with.
public struct FormTypePicklistStyleConfiguration {

    /// The title shown in the picklist
    public struct Title: View {
        private let text: String

        /// Creates a new `Title` view with the given text. This `String` is then
        /// inserted into a `Text` view and styled with `title`.
        /// - Parameter text: The string to show as a title
        public init(text: String) {
            self.text = text
        }

        public var body: some View {
            return Text(self.text)
                .style("title")
        }
    }

    /// The subtitle shown in the picklist
    public struct Subtitle: View {
        private let text: String

        /// Creates a new `Subtitle` view with the given text. This `String` is then
        /// inserted into a `Text` view and styled with `subtitle`.
        /// - Parameter text: The string to show as a subtitle
        public init(text: String) {
            self.text = text
        }

        public var body: some View {
            return Text(self.text)
                .style("subtitle")
        }
    }

    /// The badge shown in the picklist
    public struct BadgeView: View {
        private let text: String

        /// Creates a new `Badge` view with the given text.
        /// - Parameter text: The string to show as the badge
        public init(text: String) {
            self.text = text
        }

        public var body: some View {
            return Badge(value: self.text)
        }
    }

    /// The icon shown in the picklist. This is always `icon-pick` with a size of 20x20.
    public struct Icon: View {

        /// Creates a new `Icon` for the picklist
        public init() { }

        public var body: some View {
            return MaisonKitImage(source: .styledImage(identifier: "icon-pick"))
                .frame(width: 20, height: 20)
        }
    }

    /// The title to be displayed for the picklist. This is usually the context of the menu that will be displayed.
    public private(set) var title: FormTypePicklistStyleConfiguration.Title

    /// A description of the selected value from the picklist. If this is `nil` it usually means there has been no selection made.
    public private(set) var subtitle: FormTypePicklistStyleConfiguration.Subtitle?

    /// A badge to display on the picklist component. Usually this badge is a small piece of text that grants the user additional context.
    public private(set) var badge: FormTypePicklistStyleConfiguration.BadgeView?

    /// The icon shown in the picklist. This is always `icon-pick` with a size of 20x20.
    public private(set) var icon: FormTypePicklistStyleConfiguration.Icon

    /// Creates a new `FormTypePicklistStyleConfiguration`
    /// - Parameters:
    ///   - title: The title to be displayed for the picklist. This is usually the context of the menu that will be displayed.
    ///   - subtitle: Optional. A description of the selected value from the picklist. If this is `nil` it usually means there has been no selection made. Defaults to `nil`.
    ///   - badge: Optional. A badge to display on the picklist component. Usually this badge is a small piece of text that grants the user additional context. Defaults to `nil`.
    public init(title: FormTypePicklistStyleConfiguration.Title,
                subtitle: FormTypePicklistStyleConfiguration.Subtitle? = nil,
                badge: FormTypePicklistStyleConfiguration.BadgeView? = nil) {
        self.title = title
        self.subtitle = subtitle
        self.badge = badge
        self.icon = FormTypePicklistStyleConfiguration.Icon()
    }
}
