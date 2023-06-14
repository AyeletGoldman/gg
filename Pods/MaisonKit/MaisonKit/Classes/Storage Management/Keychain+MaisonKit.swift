// Copyright © 2020 LVMH. All rights reserved.

import Foundation
import KeychainAccess

private extension String {
    /// MaisonKit's keychain user key
    static let userKeychainKey = "fr.lvmh.userKeychainKey"
}

extension Keychain {
    /// A keychain service for use in MaisonKit.
    static let maisonKit = Keychain(service: "fr.lvmh.maison-kit")
}

/// A namespace to model the user's journey from logged out to fully authenticated.
public struct MaisonKitUser { }

/// Extension to deal with saving and loading from the keychain
private extension MaisonKitUser {
    /// Stores the authenticated user in the keychain.
    /// - Parameter user: the user to store in the keychain
    static func store(user: User) {
        guard let tokenJSON = try? JSONEncoder().encode(user) else {
            return
        }

        try? Keychain.maisonKit.set(tokenJSON, key: .userKeychainKey)
    }

    /// Retrieve the authenticated user from the keychain.
    /// - Returns: the user from the keychain, if there was one
    static func retrieve() -> User? {
        guard let jsonData = try? Keychain.maisonKit.getData(.userKeychainKey) else {
            return nil
        }

        return try? JSONDecoder().decode(User.self, from: jsonData)
    }

    /// Clears the user from from the keychain
    static func clear() {
        Keychain.maisonKit[.userKeychainKey] = nil
    }
}

// MARK: - Convenience
public extension MaisonKitUser {
    /// The currently logged in user, if available.
    static var currentLoggedInUser: User? {
        get {
            return self.retrieve()
        }
        set {
            if let user = newValue {
                self.store(user: user)
            } else {
                self.clear()
            }
        }
    }

    /// Checks whether or not there is a valid user logged in
    static var isLoggedIn: Bool {
        return self.currentLoggedInUser != nil
    }
}
