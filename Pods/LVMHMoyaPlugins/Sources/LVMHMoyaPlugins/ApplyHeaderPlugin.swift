//
//  Copyright © 2019 LVMH. All rights reserved.
//

import Foundation

import Moya

/// Applies a header value to a request.
///
/// If the request already has that header, it will be replaced.
///
/// Examples:
///
/// 1. Apply a constant header value to all requests
///
/// ```
/// ApplyHeaderPlugin(key: "x-app-identifier",
///                   value: "MyApp")
/// ```
///
/// 2. Apply a different value to all requests.
///
/// ```
/// ApplyHeaderPlugin(key: "x-trace-token",
///                   value: { UUID().uuidString })
/// ```
///
/// 3. Apply a value to _some_ requests (in this example, requests containing `/secret-api/` in the path).
///
/// ```
/// ApplyHeaderPlugin(key: "x-api-key") { request, target in
///     guard
///         let path = request.url?.absoluteString
///         path.contains("/secret-api/") else {
///             return nil
///     }
///     return "magic-api-code"
/// }
/// ```
///
/// 4. Apply a header, if it doesn't already exist.
///
/// ```
/// ApplyHeaderPlugin(key: "UserAgent") { request, target in
///     guard request.allHTTPHeaderFields?.contains("UserAgent") == false else { return nil }
///     return "MyCustomUserAgent"
/// }
/// ```
///
public final class ApplyHeaderPlugin: PluginType {

    // MARK: Properties

    /// The key to set the header value against i.e. this will be key used in the
    /// `URLResult.allHTTPHeaderFields` dictionary.
    private let key: String

    /// Method to get the value for the header for a specific request / target
    private let value: (URLRequest, TargetType) -> String?

    // MARK: Initialisation

    /// - parameter key: The header name (i.e. `x-api-key`)
    /// - parameter value: The value to set for that key (Returning `nil` won't apply the header to this request)
    public init<T: TargetType>(key: String, value: @escaping (URLRequest, T) -> String?) {
        self.key = key
        self.value = { request, target in
            guard let target = target as? T else { return nil }
            return value(request, target)
        }
    }

    /// - parameter key: The header name (i.e. `x-api-key`)
    /// - parameter value: The value to set for that key (Returning `nil` won't apply the header to this request)
    public init(key: String, value: @escaping () -> String?) {
        self.key = key
        self.value = { _, _ in value() }
    }

    /// Use this to create an instance which applies the same value to each request.
    ///
    /// - parameter key: The header name (i.e. `x-api-key`)
    /// - parameter value: The value to set for that key (Passing in `nil` won't apply the header to this request)
    public init(key: String, value: String?) {
        self.key = key
        self.value = { _, _ in value }
    }

    // MARK: PluginType methods

    public func prepare(_ request: URLRequest, target: TargetType) -> URLRequest {

        guard let value = self.value(request, target) else { return request }

        var headers = request.allHTTPHeaderFields ?? [:]
        headers[self.key] = value

        var request = request
        request.allHTTPHeaderFields = headers
        return request
    }
}
