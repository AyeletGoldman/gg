// Copyright © 2020 LVMH. All rights reserved.

import Foundation

struct Config: Decodable {
    private enum Keys: String {
        case maison =  "MAISON"
        case returnURL = "RETURN_URL"
        case authURL = "AUTH_URL"
        case tokenURL = "TOKEN_URL"
        case clientId = "CLIENT_ID"
        case clientSecret = "CLIENT_SECRET"
        case urlScheme = "URL_SCHEME"
        case environment = "ENVIRONMENT"
    }

    enum Error: Swift.Error {
        case missingKey, invalidValue
    }

    private func value<T>(for key: Keys) -> T where T: LosslessStringConvertible {
        guard let object = Bundle.main.object(forInfoDictionaryKey: key.rawValue) else {
            fatalError("Key \(key.rawValue) not found in Info.plist")
        }

        switch object {
        case let value as T:
            return value
        case let string as String:
            guard let value = T(string) else { fallthrough }
            return value
        default:
            fatalError("Key's \(key.rawValue) value \(object) not convertible to string")
        }
    }

    var maison: String { return self.value(for: Keys.maison) }
    var returnURL: String { return self.value(for: Keys.returnURL) }
    var authURL: String { return self.value(for: Keys.authURL) }
    var tokenURL: String { return self.value(for: Keys.tokenURL) }
    var clientId: String { return self.value(for: Keys.clientId) }
    var clientSecret: String { return self.value(for: Keys.clientSecret) }
    var urlScheme: String { return self.value(for: Keys.urlScheme) }
    var environment: String { return self.value(for: Keys.environment) }

    static let `default` = Config()
}
