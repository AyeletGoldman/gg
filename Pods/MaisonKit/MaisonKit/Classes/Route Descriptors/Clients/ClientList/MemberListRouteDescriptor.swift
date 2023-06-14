// Copyright © 2021 LVMH. All rights reserved.

import Foundation

public struct MemberListRouteDescriptor: RouteDescriptor {
    public static var identifier: Identifier = "MemberListRouteDescriptor"

    /// The list ID for the list that we are displaying
    public let listId: String

    /// A list type, ususally used for analytics
    public let listType: String

    /// A closure invoked when the list is deleted
    public let onDeleted: ((UIViewController) -> Void)?

    /// Creates a new `MemberListRouteDescriptor`
    /// - Parameters:
    ///   - listId: The list ID for the list that we are displaying
    ///   - listType: A list type, ususally used for analytics
    ///   - onDeleted: A closure invoked when the list is deleted
    public init(listId: String, listType: String, onDeleted: ((UIViewController) -> Void)?) {
        self.listId = listId
        self.listType = listType
        self.onDeleted = onDeleted
    }
}
