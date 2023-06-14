// Copyright © 2021 LVMH. All rights reserved.

import Foundation

/// Holds all the informations for the Instructions scene
public struct InstructionsData {
    let outreachType: OutreachType
    let assetURLs: [URL]
    let template: Template?
    let clientId: String
    let recipient: String?
    let subject: String
    let message: String
    let urlOpener: URLOpener
    let onDone: OutreachCallback

    /// Creates an instance of `InstructionsData`
    /// - Parameters:
    ///   - outreachType: The type of the outreach
    ///   - assetURLs: The assets to share
    ///   - template: The template selected
    ///   - clientId: The id of the client to reach
    ///   - recipient: The recipient used to reach the client
    ///   - subject: The subject of the message
    ///   - message: The content of the message
    ///   - urlOpener: Object to open the different external apps
    ///   - onDone: Closure invoked when the oureach will finished
    public init(outreachType: OutreachType,
                assetURLs: [URL],
                template: Template?,
                clientId: String,
                recipient: String?,
                subject: String,
                message: String,
                urlOpener: URLOpener,
                onDone: @escaping OutreachCallback) {
        self.outreachType = outreachType
        self.assetURLs = assetURLs
        self.template = template
        self.clientId = clientId
        self.recipient = recipient
        self.subject = subject
        self.message = message
        self.urlOpener = urlOpener
        self.onDone = onDone
    }
}
