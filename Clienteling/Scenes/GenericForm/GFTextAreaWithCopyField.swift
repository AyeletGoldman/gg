//
//  GFTextAreaWithCopyField.swift
//  Kenzo Clienteling
//
//  Created by ba-link on 11/01/2023.
//
import SwiftUI
import StylableSwiftUI
import MaisonKit

struct GFTextAreaFieldWithCopyView: View {

    @Binding private var value: String
    private let config: GFFieldConfiguration
    private let minimumHeight: Double
    private let isCopyable: Bool
    /// The height of the text editor, so we can track the height of the content and grow the field if needed
    @State private var textEditorHeight: Double = 20
    /// An ID for the text field, so we can target it when we want to scroll
    @Namespace private var fieldID
    /// The scroll view proxy to be able to scroll
    @Environment(\.scrollViewProxy) private var scrollViewProxy: ScrollViewProxy?
    /// The redaction reasons e.g. if this view is loading we will have a `placeholder` reason
    @Environment(\.redactionReasons) private var redactionReasons: RedactionReasons

    init(value: Binding<String>, config: GFFieldConfiguration, minimumHeight: Double = 0, isCopyable: Bool = false) {
        self._value = value
        self.config = config
        self.minimumHeight = minimumHeight
        self.isCopyable = isCopyable
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

    private var isLoading: Bool {
        return self.redactionReasons.contains(.placeholder)
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
        .padding(.top, 4)
        .padding(.bottom, -4)
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

    var body: some View {
        GFFieldView(title: self.config.title, isRequired: self.config.showRequiredSymbol, content: {
            // Use a ZStack and a hidden text so we can compute the height at runtime
            ZStack {
                self.hiddenTextView
                self.textField
            }
            .onPreferenceChange(MultilineTextFieldHeightKey.self) { self.textEditorHeight = $0 }
        }, accessory: {
            if self.config.shouldShowLockIcon {
                // If the field is locked, we show the lock indicator
                AccessoryViewFactory.lockIcon(isHidden: false)
            }
            if self.config.isReadOnly && self.isCopyable {
                self.buildCopyButton()
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
    
    private func buildCopyButton() -> some View {
        Button(action: {
            self.copyHandler()
        }, label: {
            MaisonKitImage(source: .styledImage(identifier: "icon-copy"))
                .frame(width: 20, height: 20)
        }).buttonStyle(PlainButtonStyle())
    }

    private func copyHandler() {
        UIPasteboard.general.copyToPasteboard(self.value, toastMessage: UIPasteboard.Labels.valueCopiedGenericString)
    }

}

struct ScrollProxy: EnvironmentKey {
    static var defaultValue: ScrollViewProxy?
}

extension EnvironmentValues {
    var scrollViewProxy: ScrollViewProxy? {
        get {
            return self[ScrollProxy.self]
        }
        set {
            self[ScrollProxy.self] = newValue
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

extension View {
    func hidden(_ isHidden: Bool) -> some View {
        self.opacity(isHidden ? 0 : 1)
    }
}
