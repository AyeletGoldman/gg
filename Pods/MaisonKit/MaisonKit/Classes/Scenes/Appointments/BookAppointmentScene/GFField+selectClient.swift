// Copyright © 2022 LVMH. All rights reserved.

import Foundation

extension GFField {
    static func selectClient(fieldTitle: String,
                             searchPageTitle: String,
                             clientName: String,
                             placeHolder: String = "",
                             onSelect: @escaping (SelectedClient?) -> Void) -> GFField {
        return .text(title: fieldTitle,
                     value: clientName,
                     placeHolder: placeHolder,
                     actionType: .routeDescriptorProvider(routeDescriptorFactory: { onDone in
            SelectClientRouteDescriptor(title: searchPageTitle, onDismiss: { controller in
                onDone?(controller)
            }, onDone: { controller, selectedClient in
                onSelect(selectedClient)
                onDone?(controller)
            })
        }, preferredPresentationStyle: .modal))
    }
}
