// Copyright © 2021 LVMH. All rights reserved.

import Foundation
import Combine

/// A namespace used to give access to MaisonKit own user defaults
extension UserDefaults {

    /// Returns a decoded object associated with the specified key.
    /// - Parameter forKey: the key to retrieve from user defaults
    /// - Returns: a value that was previously saved via `saveValue`, or `nil` if the type of the value cannot be decoded
    /// or the value that corresponds to the key is not `Data` so it can be decoded.
    func retrieveValue<T: Codable>(forKey: String) -> T? {
        guard let jsonData = UserDefaults.standard.data(forKey: forKey) else {
            return nil
        }
        return try? JSONDecoder().decode(T.self, from: jsonData)
    }

    /// Sets the object value associated with the specified key, value can be nil.
    /// - Parameters:
    ///   - value: The value to store in `UserDefaults`. If `nil` is passed, this function does nothing.
    ///   - forKey: the key to use to store the value.
    func saveValue<T: Codable>(_ value: T?, forKey: String) {
        guard let value = value else {
            return
        }

        guard let jsonData = try? JSONEncoder().encode(value) else {
            return
        }
        UserDefaults.standard.setValue(jsonData, forKey: forKey)
    }
}
