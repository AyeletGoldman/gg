// Copyright © 2022 LVMH. All rights reserved.

import Foundation

public extension OutreachSelectionEntry {

    private enum Labels {
        static let copyPayByLinkTitle = MKLocalizedString("pay-by-link.confirm-order.action-sheet.copy-button.title",
                                                          comment: "The title for the pay by link confirmation screen")
    }

    static func copyPayByLinkAction(orderID: String) -> OutreachSelectionEntry {
        return .customAction(item: OutreachSelectionItemDisplayable(icon: .styledImage(identifier: "icon-copy"),
                                                                    title: Labels.copyPayByLinkTitle,
                                                                    tag: nil,
                                                                    body: nil,
                                                                    trailingIcon: .styledImage(identifier: "icon-right")),
                             action: .routeDescriptorProvider(routeDescriptorFactory: { onDone in
            return PBLCopyLinkRouteDescriptor(orderId: orderID, onDone: { controller in
                onDone?(controller)
            })
        }))
    }
}
