// Copyright © 2020 LVMH. All rights reserved.

import Foundation

/// Object used to create an event following an outreach
public struct OutreachInteractionCreation {
    /// ID of the client associated to the outreach
    public let clientId: String
    /// Channel used to communicate
    public let channel: OutreachType
    /// Date of creation of the interaction
    public let date: Date
    /// ID of the advisor associated to the outreach
    public let advisorId: String
    /// Title of the interaction
    public let title: String
    /// ID of the template used for the outreach
    public let templateId: String?

    /// Creates an instance of `OutreachInteractionCreation`
    /// - Parameters:
    ///   - clientId: ID of the client associated to the outreach
    ///   - channel: Channel used to communicate
    ///   - date: Date of creation of the interaction
    ///   - advisorId: ID of the advisor associated to the outreach
    ///   - title: Title of the interaction
    ///   - templateId: ID of the template used for the outreach
    public init(clientId: String,
                channel: OutreachType,
                date: Date = Date(),
                advisorId: String? = nil,
                title: String? = nil,
                templateId: String? = nil) {
        self.clientId = clientId
        self.channel = channel
        self.date = date
        self.advisorId = advisorId ?? MaisonKitUser.currentLoggedInUser!.id
        self.title = title ?? channel.rawValue.capitalized
        self.templateId = templateId
    }
}
