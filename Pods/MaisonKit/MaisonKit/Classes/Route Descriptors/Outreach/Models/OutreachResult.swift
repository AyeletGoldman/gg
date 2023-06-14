// Copyright © 2022 LVMH. All rights reserved.

import Foundation

/// Holds the informations related to result of an outreach
public struct OutreachResult {

    /// The type of the outreach
    public let outreachType: OutreachType

    /// Title used for display
    public let title: String?

    /// The id of the template used
    public let templateId: String?

    /// The name of the template used
    public let templateName: String?

    /// The id of the client reached
    public var clientId: String

    /// The result of the outreach
    public let resultStatus: CancellableResult

    /// Creates an instance of `OutreachResult`
    /// - Parameters:
    ///   - outreachType: The type of the outreach
    ///   - title: Title used for display
    ///   - templateId: The id of the template used
    ///   - templateName: The name of the template used
    ///   - clientId: The id of the client reached
    ///   - resultStatus: The result of the outreach
    public init(outreachType: OutreachType,
                title: String? = nil,
                templateId: String? = nil,
                templateName: String? = nil,
                clientId: String,
                resultStatus: CancellableResult) {
        self.outreachType = outreachType
        self.title = title
        self.templateId = templateId
        self.templateName = templateName
        self.clientId = clientId
        self.resultStatus = resultStatus
    }
}
