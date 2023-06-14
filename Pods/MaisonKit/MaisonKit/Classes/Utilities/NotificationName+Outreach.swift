// Copyright © 2021 LVMH. All rights reserved.

import Foundation

public extension Notification.Name {
    // swiftlint:disable identifier_name
    /// A notification posted when an outreach is completed
    @available(*, deprecated, message: "Deprecated on version 0.22.0. `outreachCompletedSuccessfullyNotification` is deprecated. Store publishers in your implementation and publish updates to them when required instead.")
    static let outreachCompletedSuccessfullyNotification = Notification.Name(rawValue: "maisonKit.outreachCompletedSuccessfullyNotification")
    // swiftlint:enable identifier_name
}

public extension FlagName {
    // swiftlint:disable identifier_name
    /// A flag to enable the new behaviour of using a publisher in implementation to refresh the timeline when required
    /// This flag will be shipped with a default value of `false` and should be enabled by implementation when they have made the transition.
    @available(*,
                deprecated,
                message: """
Deprecated on version 0.22.0. `enableTimelinePublisherRefreshFromImplementation` is deprecated.
This flag will be removed in an upcoming version of MaisonKit. Update your implementation to store publishers as soon as possible.
""")
    static let enableTimelinePublisherRefreshFromImplementation: FlagName = "enableTimelinePublisherRefreshFromImplementation"
    // swiftlint:enable identifier_name
}
