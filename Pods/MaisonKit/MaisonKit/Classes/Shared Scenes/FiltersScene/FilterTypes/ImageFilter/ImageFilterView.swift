// Copyright © 2020 LVMH. All rights reserved.

import Foundation
import SwiftUI
import StylableSwiftUI

/// A rich filter view that displays the options as a vertical stack of content and text.
/// The content can be either an image, a color, or text (usually 1-2 characters).
public struct ImageFilterView: View {

    public enum DisplayType {
        case rows
        case carrousel
    }

    /// The items to use as filtering values.
    public let filterItems: [ImageFilterItemView.Item]
    /// The type of how to display the items
    private let displayType: DisplayType
    /// The array of selected items
    public let selectedItemIds: [FilterValue]
    /// The closure to invoke when a filter item is selected (or deselected!)
    private let onSelect: (ImageFilterItemView.Item) -> Void

    /// Creates a new `ImageFilterView` with the given parameters.
    /// - Parameters:
    ///   - filterItems: the items to use as filtering values.
    ///   - displayType: how the image filter should be displayed.
    ///   - selectedItemIds: the array of selected items.
    ///   - onSelect: the closure to invoke when a filter item is tapped.
    public init(filterItems: [ImageFilterItemView.Item],
                displayType: DisplayType,
                selectedItemIds: [FilterValue],
                onSelect: @escaping (ImageFilterItemView.Item) -> Void) {
        self.filterItems = filterItems
        self.displayType = displayType
        self.selectedItemIds = selectedItemIds
        self.onSelect = onSelect
    }

    public var body: some View {
        Group {
            switch self.displayType {
            case .rows:
                self.buildRows()
            case .carrousel:
                self.buildCarrousel()
            }
        }
        .padding(.top, 10)
    }

    @ViewBuilder
    private func buildRows() -> some View {
        let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 4)
        LazyVGrid(columns: columns, content: {
            ForEach(self.filterItems) { item in
                self.buildItem(item: item)
            }
        })
        .padding(.horizontal)
    }

    @ViewBuilder
    private func buildCarrousel() -> some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ForEach(self.filterItems) { item in
                    self.buildItem(item: item)
                }
            }
            .padding(.horizontal)
        }
    }

    private func groupIdentifier(for item: ImageFilterItemView.Item) -> String {
        let isSelected = self.selectedItemIds.contains(item.id)
        let variant: String? = {
            guard item.isEnabled else { return "disabled" }
            return isSelected ? "selected" : nil
        }()
        return StylistIdentifier.buildFullIdentifier(for: "button-filters-avatar", variant: variant)
    }

    @ViewBuilder
    private func buildItem(item: ImageFilterItemView.Item) -> some View {
        StylableGroup(self.groupIdentifier(for: item)) {
            Button(action: {
                self.onSelect(item)
            }, label: {
                ImageFilterItemView(isSelected: self.selectedItemIds.contains(item.id),
                                    item: item)
            }).buttonStyle(NoAnimationButtonStyle())
        }
        .padding(2)
        .disabled(!item.isEnabled)
    }
}

struct ImageFilterView_Previews: PreviewProvider {
    static let selectedUUIDs = [UUID().uuidString, UUID().uuidString]
    static var previews: some View {
        Group {
            ImageFilterView(filterItems: [
                ImageFilterItemView.Item(id: UUID().uuidString,
                                         title: "Title 1",
                                         content: .color(.red)),
                ImageFilterItemView.Item(id: UUID().uuidString,
                                         title: "Title 1",
                                         content: .color(.red)),
                ImageFilterItemView.Item(id: UUID().uuidString,
                                         title: "Title 1",
                                         content: .color(.red)),
                ImageFilterItemView.Item(id: UUID().uuidString,
                                         title: "Title 1",
                                         content: .color(.red)),
                ImageFilterItemView.Item(id: UUID().uuidString,
                                         title: "Title 1",
                                         content: .color(.green)),
                ImageFilterItemView.Item(id: UUID().uuidString,
                                         title: "Title 1",
                                         content: .color(.green)),
                ImageFilterItemView.Item(id: UUID().uuidString,
                                         title: "Title 1",
                                         content: .color(.green)),
                ImageFilterItemView.Item(id: UUID().uuidString,
                                         title: "Title 1",
                                         content: .color(.green))
            ], displayType: .rows, selectedItemIds: [], onSelect: { _ in })
            ImageFilterView(filterItems: [
                ImageFilterItemView.Item(id: UUID().uuidString,
                                         title: "Title 1",
                                         content: .color(.red)),
                ImageFilterItemView.Item(id: UUID().uuidString,
                                         title: "Title 1",
                                         content: .color(.orange)),
                ImageFilterItemView.Item(id: UUID().uuidString,
                                         title: "Title 1",
                                         content: .color(.yellow))
            ], displayType: .rows, selectedItemIds: [], onSelect: { _ in })

            ImageFilterView(filterItems: [
                ImageFilterItemView.Item(id: selectedUUIDs[0],
                                         title: "Title 1",
                                         content: .color(.red)),
                ImageFilterItemView.Item(id: UUID().uuidString,
                                         title: "Title 1",
                                         content: .color(.blue)),
                ImageFilterItemView.Item(id: selectedUUIDs[1],
                                         title: "Title 1",
                                         content: .color(.green))
            ], displayType: .rows, selectedItemIds: selectedUUIDs, onSelect: { _ in })
        }.previewLayout(.sizeThatFits)
        .environmentObject(Stylist.unstyled)
    }
}
