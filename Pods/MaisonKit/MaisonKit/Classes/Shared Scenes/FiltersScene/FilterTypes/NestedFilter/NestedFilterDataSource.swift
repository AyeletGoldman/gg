// Copyright © 2022 LVMH. All rights reserved.

import Foundation
import SwiftUI
import Combine

struct NestedFilterDataSource {

    let filterItems: [SelectionListItem]
    @Binding var selectedItemIds: [String] {
        didSet {
            if selectedItemIdsSubject.value != Set(self.selectedItemIds) {
                self.selectedItemIdsSubject.send(Set(self.selectedItemIds))
            }
        }
    }
    let totalItemsPublisher: AnyPublisher<ResultState<String, ErrorDisplayable>, Never>?

    private let selectedItemIdsSubject = CurrentValueSubject<Set<String>, Never>(Set())

    init(filterItems: [SelectionListItem],
         selectedItemIds: Binding<[String]>,
         totalItems: AnyPublisher<ResultState<String, ErrorDisplayable>, Never>) {
        self.filterItems = filterItems
        self._selectedItemIds = selectedItemIds
        self.totalItemsPublisher = totalItems

        self.selectedItemIdsSubject.send(Set(self.selectedItemIds))
    }
}

extension NestedFilterDataSource: SelectionListDataSource {

    func onSelectionChange(selection: Set<String>) {
        if selection != Set(self.selectedItemIds) {
            self.selectedItemIds = Array(selection)
        }
    }

    var items: [SelectionListItem] {
        self.filterItems
    }

    var selectionPublisher: AnyPublisher<Set<String>, Never> {
        self.selectedItemIdsSubject.eraseToAnyPublisher()
    }

}
