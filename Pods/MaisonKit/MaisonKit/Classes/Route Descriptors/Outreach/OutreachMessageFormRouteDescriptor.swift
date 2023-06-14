// Copyright © 2021 LVMH. All rights reserved.

import Foundation

/// The route descriptor for the template selection scene.
public struct OutreachMessageFormRouteDescriptor: RouteDescriptor {
    public static let identifier: Identifier = "OutreachMessageFormRouteDescriptor"

    /// The type of the outreach
    public let outreachType: OutreachType
    /// The assets to share
    public let assetURLs: [URL]
    /// The id of the client to reach
    public let clientId: String
    /// The recipient to reach, might be nil
    public let recipient: String?
    /// The template selected, might be nil
    public let template: Template?
    /// A validator for the message that will be written, might be nil
    public let validator: OutreachValidator?
    /// Closure invoked when the outreach will finish
    public let onDone: OutreachResultClosure

    /// Creates an instance of `OutreachMessageFormRouteDescriptor
    /// - Parameters:
    ///   - outreachType: The type of the outreach
    ///   - assetURLs: The assets to share
    ///   - clientId: The id of the client to reach
    ///   - recipient: The recipient to reach, might be nil
    ///   - template: The template selected, might be nil
    ///   - validator: A validator for the message that will be written, might be nil
    ///   - onDone: Closure invoked when the outreach will finish
    public init(outreachType: OutreachType,
                assetURLs: [URL],
                clientId: String,
                recipient: String?,
                template: Template?,
                validator: OutreachValidator?,
                onDone: @escaping OutreachResultClosure) {
        self.outreachType = outreachType
        self.assetURLs = assetURLs
        self.clientId = clientId
        self.recipient = recipient
        self.onDone = onDone
        self.validator = validator
        self.template = template
    }
}
