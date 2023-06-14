// Copyright © 2021 LVMH. All rights reserved.

import StylableSwiftUI

extension StylableViewController {
    func addMenuItemsBarButtonIfNeeded(actions: [MenuAction],
                                       imageIdentifier: StylistIdentifier = "icon-more",
                                       handleActionTypeAction: @escaping (MenuAction) -> Void) {
        let menuItems: [UIAction] = actions
            .filter { $0.isEnabled }
            .map { action in
                let image = action.imageIdentifier.map { self.stylist.uiImage(for: $0) } ?? nil
                return UIAction(title: action.localizedTitle, image: image) { _ in
                    handleActionTypeAction(action)
                }
            }
        guard !menuItems.isEmpty else { return }
        let menu = UIMenu(children: menuItems)
        self.setRightBarButtonItems(items: [
            UIBarButtonItem(title: nil,
                            image: self.stylist.uiImage(for: imageIdentifier),
                            primaryAction: nil,
                            menu: menu)
        ])
    }
}
