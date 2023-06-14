// Copyright © 2021 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

private enum Labels {
    // swiftlint:disable line_length
    static let charactersCount = MKLocalizedString("generic-form.field.textarea.characters-count.title",
                                                   comment: "The title for count of characters in textarea generic form field. First placeholder is the current characters count and second is the maximum allowed characters.")
    // swiftlint:enable line_length
}

struct GFTextAreaFieldView: View {

    @Binding private var value: String
    private let config: GFFieldConfiguration
    private let minimumHeight: Double
    private let maximumCharacters: Int?
    /// The height of the text editor, so we can track the height of the content and grow the field if needed
    @State private var textEditorHeight: Double = 20
    /// An ID for the text field, so we can target it when we want to scroll
    @Namespace private var fieldID
    /// The scroll view proxy to be able to scroll
    @Environment(\.scrollViewProxy) private var scrollViewProxy: ScrollViewProxy?
    /// The redaction reasons e.g. if this view is loading we will have a `placeholder` reason
    @Environment(\.redactionReasons) private var redactionReasons: RedactionReasons

    init(value: Binding<String>,
         config: GFFieldConfiguration,
         minimumHeight: Double = 0,
         maximumCharacters: Int? = nil) {
        self._value = value
        self.config = config
        self.minimumHeight = minimumHeight
        self.maximumCharacters = maximumCharacters
    }

    private var isLoading: Bool {
        return self.redactionReasons.contains(.placeholder)
    }

    private var tagData: BadgeViewData? {
        guard self.config.isEditable && !self.value.isEmpty else { return nil }
        guard let maximumCharacters else { return nil }
        let currentLength = self.value.count
        guard (maximumCharacters - currentLength) <= 50 else { return nil }
        return BadgeViewData(title: String(format: Labels.charactersCount, currentLength, maximumCharacters),
                             variant: self.value.count > maximumCharacters ? "alert" : nil)
    }

    var body: some View {
        GFFieldView(title: self.config.title, isRequired: self.config.showRequiredSymbol, tag: self.tagData, content: {
            // Use a ZStack and a hidden text so we can compute the height at runtime
            ZStack {
                self.hiddenTextView
                self.textField
            }
            .onPreferenceChange(MultilineTextFieldHeightKey.self) { height in
                withAnimation(self.textEditorHeight > height ? .easeIn : nil) {
                    self.textEditorHeight = height
                }
            }
        }, accessory: {
            if self.config.shouldShowLockIcon {
                // If the field is locked, we show the lock indicator
                AccessoryViewFactory.lockIcon(isHidden: false)
            }
            if self.config.isEditable && !self.value.isEmpty {
                GFClearFieldButton {
                    self.value = ""
                }
            }
        })
        .wrapToGFField(variant: self.config.getInputVariant(isEmpty: self.value.isEmpty))
        // Set the ID for the whole field so we can scroll to it
        .id(self.fieldID)
        .onChange(of: self.value) { _ in
            // When the text changes, we scroll the view to the bottom
            self.scrollViewProxy?.scrollTo(self.fieldID, anchor: .bottom)
        }
    }

    private var hiddenTextView: some View {
        Text(self.value)
            .style("title")
            .background(GeometryReader {
                Color.clear.preference(key: MultilineTextFieldHeightKey.self,
                                       value: $0.frame(in: .local).size.height)
            })
            .hidden()
    }

    private var textField: some View {
        // If we are loading, because `TextEditor` doesn't support redactions
        // we swap the editor with a regular `Text` with the same content as the
        // text field and same styling so that we can get a nice redacted loading state
        ZStack {
            Text(self.value)
                .hidden(!self.isLoading)
            MultilineTextField(self.config.placeholder,
                               minimumHeight: self.config.isReadOnly ? 0 : self.minimumHeight,
                               text: self.$value)
            .hidden(self.isLoading)
        }
        .style("title")
        .disabled(!self.config.isEditable)
        .frame(height: max(self.minimumHeight, self.textEditorHeight))
        .onTapGesture {
            if !self.config.isEditable { return }
            // Wait for the keyboard to appear, then animate the view scrolling
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                withAnimation {
                    self.scrollViewProxy?.scrollTo(self.fieldID, anchor: .bottom)
                }
            }
        }
    }
}

private struct MultilineTextFieldHeightKey: PreferenceKey {
    static var defaultValue: CGFloat { 0 }
    static func reduce(value: inout Value, nextValue: () -> Value) {
        // we add + 5 because we want to make sure that the text view is
        // larger than its content so that the text view's scroll view is never
        // triggered
        value += nextValue() + 5
    }
}
