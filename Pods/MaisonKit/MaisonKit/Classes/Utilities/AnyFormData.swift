// Copyright © 2022 LVMH. All rights reserved.

import Foundation

/// A class that can be used to create a generic form where all data is dynamic, and we don't have a
/// specific class or struct that we want to model. The underlying data store is a dictionary.
@dynamicMemberLookup public struct AnyFormData {

    public subscript(dynamicMember member: String) -> String {
        get { self.data[member] as? String ?? "" }
        set { self.updateValue(newValue.isEmpty ? nil : newValue, forKey: member) }
    }

    public subscript(dynamicMember member: String) -> Date? {
        get { self.data[member] as? Date }
        set { self.updateValue(newValue, forKey: member) }
    }

    public subscript(dynamicMember member: String) -> DateAndSlot? {
        get { self.data[member] as? DateAndSlot }
        set { self.updateValue(newValue, forKey: member) }
    }

    public subscript(dynamicMember member: String) -> Bool {
        get { self.data[member] as? Bool ?? false }
        set { self.updateValue(newValue, forKey: member) }
    }

    public subscript(dynamicMember member: String) -> SelectionListItem? {
        get { self.data[member] as? SelectionListItem }
        set { self.updateValue(newValue, forKey: member) }
    }

    public subscript(dynamicMember member: String) -> [SelectionListItem] {
        get { self.data[member] as? [SelectionListItem] ?? [] }
        set { self.updateValue(newValue, forKey: member) }
    }

    /// The dictionary containing all data in the form
    public private(set) var data = [String: Any?]()
    public private(set) var diff = [String: Any?]()
    private let originalData: [String: Any?]

    /// Creates a new `AnyFormData`
    /// - Parameter data: the initial data to create this form with
    public init(data: [String: Any?]) {
        self.data = data
        self.originalData = data
    }

    mutating public func updateValue<V: Equatable>(_ value: V?, forKey key: String) {
        // Get the value for the key from the dictionary if possible
        if let originalValue = self.originalData[key] as? V {
            if value == originalValue {
                // The value is the same as originally, if it is in the diff, remove it
                self.diff[key] = nil
            } else {
                self.diff.updateValue(value, forKey: key)
            }
        } else {
            // If we are setting the value to nil and it wasnt in the original data then we remove it from the diff, because
            // effectively we are reverting a previous edit
            if value == nil {
                self.diff[key] = nil
            } else {
                // The value was not in the original data or it was a different type, or it is a different value
                // add it to the diff
                self.diff.updateValue(value, forKey: key)
            }
        }
        self.data.updateValue(value, forKey: key)
    }
}

public extension AnyFormData {

    /// Gets all key-value pairs in the data whose values conform to a given type
    /// - Parameter type: the type of data that should be mapped
    /// - Returns: a copy of `self.data` filtering out any values that aren't of type T.
    func getDataOfType<T>(_ type: T.Type) -> [String: T] {
        return self.data.compactMapValues { $0 as? T }
    }

    /// Gets all key-value pairs in the data whose values conform to a given type
    /// - Returns: a copy of `self.data` filtering out any values that aren't of type T.
    func getTypedData<T>() -> [String: T] {
        return self.data.compactMapValues { $0 as? T }
    }

    /// Gets typed value if exists by a given member
    /// - Parameter member: the data key member you want to get the data for.
    /// - Returns: the stored field data if exists.
    func getData<T>(forKey member: String) -> T? {
        self.data[member] as? T
    }
}
