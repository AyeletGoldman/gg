// Copyright © 2022 LVMH. All rights reserved.

import Foundation

final class ActionSheetViewModel: ObservableObject {

    @Published private(set) var actionSheetContent: ActionSheetContent
    private let onCancel: () -> Void
    private let onSelect: (ActionSheetItem) -> Void

    init(actionSheetContent: ActionSheetContent,
         onCancel: @escaping () -> Void,
         onSelect: @escaping (ActionSheetItem) -> Void) {
        self.actionSheetContent = actionSheetContent
        self.onCancel = onCancel
        self.onSelect = onSelect
    }

    func didTapCancel() {
        self.onCancel()
    }

    func didSelect(_ item: ActionSheetItem) {
        self.onSelect(item)
    }
}
