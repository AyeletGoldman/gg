// Copyright © 2023 LVMH. All rights reserved.

import Foundation
import SwiftUI
import StylableSwiftUI

/// Form Type Groups are - unsurprisingly - useful when you need to group Form Types,
///  like select boxes which belong in the same Form Field. The Type Group also controls if the nested Form Type is a Single Select or Multi Select item.
/// You use the Form Type Group as you would use the Form Type, and then nest the Form Types within it.
/// `FormTypeGroupList` is a convenience for adding a list of items.
/// This type does not make any assumptions on the underlying content of the carousel, it just provides the scaffold for creating a `form-type-group-list`.
public struct FormTypeGroupList<Content: View>: View {

    private let variant: FormTypeGroupSelectionVariant?
    private let content: Content

    /// Creates a new `FormTypeGroupList`. Use this initializer to create the scaffold around a list group type.
    /// - Parameters:
    ///   - variant: a variant to add to the stylist identifier wrappign this component
    ///   - content: the content to display inside the group. Usually, this will be a `ForEach` with a list of items.
    public init(variant: FormTypeGroupSelectionVariant? = nil,
                @ViewBuilder content: () -> Content) {
        self.variant = variant
        self.content = content()
    }

    public var body: some View {
        StylableGroup(StylistIdentifier.buildFullIdentifier(for: "form-type-group-list",
                                                            variant: self.variant)) {
            VStack(spacing: 0) {
                self.content
            }
        }
    }
}

#if DEBUG
struct FormTypeGroupList_Previews: PreviewProvider {

    private static let items: [String] = [
        "44", "44.5", "45", "45.5",
        "37-38", "XS", "S", "M", "L",
        "XL", "XXL", "XXXL"
    ]

    static var previews: some View {
        FormTypeGroupList(variant: nil) {
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
