// Copyright © 2023 LVMH. All rights reserved.

import Foundation
import SwiftUI
import StylableSwiftUI

/// Form Type Groups are - unsurprisingly - useful when you need to group Form Types,
///  like select boxes which belong in the same Form Field. The Type Group also controls if the nested Form Type is a Single Select or Multi Select item.
/// You use the Form Type Group as you would use the Form Type, and then nest the Form Types within it.
/// `FormTypeGroupGrid` is a convenience for adding a grid of items.
/// This type does not make any assumptions on the underlying content of the grid, it just provides the scaffold for creating a `form-type-group-grid`.
public struct FormTypeGroupGrid<Content: View>: View {

    private let numberOfColumns: Int
    private let edgeInsets: EdgeInsets?
    private let variant: FormTypeGroupSelectionVariant?
    private let content: Content

    /// Creates a new `FormTypeGroupGrid`. Use this initializer to create the scaffold around a grid group type.
    /// - Parameters:
    ///   - numberOfColumns: the number of columns to create in the grid. Defaults to 4.
    ///   - edgeInsets: A value for the inset to be added at the beginning and end of the scroll view
    ///   - variant: a variant to add to the stylist identifier wrappign this component
    ///   - content: the content to display inside the group. Usually, this will be a `ForEach` with a list of items.
    public init(numberOfColumns: Int = 4,
                edgeInsets: EdgeInsets? = nil,
                variant: FormTypeGroupSelectionVariant? = nil,
                @ViewBuilder content: () -> Content) {
        self.numberOfColumns = numberOfColumns
        self.edgeInsets = edgeInsets
        self.variant = variant
        self.content = content()
    }

    private var columns: [GridItem] {
        return (0..<self.numberOfColumns).map { _ in
            return GridItem(.flexible(), spacing: 1)
        }
    }

    public var body: some View {
        StylableGroup(StylistIdentifier.buildFullIdentifier(for: "form-type-group-grid",
                                                            variant: self.variant)) {
            LazyVGrid(columns: self.columns, spacing: 0) {
                StylableGroup("form-type-group-grid-row") {
                    self.content
                }
            }.padding(self.edgeInsets ?? EdgeInsets())
        }
    }
}

#if DEBUG
struct FormTypeGroupGrid_Previews: PreviewProvider {

    private static let items: [String] = [
        "44", "44.5", "45", "45.5",
        "37-38", "XS", "S", "M", "L",
        "XL", "XXL", "XXXL"
    ]

    static var previews: some View {
        FormTypeGroupGrid {
            ForEach(0..<self.items.count, id: \.self) { index in
                Text(self.items[index])
                    .padding(4)
                    .background(Color(UIColor.systemBackground))
                    .foregroundColor(.primary)
            }
        }
        .inAllModes(stylist: .defaultStylist, darkModeStylist: .darkModeStylist)
    }
}
#endif
