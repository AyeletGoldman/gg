// Copyright © 2021 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

/// The object to model each selection option
public struct SelectionListItem: Identifiable {

    /// The content of the item
    public enum Content {
        case image(ImageSource)
        case color(Color)
        case custom(SelectionItemContentView)
    }

    /// The ID for this selection option.
    public let id: String
    /// The item title to display.
    public let title: String
    /// The optional subtitle view to display next to the title
    public let subtitle: (() -> any View)?
    /// The content that defines whether we will show an image or color in this selection option view.
    public let content: Content?
    /// Defines whether or not this selection list item should be enabled.
    public let isEnabled: Bool

    /// Creates a new `SelectionListItem`
    /// - Parameters:
    ///   - id: The ID for this selection option.
    ///   - title: The item title to display.
    ///   - content: The content that defines whether we will show an image or color in this selection option view.
    ///   - isEnabled: Defines whether or not this selection list item should be enabled.
    public init(id: String, title: String, content: Content? = nil, isEnabled: Bool = true) {
        self.id = id
        self.title = title
        self.subtitle = nil
        self.content = content
        self.isEnabled = isEnabled
    }

    /// Creates a new `SelectionListItem`
    /// - Parameters:
    ///   - id: The ID for this selection option.
    ///   - title: The item title to display.
    ///   - subtitle: The optional subtitle view to display next to the title.
    ///   - content: The content that defines whether we will show an image or color in this selection option view.
    ///   - isEnabled: Defines whether or not this selection list item should be enabled.
    public init(id: String,
                title: String,
                subtitle: @escaping () -> any View,
                content: Content? = nil,
                isEnabled: Bool = true) {
        self.id = id
        self.title = title
        self.subtitle = subtitle
        self.content = content
        self.isEnabled = isEnabled
    }
}

/// A protocol for implementing a custom content of selection list item
public protocol SelectionItemContentView {
    /// Build the view for the custom content of selection list item
    /// - Returns: A type-erased `View` for the content
    func makeBody() -> AnyView
}

extension SelectionListItem: Equatable {
    public static func == (lhs: SelectionListItem, rhs: SelectionListItem) -> Bool {
        return lhs.id == rhs.id
    }
}

struct SelectionListItemView: View {

    private let item: SelectionListItem

    init(item: SelectionListItem) {
        self.item = item
    }

    var body: some View {
        HStack(spacing: 2) {
            Text(verbatim: self.item.title)
                .style("title")
                .padding(.vertical, 15)
            if let subtitle = self.item.subtitle {
                subtitle().eraseToAnyView()
            }
            Spacer()
            if let itemContent = self.item.content {
                self.buildHeroView(itemContent: itemContent, isEnabled: self.item.isEnabled)
            }
        }
    }

    @ViewBuilder
    private func buildHeroView(itemContent: SelectionListItem.Content, isEnabled: Bool) -> some View {
        switch itemContent {
        case .image(let source):
            self.buildHeroViewForKnownContent(MaisonKitImage(source: source), isEnabled: isEnabled)
        case .color(let color):
            self.buildHeroViewForKnownContent(Rectangle().foregroundColor(color), isEnabled: isEnabled)
        case .custom(let viewBuilder):
            viewBuilder.makeBody()
        }
    }

    @ViewBuilder
    private func buildHeroViewForKnownContent<V: View>(_ content: V, isEnabled: Bool) -> some View {
        StylableGroup(StylistIdentifier.buildFullIdentifier(for: "button-filters-avatar", variant: isEnabled ? nil : "disabled")) {
            content
                .style("background")
                .frame(width: 34, height: 34)
                .overlay(Rectangle().foregroundColor(.clear).style("overlay"))
        }
    }
}
