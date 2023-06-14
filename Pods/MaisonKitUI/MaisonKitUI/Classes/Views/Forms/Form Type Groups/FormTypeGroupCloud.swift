// Copyright © 2023 LVMH. All rights reserved.

import Foundation
import SwiftUI
import StylableSwiftUI

/// Form Type Groups are - unsurprisingly - useful when you need to group Form Types,
///  like select boxes which belong in the same Form Field. The Type Group also controls if the nested Form Type is a Single Select or Multi Select item.
/// You use the Form Type Group as you would use the Form Type, and then nest the Form Types within it.
/// This type does not make any assumptions on the underlying content of the grid, it just provides the scaffold for creating a `form-type-group-cloud`.
public struct FormTypeGroupCloud: View {

    private let edgeInsets: EdgeInsets?
    private let variant: FormTypeGroupSelectionVariant?
    private let numberOfItems: Int
    private let itemBuilder: (Int) -> any View

    /// Creates a new `FormTypeGroupCloud`.
    /// - Parameters:
    ///   - numberOfItems: the total items count
    ///   - edgeInsets: a value for the inset to be added at the beginning and end of the scroll view
    ///   - variant: a variant to add to the stylist identifier wrappign this component
    ///   - itemBuilder: the item view builder by getting its index
    public init(numberOfItems: Int,
                edgeInsets: EdgeInsets? = nil,
                variant: FormTypeGroupSelectionVariant? = nil,
                itemBuilder: @escaping (Int) -> any View) {
        self.numberOfItems = numberOfItems
        self.itemBuilder = itemBuilder
        self.edgeInsets = edgeInsets
        self.variant = variant
    }

    /// Creates a new `FormTypeGroupCloud`.
    /// - Parameters:
    ///   - items: the view items to display inside the group.
    ///   - edgeInsets: A value for the inset to be added at the beginning and end of the scroll view
    ///   - variant: a variant to add to the stylist identifier wrappign this component
    public init(items: [any View],
                edgeInsets: EdgeInsets? = nil,
                variant: FormTypeGroupSelectionVariant? = nil) {
        self.edgeInsets = edgeInsets
        self.variant = variant
        self.numberOfItems = items.count
        self.itemBuilder = { items[$0] }
    }

    public var body: some View {
        StylableGroup(StylistIdentifier.buildFullIdentifier(for: "form-type-group-cloud",
                                                            variant: self.variant)) {
            StylableGroup("form-type-group-cloud-row") {
                WrappedHStack(numberOfItems: self.numberOfItems, itemBuilder: self.itemBuilder)
                    .padding(self.edgeInsets ?? EdgeInsets())
            }
        }
    }
}

#if DEBUG
struct FormTypeGroupCloud_Previews: PreviewProvider {

    private static let items: [String] = [
        "44", "Very different view", "44.5", "45", "45.5",
        "37-38", "XS", "S", "M", "L",
        "XL", "XXL", "XXXL"
    ]

    static var previews: some View {
        VStack {
            FormTypeGroupCloud(numberOfItems: self.items.count) { index in
                Text(self.items[index]).lineLimit(1)
            }
            Text("_____________")
            FormTypeGroupCloud(items: self.items.map {
                Text($0)
                    .padding(4)
                    .background(Color.green)
            })
        }
        .inAllModes(stylist: .defaultStylist, darkModeStylist: .darkModeStylist)
    }
}
#endif
