/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.
///
/// Clienteling APIs
/// Clienteling APIs.
/// Version: v1

import Foundation
import Alamofire
import Moya

extension URLQueryEncoder: ParameterEncoding {
    public func encode(_ urlRequest: URLRequestConvertible, with parameters: Parameters?) throws -> URLRequest {
        var req = try urlRequest.asURLRequest()
        guard let url = req.url, var components = URLComponents(url: url, resolvingAgainstBaseURL: true) else { return req }
        let myPercentEncodedQuery = self.items.compactMap {
            guard let key = $0.0.addingPercentEncoding(withAllowedCharacters: .afURLQueryAllowed) else { return nil }
            guard let value = $0.1?.addingPercentEncoding(withAllowedCharacters: .afURLQueryAllowed) else { return nil }
            return String([key, value].joined(separator: "="))
        }.joined(separator: "&")
        let percentEncodedQuery = (components.query.map { $0 + "&" } ?? "") + myPercentEncodedQuery
        components.percentEncodedQuery = percentEncodedQuery
        req.url = components.url
        return req
    }
}


// MARK: - [URLQueryItem] to [String: Any]

extension Array where Element == URLQueryItem {
    func toDictionary() -> [String: Any] {
        var dictionary = [String: Any]()
        for queryItem in self {
            guard let value = queryItem.value?.toCorrectType() else { continue }
            if queryItem.name.contains("[]") {
                let key = queryItem.name.replacingOccurrences(of: "[]", with: "")
                let array = dictionary[key] as? [Any] ?? []
                dictionary[key] = array + [value]
            } else {
                dictionary[queryItem.name] = value
            }
        }
        return dictionary
    }
}

extension String {

    // MARK: - String to [URLQueryItem]

    func toURLQueryItems() -> [URLQueryItem]? {
        guard let urlString = self.removingPercentEncoding, let url = URL(string: urlString) else { return nil }
        if let querItems = url.toQueryItems() { return querItems }
        var urlComponents = URLComponents()
        urlComponents.query = urlString
        return urlComponents.queryItems
    }

    // MARK: - attempt to cast string to correct type (int, bool...)

    func toCorrectType() -> Any {
        let types: [LosslessStringConvertible.Type] = [Bool.self, Int.self, Double.self]
        func cast<T>(to: T) -> Any? { return (to.self as? LosslessStringConvertible.Type)?.init(self) }
        for type in types { if let value = cast(to: type) { return value } }
        return self
    }
}

// MARK: - URL to [URLQueryItem]

extension URL {
    func toQueryItems() -> [URLQueryItem]? { return URLComponents(url: self, resolvingAgainstBaseURL: false)?.queryItems }
}

// MARK: - create [URLQueryItem] from [AnyHashable: Any] or [any]

extension URLQueryItem {
    private static var _bracketsString: String { return "[]" }
    static func create(from values: [Any], with key: String) -> [URLQueryItem] {
        let _key = key.contains(_bracketsString) ? key : key + _bracketsString
        return values.compactMap { value -> URLQueryItem? in
            if value is [Any] || value is [AnyHashable: Any] { return nil }
            return URLQueryItem(name: _key, value: value as? String ?? "\(value)")
        }
    }

    static func create(from values: [AnyHashable: Any]) -> [URLQueryItem] {
        return values.flatMap { element -> [URLQueryItem] in
            if element.value is [AnyHashable: Any] { return [] }
            let key = element.key as? String ?? "String"
            if let values = element.value as? [Any] { return URLQueryItem.create(from: values, with: key) }
            return [URLQueryItem(name: key, value: element.value as? String ?? "\(element.value)")]
        }
    }
}

 // MARK: - [AnyHashable: Any] to [URLQueryItem]

extension Dictionary where Value: Any {
    func toURLQueryItems() -> [URLQueryItem] { return URLQueryItem.create(from: self) }
}
