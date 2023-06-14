// Copyright © 2021 LVMH. All rights reserved.

import SwiftUI

public extension GFField {

    /// Creates generic form multiple selection field
    /// - Parameters:
    ///   - title: The field title
    ///   - placeHolder: The placeholder to show
    ///   - items: The picklist options to show when tapping on the field
    ///   - validator: An optional validation to know whether the filed is valid
    ///   - editMode: The field edit mode
    ///   - keyPath: The data object key path the field value should be taken from
    /// - Returns: Generic form field with the multiple selection configuration
    static func multipleSelection(title: String,
                                  placeHolder: String = "",
                                  items: PicklistOptionsStatus,
                                  validator: Validation<[SelectionListItem]>? = nil,
                                  editMode: GFFieldEditMode = .editable,
                                  keyPath: WritableKeyPath<Object, [SelectionListItem]>) -> GFField {
        let validationClosure = Self.buildValidationClosure(for: validator, keyPath: keyPath)
        return GFField(validationClosure: validationClosure) { (object, isReadOnly, actionTypeFactory: @escaping ((ActionType) -> Void)) -> GFPicklistFieldView in
            let selectedLabels = object.wrappedValue[keyPath: keyPath].map { $0.title }
            return GFPicklistFieldView(config: GFFieldConfiguration(title: title,
                                                                    placeholder: placeHolder,
                                                                    showRequiredSymbol: validator?.showIndicator ?? false,
                                                                    editMode: items.getFieldEditMode(editMode: editMode),
                                                                    isReadOnly: isReadOnly),
                                       valueLabel: selectedLabels.isEmpty ? nil : selectedLabels.joined(separator: ", "),
                                       items: items,
                                       presentNestedSelectionList: {
                if case .found(let picklistOptions) = items {
                    actionTypeFactory(.routeDescriptorProvider(routeDescriptorFactory: { onDone in
                        let descriptor = Self.getMultipleSelectionListDescriptor(
                            title: title,
                            items: picklistOptions,
                            selectedItemIds: object[dynamicMember: keyPath].getMultipleSelectionValue(items: picklistOptions),
                            onDone: onDone)
                        return descriptor
                    }, preferredPresentationStyle: .modal))
                }
            })
        }
    }

    /// Creates generic form multiple selection field
    /// - Parameters:
    ///   - title: The field title
    ///   - placeHolder: The placeholder to show
    ///   - items: The picklist options to show when tapping on the field
    ///   - validator: An optional validation to know whether the filed is valid
    ///   - editMode: The field edit mode
    ///   - keyPath: The data object key path the field value should be taken from
    /// - Returns: Generic form field with the multiple selection configuration
    static func multipleSelection(title: String,
                                  placeHolder: String = "",
                                  items: [SelectionListItem],
                                  validator: Validation<[SelectionListItem]>? = nil,
                                  editMode: GFFieldEditMode = .editable,
                                  keyPath: WritableKeyPath<Object, [SelectionListItem]>) -> GFField {
        return Self.multipleSelection(title: title,
                                      placeHolder: placeHolder,
                                      items: .found(items),
                                      validator: validator,
                                      editMode: editMode,
                                      keyPath: keyPath)
    }

    private static func getMultipleSelectionListDescriptor(title: String,
                                                           items: [SelectionListItem],
                                                           selectedItemIds: Binding<Set<String>>,
                                                           onDone: OnDoneClosure) -> RouteDescriptor {
        return MultipleSelectionListRouteDescriptor(
            items: items,
            selection: selectedItemIds.wrappedValue,
            title: title,
            onDismiss: onDone,
            doneButtonTitle: Localization.Keys.picklistDoneButtonTitle,
            onDone: { controllerToDismiss, selection in
                selectedItemIds.wrappedValue = selection
                onDone?(controllerToDismiss)
            },
            shouldShowToolbar: true)
    }
}

private extension Binding where Value == [SelectionListItem] {
    func getMultipleSelectionValue(items: [SelectionListItem]) -> Binding<Set<String>> {
        return Binding<Set<String>> { () -> Set<String> in
            return Set(self.wrappedValue.map { $0.id })
        } set: { (newValue: Set<String>) in
            self.wrappedValue = items.filter { newValue.contains($0.id) }
        }
    }
}

public extension Validation where T == [SelectionListItem] {
    /// Multiple selection field required validation
    static let required = Validation(closure: { items in return !items.isEmpty },
                                     showIndicator: true)
}
