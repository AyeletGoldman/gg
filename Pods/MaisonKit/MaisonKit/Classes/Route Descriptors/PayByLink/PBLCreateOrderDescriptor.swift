// Copyright © 2021 LVMH. All rights reserved.

import Foundation

/// The route descriptor for the pay by link create order screen
public struct PBLCreateOrderDescriptor: RouteDescriptor {
    public static var identifier: Identifier = "PBLCreateOrderDescriptor"

    /// A datasource that contains informations useful to the workflow
    /// like product informations
    public let data: PayByLinkData
    /// The title of the scene. Usually shown in the navigation bar.
    public let title: String
    /// A closure to invoke when the user wants to dismiss the scene
    public let onClose: ((UIViewController) -> Void)?

    public init(data: PayByLinkData,
                title: String,
                onClose: ((UIViewController) -> Void)?) {
        self.data = data
        self.title = title
        self.onClose = onClose
    }
}
