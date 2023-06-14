// Copyright © 2023 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

/// The form selection row
public struct FormTypeSelect: View {

    @Environment(\.isEnabled) private var isEnabled
    @Environment(\.formTypeSelectStyle) private var style

    private let title: String
    private let isSelected: Bool
    private let subtitle: String?
    private let image: (any View)?
    private let badge: String?
    private let tag: (any View)?
    private let onTap: () -> Void

    /// Creates a new `FormTypeSelect` instance
    /// - Parameters:
    ///   - title: the row title
    ///   - isSelected: whether the row is selected or not
    ///   - subtitle: the row title
    ///   - image: optional. an image to show leading to the title
    ///   - badge: optional. a badge to show next to the title
    ///   - tag: the tag view builder to show at the row traling
    ///   - onTap: a closure to invoke when this raw is tapped
    public init(title: String,
                isSelected: Bool,
                subtitle: String? = nil,
                image: ImageSource? = nil,
                badge: String? = nil,
                tag: (any View)? = nil,
                onTap: @escaping () -> Void) {
        self.title = title
        self.isSelected = isSelected
        self.subtitle = subtitle
        self.image = image.map { MaisonKitImage(source: $0) }
        self.badge = badge
        self.tag = tag
        self.onTap = onTap
    }

    /// Creates a new `FormTypeSelect` instance
    /// - Parameters:
    ///   - title: the row title
    ///   - isSelected: whether the row is selected or not
    ///   - subtitle: the row title
    ///   - color: color to show leading to the title
    ///   - badge: optional. a badge to show next to the title
    ///   - tag: the tag view builder to show at the row traling
    ///   - onTap: a closure to invoke when this raw is tapped
    public init(title: String,
                isSelected: Bool,
                subtitle: String? = nil,
                color: Color,
                badge: String? = nil,
                tag: (any View)? = nil,
                onTap: @escaping () -> Void) {
        self.title = title
        self.isSelected = isSelected
        self.subtitle = subtitle
        self.image = color
        self.badge = badge
        self.tag = tag
        self.onTap = onTap
    }

    public var body: some View {
        StylableGroup(StylistIdentifier.buildFullIdentifier(for: "form-type-select",
                                                            variant: FormTypeState.state(isEnabled: self.isEnabled,
                                                                                         isSelected: self.isSelected))) {
            Button {
                self.onTap()
            } label: {
                self.style.makeBody(configuration: FormTypeSelectStyleConfiguration(
                    title: self.title,
                    isSelected: self.isSelected,
                    subtitle: self.subtitle,
                    image: self.image,
                    badge: self.badge,
                    tag: self.tag))
                .eraseToAnyView()
                .contentShape(Rectangle())
                .padding(.vertical, 7)
                .style("background")
            }
        }
    }
}

#if DEBUG
struct FormTypeSelect_Previews: PreviewProvider {
    static var previews: some View {
        StylableGroup("form-field") {
            VStack {
                Section("Inline") {
                    FormTypeSelect(title: "Title",
                                   isSelected: false,
                                   subtitle: "Description",
                                   image: .system(name: "star"),
                                   badge: "(1)",
                                   tag: Tag(title: "Tag").tagStyle(.secondary),
                                   onTap: {})
                    FormTypeSelect(title: "Very long title very long title",
                                   isSelected: true,
                                   subtitle: "Description",
                                   image: .system(name: "star"),
                                   badge: "(1)",
                                   tag: Tag(title: "Tag").tagStyle(.secondary),
                                   onTap: {})
                    FormTypeSelect(title: "Very long title very long title",
                                   isSelected: false,
                                   subtitle: "Very long subtitle very long subtitle Very long subtitle very long subtitle",
                                   color: .green,
                                   badge: "(1)",
                                   tag: Tag(title: "Tag").tagStyle(.secondary),
                                   onTap: {})
                    FormTypeSelect(title: "Title",
                                   isSelected: false,
                                   subtitle: "Very long subtitle very long subtitle Very long subtitle very long subtitle",
                                   image: .system(name: "star"),
                                   badge: "(1)",
                                   tag: Tag(title: "Tag").tagStyle(.secondary),
                                   onTap: {})
                    .disabled(true)
                    FormTypeSelect(title: "Title", isSelected: false, onTap: {})
                }
                Section("Stack") {
                    FormTypeSelect(title: "Title",
                                   isSelected: false,
                                   subtitle: "Description",
                                   image: .system(name: "star"),
                                   badge: "(1)",
                                   tag: Tag(title: "Tag").tagStyle(.secondary),
                                   onTap: {})
                    FormTypeSelect(title: "Very long title very long title",
                                   isSelected: false,
                                   subtitle: "Very long subtitle very long subtitle Very long subtitle very long subtitle",
                                   color: .green,
                                   badge: "(1)",
                                   tag: Tag(title: "Tag").tagStyle(.secondary),
                                   onTap: {})
                    FormTypeSelect(title: "Title",
                                   isSelected: false,
                                   subtitle: "Very long subtitle very long subtitle Very long subtitle very long subtitle",
                                   image: .system(name: "star"),
                                   badge: "(1)",
                                   tag: Tag(title: "Tag").tagStyle(.secondary),
                                   onTap: {})
                    .disabled(true)
                    FormTypeSelect(title: "Title",
                                   isSelected: false,
                                   onTap: {})
                }
                .formTypeSelectStyle(.stacked)
            }
        }
        .inAllModes(stylist: .defaultStylist, darkModeStylist: .darkModeStylist)
    }
}
#endif
