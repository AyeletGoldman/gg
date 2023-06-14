// Copyright © 2021 LVMH. All rights reserved.

import Foundation
import StylableSwiftUI

/// A protocol to define any item that can be shown in an instruction screen
public protocol InstructionItemDisplayable {

    /// Retrieves the icon identifier to be shown for this instruction
    /// - Returns: a `StylistIdentifier` to fetch the icon
    func getIcon() -> StylistIdentifier
    /// Retrieves the title to be shown for this instruction
    /// - Returns: a `String`, localized, to be shown as the title for this instruction
    func getTitle() -> String
    /// Retrieves the subtitle to be shown for this instruction
    /// - Returns: Returns the subtitle to use in this item in the instruction list, if any. By default this will return `nil`.
    func getSubtitle() -> String?
}

public extension InstructionItemDisplayable {
    /// Default implementation of the `getSubtitle` protocol function. Returns `nil`.
    /// - Returns: `nil`
    func getSubtitle() -> String? {
        return nil
    }
}

/// OutreachInstructionsDisplayable holds the instructions related to an outreach
public struct InstructionsDisplayable {

    /// The title related to an outreach type
    public let title: String

    /// The different instructions related to a specific outreach
    public let instructions: [InstructionItemDisplayable]

    /// Creates an instance of `InstructionsDisplayable`
    /// - Parameters:
    ///   - title: Title of the instructions box
    ///   - instructions: Array of instuctions to be displayed
    public init(title: String, instructions: [InstructionItemDisplayable]) {
        self.title = title
        self.instructions = instructions
    }
}
