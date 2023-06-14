// Copyright © 2021 LVMH. All rights reserved.

import Foundation

/// The route descriptor for the instruction scene
public struct InstructionsRouteDescriptor: RouteDescriptor {
    public static let identifier: Identifier = "InstructionsRouteDescriptor"

    /// Data to be displayed in the scene or used for the outreach
    public let instructionsData: InstructionsData

    /// Creates an instance of `InstructionsRouteDescriptor`.
    /// - Parameter instructionsData: Data to be displayed in the scene or used for the outreach.
    public init(instructionsData: InstructionsData) {
        self.instructionsData = instructionsData
    }
}
