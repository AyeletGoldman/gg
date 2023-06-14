// Copyright © 2020 LVMH. All rights reserved.

import Foundation

final class RecentSearchesPerformer {

    private let cacheObjectId: String
    private(set) var recentSearches: [String] = []

    init(cacheObjectId: String) {
        self.cacheObjectId = cacheObjectId
        self.recentSearches = self.getRecentSearches()
    }

    private func getRecentSearches() -> [String] {
        let recentSearches: [String]? = CacheObject.getCacheJson(by: self.cacheObjectId)
        return recentSearches ?? []
    }

    func resetRecentSearches() {
        CacheObject.upsertCacheObject(id: self.cacheObjectId, data: [String]())
        self.recentSearches = []
    }

    func addToRecentSearches(text: String) {
        guard !text.isEmpty else { return }
        var searches = self.recentSearches.filter { $0 != text }
        searches.insert(text, at: 0)
        searches = Array(searches.prefix(5))
        CacheObject.upsertCacheObject(id: self.cacheObjectId, data: searches)
        self.recentSearches = searches
    }
}
