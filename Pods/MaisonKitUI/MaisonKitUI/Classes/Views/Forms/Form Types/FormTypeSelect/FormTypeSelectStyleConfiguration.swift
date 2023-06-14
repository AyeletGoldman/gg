// Copyright © 2023 LVMH. All rights reserved.

import Foundation
import SwiftUI
import StylableSwiftUI

/// Configuration for `FormTypeSelectStyle`
public struct FormTypeSelectStyleConfiguration {

    init(title: String,
         isSelected: Bool,
         subtitle: String? = nil,
         image: (any View)? = nil,
         badge: String? = nil,
         tag: (any View)? = nil) {
        self.selectIcon = SelectIcon()
        self.title = Title(title: title, badge: badge)
        self.subtitle = subtitle.map { Subtitle(subtitle: $0) }
        self.image = image.map { Image(content: $0) }
        self.tag = tag.map { Tag(content: $0) }
    }

    /// The select icon
    public struct SelectIcon: View {
        public var body: some View {
            MaisonKitImage(source: .styledImage(identifier: "icon-select"))
                .frame(width: 20, height: 20)
                .padding(.trailing, 8)
        }
    }

    /// The image content will be an image or a color
    public struct Image: View {
        let content: any View

        public var body: some View {
            StylableGroup("image") {
                content.eraseToAnyView()
                    .frame(width: 30, height: 30)
                    .style("background")
            }
            .padding(.trailing, 8)
        }
    }

    /// The row title with the badge next to it
    public struct Title: View {
        let title: String
        let badge: String?

        public var body: some View {
            HStack(spacing: 1) {
                Text(self.title)
                    .lineLimit(1)
                    .style("title")
                if let badge {
                    Badge(value: badge)
                }
            }
        }
    }

    /// The tag view
    public struct Tag: View {
        let content: any View

        public var body: some View {
            content.eraseToAnyView()
                .padding(.leading, 5)
        }
    }

    /// The subtitle view
    public struct Subtitle: View {
        let subtitle: String

        public var body: some View {
            Text(self.subtitle)
                .style("subtitle")
        }
    }

    /// The select icon
    public let selectIcon: SelectIcon

    /// The image content will be an image or a color
    public let image: Image?

    /// The row title with the badge next to it
    public let title: Title

    /// The tag view
    public let tag: Tag?

    /// The subtitle view
    public var subtitle: Subtitle?
}
