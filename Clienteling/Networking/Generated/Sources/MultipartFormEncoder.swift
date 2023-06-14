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
import Moya

public final class MultipartFormEncoder {
    public private(set) var formData: [MultipartFormData] = []

    /// By default, `.iso8601`.
    public var dateEncodingStrategy: DateEncodingStrategy = .iso8601

    /// The strategy to use for encoding `Date` values.
    public enum DateEncodingStrategy {
        /// Encode the `Date` as an ISO-8601-formatted string (in RFC 3339 format).
        case iso8601

        /// Encode the `Date` as a UNIX timestamp (as a JSON number).
        case secondsSince1970

        /// Encode the `Date` as UNIX millisecond timestamp (as a JSON number).
        case millisecondsSince1970

        /// Encode the `Date` as a string formatted by the given formatter.
        case formatted(DateFormatter)

        /// Encode the `Date` as a custom value encoded by the given closure.
        ///
        /// If the closure fails to encode a value into the given encoder, the encoder will encode an empty automatic container in its place.
        case custom((Date) -> String)
    }

    public init() { }

    /// Encodes value for the given key.
    @discardableResult
    public func encode<T: Encodable>(_ value: T, forKey key: String) -> Self {
        let encoder = _MultipartFormEncoder(encoder: self)
        do {
            try [key: value].encode(to: encoder)
        } catch {
            // Assume that encoding to String never fails
            assertionFailure("Form encoding failed with an error: \(error)")
        }
        return self
    }

    public static func encode<T: Encodable>(_ body: T) -> MultipartFormEncoder {
        let encoder = MultipartFormEncoder()
        encoder.encode(body, forKey: "value")
        return encoder
    }
}

private extension MultipartFormEncoder {
    func encodeNil(forKey codingPath: [CodingKey]) throws {
        // Do nothing
    }

    func encode(_ value: String, forKey codingPath: [CodingKey]) throws {
        try append(value.asUTF8Data(codingPath: codingPath), forKey: codingPath)
    }

    func encode(_ value: Bool, forKey codingPath: [CodingKey]) throws {
        let val = try (value ? "true" : "false").asUTF8Data(codingPath: codingPath)
        append(val, forKey: codingPath)
    }

    func encode(_ value: Int, forKey codingPath: [CodingKey]) throws {
        try append(String(value).asUTF8Data(codingPath: codingPath), forKey: codingPath)
    }

    func encode(_ value: Int8, forKey codingPath: [CodingKey]) throws {
        try append(String(value).asUTF8Data(codingPath: codingPath), forKey: codingPath)
    }

    func encode(_ value: Int16, forKey codingPath: [CodingKey]) throws {
        try append(String(value).asUTF8Data(codingPath: codingPath), forKey: codingPath)
    }

    func encode(_ value: Int32, forKey codingPath: [CodingKey]) throws {
        try append(String(value).asUTF8Data(codingPath: codingPath), forKey: codingPath)
    }

    func encode(_ value: Int64, forKey codingPath: [CodingKey]) throws {
        try append(String(value).asUTF8Data(codingPath: codingPath), forKey: codingPath)
    }

    func encode(_ value: UInt, forKey codingPath: [CodingKey]) throws {
        try append(String(value).asUTF8Data(codingPath: codingPath), forKey: codingPath)
    }

    func encode(_ value: UInt8, forKey codingPath: [CodingKey]) throws {
        try append(String(value).asUTF8Data(codingPath: codingPath), forKey: codingPath)
    }

    func encode(_ value: UInt16, forKey codingPath: [CodingKey]) throws {
        try append(String(value).asUTF8Data(codingPath: codingPath), forKey: codingPath)
    }

    func encode(_ value: UInt32, forKey codingPath: [CodingKey]) throws {
        try append(String(value).asUTF8Data(codingPath: codingPath), forKey: codingPath)
    }

    func encode(_ value: UInt64, forKey codingPath: [CodingKey]) throws {
        try append(String(value).asUTF8Data(codingPath: codingPath), forKey: codingPath)
    }

    func encode(_ value: Double, forKey codingPath: [CodingKey]) throws {
        try append(String(value).asUTF8Data(codingPath: codingPath), forKey: codingPath)
    }

    func encode(_ value: Float, forKey codingPath: [CodingKey]) throws {
        try append(String(value).asUTF8Data(codingPath: codingPath), forKey: codingPath)
    }

    func encode(_ value: URL, forKey codingPath: [CodingKey]) throws {
        try append(value.absoluteString.asUTF8Data(codingPath: codingPath), forKey: codingPath)
    }

    func encode(_ value: Date, forKey codingPath: [CodingKey]) throws {
        let string: String
        switch dateEncodingStrategy {
        case .iso8601: string = iso8601Formatter.string(from: value)
        case .secondsSince1970: string = String(value.timeIntervalSince1970)
        case .millisecondsSince1970: string = String(Int(value.timeIntervalSince1970 * 1000))
        case .formatted(let formatter): string = formatter.string(from: value)
        case .custom(let closure): string = closure(value)
        }
        try append(string.asUTF8Data(codingPath: codingPath), forKey: codingPath)
    }

    func encode(_ value: Data, forKey codingPath: [CodingKey]) throws {
        append(value, forKey: codingPath)
    }

    func encode(_ value: FileUpload, forKey codingPath: [CodingKey]) throws {
        append(value.data, forKey: codingPath, filename: value.fileName, mimeType: value.mimeType)
    }

    func encodeEncodable<T: Encodable>(_ value: T, forKey codingPath: [CodingKey]) throws {
        switch value {
        case let value as String: try encode(value, forKey: codingPath)
        case let value as Bool: try encode(value, forKey: codingPath)
        case let value as Int: try encode(value, forKey: codingPath)
        case let value as Int8: try encode(value, forKey: codingPath)
        case let value as Int16: try encode(value, forKey: codingPath)
        case let value as Int32: try encode(value, forKey: codingPath)
        case let value as Int64: try encode(value, forKey: codingPath)
        case let value as UInt: try encode(value, forKey: codingPath)
        case let value as UInt8: try encode(value, forKey: codingPath)
        case let value as UInt16: try encode(value, forKey: codingPath)
        case let value as UInt32: try encode(value, forKey: codingPath)
        case let value as UInt64: try encode(value, forKey: codingPath)
        case let value as Double: try encode(value, forKey: codingPath)
        case let value as Float: try encode(value, forKey: codingPath)
        case let value as Date: try encode(value, forKey: codingPath)
        case let value as URL: try encode(value, forKey: codingPath)
        case let value as Data: try encode(value, forKey: codingPath)
        case let value as FileUpload: try encode(value, forKey: codingPath)
        case let value: try value.encode(to: _MultipartFormEncoder(encoder: self, codingPath: codingPath))
        }
    }

    // TODO: refactor
    func append(_ value: Data, forKey codingPath: [CodingKey], filename: String? = nil, mimeType: String? = nil) {
        if codingPath.isEmpty {
            return // Should never happen
        }
        let formData = MultipartFormData(provider: .data(value), name: codingPath.last!.stringValue, fileName: filename, mimeType: mimeType)
        self.formData.append(formData)
    }
}

private struct _MultipartFormEncoder: Encoder {
    let encoder: MultipartFormEncoder
    var codingPath: [CodingKey] = []
    var userInfo: [CodingUserInfoKey : Any] { return [:] }

    func container<Key>(keyedBy type: Key.Type) -> KeyedEncodingContainer<Key> where Key : CodingKey {
        KeyedEncodingContainer(KeyedContainer<Key>(encoder: encoder, codingPath: codingPath))
    }

    func unkeyedContainer() -> UnkeyedEncodingContainer {
        UnkeyedContanier(encoder: encoder, codingPath: codingPath)
    }

    func singleValueContainer() -> SingleValueEncodingContainer {
        SingleValueContanier(encoder: encoder, codingPath: codingPath)
    }
}

private struct KeyedContainer<Key: CodingKey>: KeyedEncodingContainerProtocol {
    let encoder: MultipartFormEncoder
    let codingPath: [CodingKey]

    func encode<T>(_ value: T, forKey key: Key) throws where T : Encodable {
        try encoder.encodeEncodable(value, forKey: codingPath + [key])
    }

    func encodeNil(forKey key: Key) throws {
        try encoder.encodeNil(forKey: codingPath + [key])
    }

    func nestedContainer<NestedKey>(keyedBy keyType: NestedKey.Type, forKey key: Key) -> KeyedEncodingContainer<NestedKey> where NestedKey : CodingKey {
        assertionFailure("URLQueryEncoder doesn't support nested objects")
        return KeyedEncodingContainer(KeyedContainer<NestedKey>(encoder: encoder, codingPath: codingPath + [key]))
    }

    func nestedUnkeyedContainer(forKey key: Key) -> UnkeyedEncodingContainer {
        assertionFailure("URLQueryEncoder doesn't support nested objects")
        return UnkeyedContanier(encoder: encoder, codingPath: codingPath + [key])
    }

    func superEncoder() -> Encoder {
        assertionFailure("URLQueryEncoder doesn't support nested objects")
        return _MultipartFormEncoder(encoder: encoder, codingPath: codingPath)
    }

    func superEncoder(forKey key: Key) -> Encoder {
        assertionFailure("URLQueryEncoder doesn't support nested objects")
        return _MultipartFormEncoder(encoder: encoder, codingPath: codingPath + [key])
    }
}

private final class UnkeyedContanier: UnkeyedEncodingContainer {
    var encoder: MultipartFormEncoder
    var codingPath: [CodingKey]

    private(set) var count = 0

    init(encoder: MultipartFormEncoder, codingPath: [CodingKey]) {
        self.encoder = encoder
        self.codingPath = codingPath
    }

    func encodeNil() throws {
        try encoder.encodeNil(forKey: codingPath)
        count += 1
    }

    func encode<T>(_ value: T) throws where T: Encodable {
        try encoder.encodeEncodable(value, forKey: codingPath)
        count += 1
    }

    func nestedContainer<NestedKey>(keyedBy keyType: NestedKey.Type) -> KeyedEncodingContainer<NestedKey> where NestedKey : CodingKey {
        assertionFailure("URLQueryEncoder doesn't support nested objects")
        return KeyedEncodingContainer(KeyedContainer<NestedKey>(encoder: encoder, codingPath: codingPath))
    }

    func nestedUnkeyedContainer() -> UnkeyedEncodingContainer {
        assertionFailure("URLQueryEncoder doesn't support nested objects")
        return self
    }

    func superEncoder() -> Encoder {
        assertionFailure("URLQueryEncoder doesn't support nested objects")
        return _MultipartFormEncoder(encoder: encoder, codingPath: codingPath)
    }
}

private struct SingleValueContanier: SingleValueEncodingContainer {
    let encoder: MultipartFormEncoder
    var codingPath: [CodingKey]

    init(encoder: MultipartFormEncoder, codingPath: [CodingKey]) {
        self.encoder = encoder
        self.codingPath = codingPath
    }

    mutating func encodeNil() throws {
        try encoder.encodeNil(forKey: codingPath)
    }

    mutating func encode<T>(_ value: T) throws where T : Encodable {
        try encoder.encodeEncodable(value, forKey: codingPath)
    }
}

private extension String {

    func asUTF8Data(codingPath: [CodingKey]) throws -> Data {
        guard let data = self.data(using: .utf8) else {
            throw EncodingError.invalidValue(self,
                                             EncodingError.Context(codingPath: codingPath,
                                                                   debugDescription: "Could not encode \(self) as Data using .utf8",
                                                                   underlyingError: nil))
        }
        return data
    }
}

private let iso8601Formatter = ISO8601DateFormatter()
