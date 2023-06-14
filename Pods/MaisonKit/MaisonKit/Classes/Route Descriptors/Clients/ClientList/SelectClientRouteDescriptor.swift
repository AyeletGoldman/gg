//  Copyright © 2022 LVMH. All rights reserved.

import Foundation
import StylableSwiftUI

public struct SelectClientRouteDescriptor: RouteDescriptor {
    public static let identifier: Identifier = "SelectClientRouteDescriptor"

    public let stylistSection: StylistIdentifier?
    public let onDone: (UIViewController, SelectedClient?) -> Void
    public let title: String
    public let onDismiss: (UIViewController) -> Void

    public init(title: String,
                stylistSection: StylistIdentifier? = nil,
                onDismiss: @escaping (UIViewController) -> Void,
                onDone: @escaping (UIViewController, SelectedClient?) -> Void) {
        self.onDone = onDone
        self.stylistSection = stylistSection
        self.title = title
        self.onDismiss = onDismiss
    }
}
