// Copyright © 2020 LVMH. All rights reserved.

import Foundation
import SwiftUI
import StylableSwiftUI

/// A view to display a filter item with some content and, optionally, text, arranged vertically.
/// The content can be either an image (via `ImageSource`), some text (usually initials) or a color.
public struct ImageFilterItemView: View {

    @Environment(\.isEnabled) private var isEnabled

    /// The content of the item
    public enum Content {
        case image(ImageSource)
        case text(String)
        case color(Color)
    }

    /// The object to model each filter option
    public struct Item: Identifiable, Equatable {
        /// The ID for this filter option.
        public let id: FilterValue
        /// The optional text to display beneath the content of this item
        public let title: String?
        /// The content that defines whether we will show an image, text or color in this filter option view.
        public let content: Content
        /// Whether this filter is enabled or not
        public let isEnabled: Bool
        /// The total matched items if the user will choose this filter item. In case of zero this item will be disabled.
        public let totalItems: Int?

        /// Creates a new `ImageFilterItemView.Item`
        /// - Parameters:
        ///   - id: The ID for this filter option.
        ///   - title: The optional text to display beneath the content of this item
        ///   - content: The content that defines whether we will show an image, text or color in this filter option view.
        ///   - isEnabled: Whether this filter is enabled or not
        public init(id: String, title: String?, content: Content, isEnabled: Bool = true) {
            self.id = id
            self.title = title
            self.content = content
            self.isEnabled = isEnabled
            self.totalItems = nil
        }

        /// Creates a new `ImageFilterItemView.Item`
        /// - Parameters:
        ///   - id: The ID for this filter option.
        ///   - title: The optional text to display beneath the content of this item
        ///   - content: The content that defines whether we will show an image, text or color in this filter option view.
        ///   - totalItems: The total matched items if the user will choose this filter item. In case of zero this item will be disabled.
        public init(id: String, title: String, content: Content, totalItems: Int) {
            self.id = id
            self.title = title
            self.content = content
            self.isEnabled = totalItems > 0
            self.totalItems = totalItems
        }

        // swiftlint:disable:next operator_whitespace
        public static func ==(lhs: Self, rhs: Self) -> Bool {
            return lhs.id == rhs.id
        }
    }

    /// Whether this view should be in selected mode or not
    private let isSelected: Bool
    /// The item to model the view on
    private let item: Item

    /// Creates a new `ImageFilterItemView` with the given parameters
    /// - Parameter isSelected: whether this view should be in selected mode or not
    /// - Parameter item: the item to model the view on
    public init(isSelected: Bool, item: Item) {
        self.isSelected = isSelected
        self.item = item
    }

    public var body: some View {
        VStack {
            ZStack(alignment: .topTrailing) {
                self.buildHeroView()
                    .frame(width: 60, height: 60)
                    .style("background")
                    .overlay(Rectangle().foregroundColor(.clear).style("overlay"))
                MaisonKitImage(source: .styledImage(identifier: self.isSelected ? "icon-checkbox-selected" : "icon-checkbox"))
                    .frame(width: 20, height: 20)
                    .hidden(!self.isEnabled)
            }.aspectRatio(1.0, contentMode: .fit) // make it "square"
            if let title = self.item.title {
                HStack(spacing: 2) {
                    Text(title)
                        .lineLimit(1)
                        .style("title")
                    if let totalItems = self.item.totalItems {
                        FilterItemTotalItemsView(totalItems: totalItems)
                    }
                }
            } else {
                Spacer()
            }
        }
    }

    @ViewBuilder
    private func buildHeroView() -> some View {
        switch self.item.content {
        case .image(let source):
            MaisonKitImage(source: source)
        case .text(let text):
            Text(text).style("subtitle")
        case .color(let color):
            Rectangle().foregroundColor(color)
        }
    }
}

struct ImageFilterItemView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HStack {
                ImageFilterItemView(isSelected: false, item: ImageFilterItemView.Item(id: UUID().uuidString,
                                                                                      title: "My store",
                                                                                      content: .color(.red)))
                ImageFilterItemView(isSelected: true, item: ImageFilterItemView.Item(id: UUID().uuidString,
                                                                                     title: "My store",
                                                                                     content: .color(.blue)))
                ImageFilterItemView(isSelected: false, item: ImageFilterItemView.Item(id: UUID().uuidString,
                                                                                      title: "My store",
                                                                                      content: .color(.green)))
                ImageFilterItemView(isSelected: true, item: ImageFilterItemView.Item(id: UUID().uuidString,
                                                                                     title: "My store",
                                                                                     content: .color(.orange)))
            }.frame(width: 400, height: 100)
            HStack {
                ImageFilterItemView(isSelected: false, item: ImageFilterItemView.Item(id: UUID().uuidString,
                                                                                      title: "My store",
                                                                                      content: .text("KM")))
                ImageFilterItemView(isSelected: true, item: ImageFilterItemView.Item(id: UUID().uuidString,
                                                                                     title: "My store",
                                                                                     content: .text("NS")))
                ImageFilterItemView(isSelected: false, item: ImageFilterItemView.Item(id: UUID().uuidString,
                                                                                      title: "My store",
                                                                                      content: .text("SA")))
                ImageFilterItemView(isSelected: true, item: ImageFilterItemView.Item(id: UUID().uuidString,
                                                                                     title: "My store",
                                                                                     content: .text("BB")))
            }.frame(width: 400, height: 100)
            HStack {
                ImageFilterItemView(isSelected: false, item: ImageFilterItemView.Item(id: UUID().uuidString,
                                                                                      title: "My store",
                                                                                      content: .image(.system(name: "star"))))
                ImageFilterItemView(isSelected: true, item: ImageFilterItemView.Item(id: UUID().uuidString,
                                                                                     title: "My store",
                                                                                     content: .image(.system(name: "car.fill"))))
                ImageFilterItemView(isSelected: false, item: ImageFilterItemView.Item(id: UUID().uuidString,
                                                                                      title: "My store",
                                                                                      content: .image(.system(name: "bitcoinsign.square.fill"))))
                ImageFilterItemView(isSelected: true, item: ImageFilterItemView.Item(id: UUID().uuidString,
                                                                                     title: "My store",
                                                                                     content: .image(.system(name: "building"))))
            }.frame(width: 400, height: 100)
        }.previewLayout(.sizeThatFits)
        .environmentObject(Stylist.unstyled)
    }
}
