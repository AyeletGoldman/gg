//
//  GeneraInfoData.swift
//  Zenith Clienteling Dev
//
//  Created by Noy Barak on 18/01/2022.
//

import MaisonKit

class GeneralInfoData {
    var multiSelectionValues: [String: [SelectionListItem]] = [:]
    var singleSelectionValues: [String: SelectionListItem?] = [:]
    var stringValues: [String: String] = [:]
    var booleanValues: [String: Bool] = [:]
    var dateValues: [String: Date?] = [:]
}

extension GeneralInfoData {
    static func getFields<Object: GeneralInfoData>(typedValues: [TypedValue], data: Object) -> [GFField<Object>] {
        var allFields: [GFField<Object>] = []
        typedValues.forEach { typedValue in
            let field: GFField<Object>? = {
                switch typedValue {
                case .typedValueNumber(let field):
                    data.stringValues[field.apiName] = field.value.map { String(Int($0)) } ?? ""
                    return .textWithCopy(title: MKLocalizedString(field.translationKey ?? "", comment: ""), isCopyable: typedValue.isCopyable, keyPath: \Object.stringValues[field.apiName]!)
                case .typedValueMultiPicklist(let field):
                    let options = field.picklistOptions?.map { SelectionListItem(id: $0.value, title: $0.label) } ?? []
                    let selectedIds = field.value?
                                    .replacingOccurrences(of: "field.emptyValue", with: "")
                                    .components(separatedBy: "; ") ?? []
                    data.multiSelectionValues[field.apiName] = selectedIds.compactMap { selectedId in
                        options.first { $0.id == selectedId }
                    }
                    return .multipleSelection(title: MKLocalizedString(field.translationKey ?? "", comment: ""),
                                              items: options,
                                              validator: nil,
                                              editMode: .editable,
                                              keyPath: \Object.multiSelectionValues[field.apiName]!)
                case .typedValuePicklist(let field):
                    let options = field.picklistOptions?.map { SelectionListItem(id: $0.value, title: $0.label) } ?? []
                    let selectedId = field.value?.replacingOccurrences(of: "field.emptyValue", with: "")
                    data.singleSelectionValues[field.apiName] = options.first { $0.id == selectedId }
                    return .singleSelection(title: MKLocalizedString(field.translationKey ?? "", comment: ""),
                                            items: options,
                                            keyPath: \Object.singleSelectionValues[field.apiName]!)
                case .typedValueText(let field):
                    data.stringValues[field.apiName] = field.value?.replacingOccurrences(of: "field.emptyValue", with: "")
                    return .textAreaWithCopy(title: MKLocalizedString(field.translationKey ?? "", comment: ""),
                                             validator: .required,
                                             editMode: .editable,
                                             isCopyable: typedValue.isCopyable,
                                             keyPath: \Object.stringValues[field.apiName]!)
                case .typedValueDatetime(let field):
                    data.dateValues[field.apiName] = field.value?.value
                    return .date(title: MKLocalizedString(field.translationKey ?? "", comment: ""),
                                 editMode: .editable,
                                 keyPath: \Object.dateValues[field.apiName]!)
                case .typedValueBoolean(let field):
                    data.booleanValues[field.apiName] = field.value ?? false
                    return .toogle(title:  MKLocalizedString(field.translationKey ?? "", comment: ""),
                                   editMode: .editable,
                                   keyPath: \Object.booleanValues[field.apiName]!)
                default:
                    return nil
                }
            }()
            if let field = field {
                allFields.append(field)
            }
        }
        return allFields
    }
}

extension GeneralInfoData {
    func setData(from data: GeneralInfoData) {
        self.booleanValues = data.booleanValues
        self.dateValues = data.dateValues
        self.stringValues = data.stringValues
        self.singleSelectionValues = data.singleSelectionValues
        self.multiSelectionValues = data.multiSelectionValues
    }

    func getDataToSave(keysToRemove: [String]) -> GeneralInfoData {
        let dataToSave = GeneralInfoData()
        dataToSave.setData(from: self)

        dataToSave.multiSelectionValues.keys.forEach { key in
            if keysToRemove.contains(key) {
                dataToSave.multiSelectionValues.removeValue(forKey: key)
            }
        }
        dataToSave.singleSelectionValues.keys.forEach { key in
            if keysToRemove.contains(key) {
                dataToSave.singleSelectionValues.removeValue(forKey: key)
            }
        }
        dataToSave.stringValues.keys.forEach { key in
            if keysToRemove.contains(key) {
                dataToSave.stringValues.removeValue(forKey: key)
            }
        }
        dataToSave.booleanValues.keys.forEach { key in
            if keysToRemove.contains(key) {
                dataToSave.booleanValues.removeValue(forKey: key)
            }
        }
        dataToSave.dateValues.keys.forEach { key in
            if keysToRemove.contains(key) {
                dataToSave.dateValues.removeValue(forKey: key)
            }
        }
        return dataToSave
    }
}
