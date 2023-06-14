// Copyright © 2021 LVMH. All rights reserved.

import SwiftUI

extension Localization.Keys {
    static let picklistDoneButtonTitle = MKLocalizedString("generic-form.field.picklist.done-button",
                                                           comment: "Done button title in the nested picklist field page")
}

public extension GFField {

    /// Creates generic form single selection field with loading options status
    /// - Parameters:
    ///   - title: The field title
    ///   - placeHolder: The placeholder to show
    ///   - items: The picklist options to show when tapping on the field
    ///   - validator: An optional validation to know whether the filed is valid
    ///   - editMode: The field edit mode
    ///   - keyPath: The data object key path the field value should be taken from
    /// - Returns: Generic form field with the single selection configuration
    static func singleSelection(title: String,
                                placeHolder: String = "",
                                items: PicklistOptionsStatus,
                                validator: Validation<SelectionListItem?>? = nil,
                                editMode: GFFieldEditMode = .editable,
                                keyPath: WritableKeyPath<Object, SelectionListItem?>) -> GFField {
        let validationClosure = Self.buildValidationClosure(for: validator, keyPath: keyPath)
        return GFField(validationClosure: validationClosure) { (object, isReadOnly, actionTypeFactory: @escaping ((ActionType) -> Void)) -> GFPicklistFieldView in
            return GFPicklistFieldView(config: GFFieldConfiguration(title: title,
                                                                    placeholder: placeHolder,
                                                                    showRequiredSymbol: validator?.showIndicator ?? false,
                                                                    editMode: items.getFieldEditMode(editMode: editMode),
                                                                    isReadOnly: isReadOnly),
                                       valueLabel: object.wrappedValue[keyPath: keyPath]?.title,
                                       items: items,
                                       presentNestedSelectionList: {
                if case .found(let picklistOptions) = items {
                    actionTypeFactory(.routeDescriptorProvider(routeDescriptorFactory: { onDone in
                        return Self.getSingleSelectionListDescriptor(
                            title: title,
                            items: picklistOptions,
                            selectedItemId: object[dynamicMember: keyPath].getSingleSelectionValue(items: picklistOptions),
                            onDone: onDone) },
                                                               preferredPresentationStyle: .modal))
                }
            })
        }
    }

    /// Creates generic form single selection field
    /// - Parameters:
    ///   - title: The field title
    ///   - placeHolder: The placeholder to show
    ///   - items: The picklist options to show when tapping on the field
    ///   - validator: An optional validation to know whether the filed is valid
    ///   - editMode: The field edit mode
    ///   - keyPath: The data object key path the field value should be taken from
    /// - Returns: Generic form field with the single selection configuration
    static func singleSelection(title: String,
                                placeHolder: String = "",
                                items: [SelectionListItem],
                                validator: Validation<SelectionListItem?>? = nil,
                                editMode: GFFieldEditMode = .editable,
                                keyPath: WritableKeyPath<Object, SelectionListItem?>) -> GFField {
        return Self.singleSelection(title: title,
                                    placeHolder: placeHolder,
                                    items: .found(items),
                                    validator: validator,
                                    editMode: editMode,
                                    keyPath: keyPath)
    }

    private static func getSingleSelectionListDescriptor(title: String,
                                                         items: [SelectionListItem],
                                                         selectedItemId: Binding<String?>,
                                                         onDone: OnDoneClosure) -> RouteDescriptor {
        return SingleSelectionListRouteDescriptor(
            items: items,
            selection: selectedItemId.wrappedValue,
            title: title,
            onDismiss: onDone,
            doneButtonTitle: Localization.Keys.picklistDoneButtonTitle,
            onDone: { controllerToDismiss, selection in
                selectedItemId.wrappedValue = selection
                onDone?(controllerToDismiss)
            },
            shouldShowToolbar: true)
    }
}

private extension Binding where Value == SelectionListItem? {
    func getSingleSelectionValue(items: [SelectionListItem]) -> Binding<String?> {
        return Binding<String?> { () -> String? in
            return self.wrappedValue?.id
        } set: { (newValue: String?) in
            self.wrappedValue = items.first { $0.id == newValue }
        }
    }
}

public extension Validation where T == SelectionListItem? {
    /// Single selection field required validation
    static let required = Validation(closure: { item in return item != nil },
                                     showIndicator: true)
}
