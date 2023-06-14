// Copyright © 2020 LVMH. All rights reserved.

import Foundation

class ModelUtils {

    // MARK: Json
    static func toJson<IN: Codable>(data: IN) -> String? {
        guard let jsonData = try? JSONEncoder().encode(data) else {
            return nil
        }
        return String(data: jsonData, encoding: .utf8)
    }

    static func fromJson<OUT: Codable>(stringData: String) -> OUT? {
        if let jsonData = stringData.data(using: .utf8) {
            do {
                return try JSONDecoder().decode(OUT.self, from: jsonData)
            } catch { }
        }
        return nil
    }
}
