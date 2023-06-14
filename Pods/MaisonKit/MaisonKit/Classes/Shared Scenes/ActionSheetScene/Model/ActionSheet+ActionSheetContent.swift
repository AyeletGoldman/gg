// Copyright © 2022 LVMH. All rights reserved.

import Foundation
import SwiftUI

public extension ActionSheet {

    /// Creates a new `ActionSheet` with the given `ActionSheetContent`.
    /// Use this function to map from a custom content to a `SwiftUI` `ActionSheet`.
    /// - Parameter content: the content to map to the action sheet. The content's `items` will be mapped to `ActionSheet` `Button`s.
    /// If there is a `cancelItem` it will be mapped to a `Button.cancel`,
    init(content: ActionSheetContent) {
        var buttons = content.items.map { Button.default(Text(verbatim: $0.title), action: $0.action) }
        if let cancelItem = content.cancelItem {
            buttons.append(Button.cancel(Text(verbatim: cancelItem.title), action: cancelItem.action))
        }
        self.init(title: Text(verbatim: content.title),
                  message: content.message.map { Text(verbatim: $0) },
                  buttons: buttons)
    }
}
