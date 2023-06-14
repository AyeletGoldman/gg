// Copyright © 2023 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

/// Every Form Field has the same exact architecture. It is made up of three main components:
/// Form Field Title (optional)
/// Form Field Type (required)
/// Form Field Message (optional)
public struct FormField<Content: View>: View {

    private let title: String?
    private let showRequiredIndicator: Bool
    private let tag: String?
    private let message: String?
    private let state: FormFieldState?
    private let padding: EdgeInsets
    private let showDivider: Bool
    private let content: Content

    /// Creates a new `FormField` with the given properties and a view for content
    /// - Parameters:
    ///   - title: Optional. The title of the form field. This is displayed above the content in a `title` style. Defaults to `nil`.
    ///   - showRequiredIndicator: Whether to show the required indicator. If there is no title, the value passed in here does not get used.
    ///   - tag: Optional. A tag to display on the trailing end of the title row. Defaults to `nil`.
    ///   - state: A variant to apply to the `form-field` identifier. MaisonKitUI ships with the default available states but you can pass your own if you want.
    ///   - message: Optional. This is displayed below the content. Defaults to `nil`.
    ///   - padding: The padding you want to have wrapping the content of the form. Defaults to `10` on all edges.
    ///   - showDivider: Whether or not to show a divider after this field. Defaults to `true` you might want to hide the divider if this is the last field in your form.
    ///   - content: The form field type this field wraps.
    public init(title: String? = nil,
                showRequiredIndicator: Bool = false,
                tag: String? = nil,
                state: FormFieldState? = nil,
                message: String? = nil,
                padding: EdgeInsets = EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10),
                showDivider: Bool = true,
                content: Content) {
        self.title = title
        self.showRequiredIndicator = showRequiredIndicator
        self.tag = tag
        self.state = state
        self.message = message
        self.padding = padding
        self.showDivider = showDivider
        self.content = content
    }

    /// Creates a new `FormField` with the given properties and a closure that takes no parameters and returns a view for content
    /// - Parameters:
    ///   - title: Optional. The title of the form field. This is displayed above the content in a `title` style. Defaults to `nil`.
    ///   - showRequiredIndicator: Whether to show the required indicator. If there is no title, the value passed in here does not get used.
    ///   - tag: Optional. A tag to display on the trailing end of the title row. Defaults to `nil`.
    ///   - state: A variant to apply to the `form-field` identifier. MaisonKitUI ships with the default available states but you can pass your own if you want.
    ///   - message: Optional. This is displayed below the content. Defaults to `nil`.
    ///   - padding: The padding you want to have wrapping the content of the form. Defaults to `10` on all edges.
    ///   - showDivider: Whether or not to show a divider after this field. Defaults to `true` you might want to hide the divider if this is the last field in your form.
    ///   - content: A closure that will return the form field type this field wraps.
    public init(title: String? = nil,
                showRequiredIndicator: Bool = false,
                tag: String? = nil,
                state: FormFieldState? = nil,
                message: String? = nil,
                padding: EdgeInsets = EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10),
                showDivider: Bool = true,
                @ViewBuilder content: () -> Content) {
        self.title = title
        self.showRequiredIndicator = showRequiredIndicator
        self.tag = tag
        self.state = state
        self.message = message
        self.padding = padding
        self.showDivider = showDivider
        self.content = content()
    }

    public var body: some View {
        StylableGroup(StylistIdentifier.buildFullIdentifier(for: "form-field", variant: self.state)) {
            VStack(spacing: 0) {
                VStack(alignment: .leading, spacing: 2) {
                    self.buildTitleField()
                        .padding(.leading, self.padding.leading)
                        .padding(.trailing, self.padding.trailing)
                    self.content
                        .frame(maxWidth: .infinity)
                    if let message {
                        StylableGroup("form-field-message") {
                            Text(message)
                                .style("title")
                        }
                        .padding(.leading, self.padding.leading)
                        .padding(.trailing, self.padding.trailing)
                    }
                }
                .padding(.top, self.padding.top)
                .padding(.bottom, self.padding.bottom)
                Divider(variant: "full").opacity(self.showDivider ? 1 : 0)
            }.style("background")
        }
    }

    @ViewBuilder
    private func buildTitleField() -> some View {
        if self.title != nil || self.tag != nil {
            StylableGroup("form-field-title") {
                HStack(spacing: 2) {
                    if let title {
                        self.buildTitle(title)
                    }
                    Spacer()
                    if let tag {
                        Tag(title: tag).tagStyle(.secondary)
                    }
                }
            }
        }
    }

    @ViewBuilder
    private func buildTitle(_ title: String) -> some View {
        Text(title).style("title")
        if self.showRequiredIndicator {
            RequiredFieldIndicator()
        }
    }
}

#if DEBUG
struct FormField_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            FormField {
                Text("Hello")
            }
            FormField(title: "Title", showRequiredIndicator: true, content: {
                Text("Hello")
            })
            FormField(message: "Message", content: {
                Text("Hello")
            })
            FormField(title: "Title", showRequiredIndicator: true, tag: "TAG", message: "Message", content: {
                Text("Hello")
            })
        }
        .inAllModes(stylist: .defaultStylist, darkModeStylist: .darkModeStylist)
    }
}
#endif
