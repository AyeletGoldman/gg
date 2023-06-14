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

extension Moya.Response {

    // Simple type
    func mkMap<D: Decodable>(_ type: D.Type,
                             atKeyPath keyPath: String? = nil,
                             using decoder: JSONDecoder = JSONDecoder(),
                             failsOnEmptyData: Bool = true) throws -> D {
        try self.map(type, atKeyPath: keyPath, using: decoder, failsOnEmptyData: failsOnEmptyData)
    }

    // Array type
    func mkMap<D: Decodable>(_ type: [D].Type,
                             atKeyPath keyPath: String? = nil,
                             using decoder: JSONDecoder = JSONDecoder(),
                             failsOnEmptyData: Bool = true) throws -> [D] {
        try self.map([OptionalDecodeObject<D>].self, atKeyPath: keyPath, using: decoder, failsOnEmptyData: failsOnEmptyData)
            .compactMap(\.value)
    }

    // Dictionary with an array value
    func mkMap<D: Decodable>(_ type: [String: [D]].Type,
                             atKeyPath keyPath: String? = nil,
                             using decoder: JSONDecoder = JSONDecoder(),
                             failsOnEmptyData: Bool = true) throws -> [String: [D]] {
        try self.map([String: [OptionalDecodeObject<D>]].self, atKeyPath: keyPath, using: decoder, failsOnEmptyData: failsOnEmptyData)
            .mapValues { $0.compactMap(\.value) }
    }
}
