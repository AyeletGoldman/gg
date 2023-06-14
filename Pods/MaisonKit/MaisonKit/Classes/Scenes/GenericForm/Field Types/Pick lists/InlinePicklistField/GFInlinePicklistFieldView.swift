// Copyright © 2022 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

struct GFInlinePicklistFieldView: View {

    private let config: GFFieldConfiguration
    @Binding private var value: SelectionListItem?
    @Binding private var values: [SelectionListItem]
    private let isMultiSelect: Bool
    private let items: PicklistOptionsStatus
    @State private var isExpanded: Bool = false

    init(config: GFFieldConfiguration,
         value: Binding<SelectionListItem?>,
         items: PicklistOptionsStatus) {
        self.config = config
        self._value = value
        self._values = .constant([])
        self.items = items
        self.isMultiSelect = false
    }

    init(config: GFFieldConfiguration,
         value: Binding<[SelectionListItem]>,
         items: PicklistOptionsStatus) {
        self.config = config
        self._values = value
        self._value = .constant(nil)
        self.items = items
        self.isMultiSelect = true
    }

    private var shouldShowEdit: Bool {
        return (self.items.isSuccess || self.items.isWaiting) &&
        !self.config.isReadOnly &&
        self.config.editMode != .locked
    }

    private var shouldShowRetryButton: Bool {
        return self.items.retryAction != nil
    }

    private var editButtonType: AccessoryViewFactory.ButtonType {
        if !self.isMultiSelect && self.isExpanded && self.value != nil {
            return .clear
        } else {
            return self.isExpanded ? .done : .edit
        }
    }

    var body: some View {
        GFFieldView(title: self.config.title, isRequired: self.config.showRequiredSymbol, content: {
            if self.isExpanded {
                self.buildExpandedContent()
            } else {
                self.buildCollapsedContent()
            }
        }, accessory: {
            // If we are in editing mode, we show an edit button
            AccessoryViewFactory.editOrDoneOrClearButton(
                buttonType: self.editButtonType,
                action: { withAnimation {
                    if self.editButtonType == .clear {
                        self.value = nil
                    }
                    self.isExpanded.toggle()

                } },
                isDisabled: self.items.isWaiting,
                isHidden: !self.shouldShowEdit)

            if !self.isExpanded {
                // If we are loading, we should a loading view
                AccessoryViewFactory.loadingView(isHidden: !self.items.isLoading)
                // If there was an error, we show a retry button
                AccessoryViewFactory.retryButton(action: self.items.retryAction ?? { }, isHidden: !self.shouldShowRetryButton)
                // If the field is locked, we show the lock indicator
                AccessoryViewFactory.lockIcon(isHidden: !self.config.shouldShowLockIcon)
            }
        })
        .wrapToGFField(variant: self.config.getInputVariant(isEmpty: self.isMultiSelect ? (self.values.isEmpty && !self.isExpanded) : (self.value == nil && !self.isExpanded),
                                                            hasError: self.items.isFailed))
        .onChange(of: self.items.isSuccess) { hasSuccessItems in
            if !hasSuccessItems {
                self.isExpanded = false
            }
        }
    }

    func buildCollapsedContent() -> some View {
        let title = self.isMultiSelect ? self.values.map { $0.title }.joined(separator: ", ") : self.value?.title ?? ""
        return Text(verbatim: title)
            .placeHolder(Text(self.items.errorDescription ?? self.config.placeholder),
                         shouldShow: self.isMultiSelect ? self.values.isEmpty : self.value == nil)
            .style("title")
    }

    @ViewBuilder
    func buildExpandedContent() -> some View {
        if let options = self.items.value {
            VStack(alignment: .leading, spacing: 8) {
                ForEach(options) { option in
                    Text(option.title)
                        .style("title")
                        .modifier(ListItemSelectionModifier(selected: self.isMultiSelect ? self.values.contains(option) : option == self.value,
                                                            selectionStyle: self.isMultiSelect ? .multiple : .single))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .contentShape(Rectangle()) // So the full row will be tappable
                        .onTapGesture {
                            if self.isMultiSelect {
                                self.values.appendOrRemove(element: option)
                            } else {
                                self.value = option
                                self.collapse()
                            }
                        }
                }
            }
        }
    }

    private func collapse() {
        withAnimation {
            self.isExpanded = false
        }
    }
}

private extension AccessoryViewFactory {
    private enum Labels {
        static let editButtonTitle = MKLocalizedString("generic-form.field.inline-picklist.edit-button.title",
                                                       comment: "The title for edit button in inline picklist generic form field")
        static let doneButtonTitle = MKLocalizedString("generic-form.field.inline-picklist.done-button.title",
                                                       comment: "The title for done button in inline picklist generic form field")
        static let clearButtonTitle = MKLocalizedString("generic-form.field.inline-picklist.clear-button.title",
                                                         comment: "The title for clear button in inline picklist generic form field")
    }

    enum ButtonType {
        case edit
        case done
        case clear

        var title: String {
            switch self {
            case .edit: return Labels.editButtonTitle
            case .done: return Labels.doneButtonTitle
            case .clear: return Labels.clearButtonTitle
            }
        }
    }

    @ViewBuilder
    static func editOrDoneOrClearButton(buttonType: ButtonType,
                                        action: @escaping () -> Void,
                                        isDisabled: Bool,
                                        isHidden: Bool) -> some View {
        Button(action: action, label: {
            Text(verbatim: buttonType.title)
        })
        .disabled(isDisabled)
        .hidden(isHidden)
    }
}
