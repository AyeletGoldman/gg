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

extension KeyedDecodingContainer {

    // Simple type
    func mkDecode<T>(_ type: T.Type, forKey key: KeyedDecodingContainer<K>.Key) throws -> T where T: Decodable {
        try self.decode(T.self, forKey: key)
    }

    // Simple type
    func mkDecodeIfPresent<T>(_ type: T.Type, forKey key: KeyedDecodingContainer<K>.Key) throws -> T? where T: Decodable {
        try self.decodeIfPresent(T.self, forKey: key)
    }

    // Array type
    func mkDecode<T>(_ type: [T].Type, forKey key: KeyedDecodingContainer<K>.Key) throws -> [T] where T: Decodable {
        try self.decode([OptionalDecodeObject<T>].self, forKey: key).compactMap(\.value)
    }

    // Array type
    func mkDecodeIfPresent<T>(_ type: [T].Type, forKey key: KeyedDecodingContainer<K>.Key) throws -> [T]? where T: Decodable {
        try self.decodeIfPresent([OptionalDecodeObject<T>].self, forKey: key)?.compactMap(\.value)
    }

    // Dictionary with an array value
    func mkDecode<T>(_ type: [String: [T]].Type, forKey key: KeyedDecodingContainer<K>.Key) throws -> [String: [T]] where T: Decodable {
        try self.decode([String: [OptionalDecodeObject<T>]].self, forKey: key).mapValues { $0.compactMap(\.value) }
    }

    // Dictionary with an array value
    func mkDecodeIfPresent<T>(_ type: [String: [T]].Type, forKey key: KeyedDecodingContainer<K>.Key) throws -> [String: [T]]? where T: Decodable {
        try self.decodeIfPresent([String: [OptionalDecodeObject<T>]].self, forKey: key)?.mapValues { $0.compactMap(\.value) }
    }

}
