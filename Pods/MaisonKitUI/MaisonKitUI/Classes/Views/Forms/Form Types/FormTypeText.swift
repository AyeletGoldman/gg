// Copyright © 2023 LVMH. All rights reserved.

import Foundation
import SwiftUI
import StylableSwiftUI

/// A form type for inputting text in either single or multi-line form.
public struct FormTypeText: View {

    @Binding private var value: String
    private let multiline: Bool
    private let placeholder: String?
    private let subtitle: String?
    private let icon: ImageSource?

    /// Creates a new `FormTypeText` with the given parameters.
    /// Use this form type to allow the user to enter text information into the form.
    /// If you require a different keyboard type, you should use the `.keyboardType(type: UIKeyboardType)` modifier
    /// to modify this view.
    /// - Parameters:
    ///   - value: The binding to the string value that will contain the data that is typed in.
    ///   - multiline: A boolean that indicates whether or not this field should be a multi-line field. Defaults to `false`.
    ///   - placeholder: Optional. A placeholder text to display on the field. This is shown when the `value` binding's `isEmpty` var returns `true`. Defaults to `nil`.
    ///   - subtitle: Optional. A subtitle to display on the trailing edge of the field.
    ///   - icon: Optional. The source of an image to display as an icon on the trailing edge of the view. If the `value` field is not empty this will
    ///   be internally overridden to be a button with a clear icon.
    public init(value: Binding<String>,
                multiline: Bool = false,
                placeholder: String? = nil,
                subtitle: String? = nil,
                icon: ImageSource? = nil) {
        self._value = value
        self.multiline = multiline
        self.placeholder = placeholder
        self.subtitle = subtitle
        self.icon = icon
    }

    @ViewBuilder
    private var textfield: some View {
        if self.multiline {
            if #available(iOS 16, *) {
                TextField("", text: self.$value, axis: .vertical)
                    .padding(.horizontal, 2)
                    .style("title")
            } else {
                TextEditor(text: self.$value)
                    .frame(minHeight: 40)
                    .style("title")
            }
        } else {
            TextField("", text: self.$value)
                .padding(.horizontal, 2)
                .style("title")
        }
    }

    public var body: some View {
        StylableGroup("form-type-text") {
            HStack {
                ZStack(alignment: .leading) {
                    self.textfield
                    if let placeholder, self.value.isEmpty {
                        Text(placeholder).style("title").allowsHitTesting(false)
                            .padding(.horizontal, 2)
                    }
                }
                Spacer()
                if let subtitle {
                    Text(subtitle)
                        .style("subtitle")
                }
                if let icon {
                    MaisonKitImage(source: icon)
                        .frame(width: 20, height: 20)
                } else if !self.value.isEmpty {
                    self.clearButton
                }
            }
            .style("background")
        }
    }

    private var clearButton: some View {
        Button(action: { self.value = "" },
               label: {
            MaisonKitImage(source: .styledImage(identifier: "icon-clear"))
                .frame(width: 20, height: 20)
        })
    }
}

#if DEBUG
struct FormTypeText_Previews: PreviewProvider {

    struct ParentView: View {
        @State private var value: String = "Label"
        @State private var value2: String = ""
        @State private var value3: String = "Label + Subtitle"
        @State private var value4: String = "Label + Sub + Icon"
        @State private var value5: String = "Multiline label"

        var body: some View {
            VStack {
                FormTypeText(value: self.$value)
                FormTypeText(value: self.$value2, placeholder: "Placeholder")
                FormTypeText(value: self.$value3, subtitle: "Subtitle")
                FormTypeText(value: self.$value4, subtitle: "Subtitle", icon: .system(name: "star"))
                FormTypeText(value: self.$value5, multiline: true)
            }
        }
    }

    static var previews: some View {
        ParentView()
            .padding()
            .inAllModes(stylist: .defaultStylist, darkModeStylist: .darkModeStylist)
    }
}
#endif
