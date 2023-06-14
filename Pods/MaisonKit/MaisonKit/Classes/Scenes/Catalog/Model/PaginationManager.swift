// Copyright © 2021 LVMH. All rights reserved.

import Foundation
import Combine

final class PaginationManager {
    /// The current page to request for the product list
    private(set) var currentPageIndex = CurrentValueSubject<Int, Never>(0)

    func fetchNextPageIfNeeded(currentPageIndex: Int) {
        guard currentPageIndex == self.currentPageIndex.value else {
            return
        }
        self.currentPageIndex.send(currentPageIndex + 1)
    }

    func resetPagination() {
        self.currentPageIndex = CurrentValueSubject(0)
    }
}
