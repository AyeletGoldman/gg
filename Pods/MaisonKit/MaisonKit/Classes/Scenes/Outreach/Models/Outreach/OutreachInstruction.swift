// Copyright © 2021 LVMH. All rights reserved.

import Foundation
import StylableSwiftUI

/// The different kind of instructions displayable to the user
public enum OutreachInstructionItem: Int, InstructionItemDisplayable {
    case selectClient
    case pasteMessage
    case insertPhotos

    public func getIcon() -> StylistIdentifier {
        switch self {
        case .selectClient:
            return "icon-lrg-select-clients"
        case .pasteMessage:
            return "icon-lrg-paste-text"
        case .insertPhotos:
            return "icon-lrg-add-photos"
        }
    }

    public func getTitle() -> String {
        switch self {
        case .selectClient:
            return Labels.selectClientTitle
        case .pasteMessage:
            return Labels.pasteMessageTitle
        case .insertPhotos:
            return Labels.insertPhotosTitle
        }
    }

    private enum Labels {
        static let selectClientTitle = MKLocalizedString("outreach.instructions.select-client.title",
                                                 comment: "The label to show in the outreach instructions screen for the action Select client")
        static let pasteMessageTitle = MKLocalizedString("outreach.instructions.paste-message.title",
                                                 comment: "The label to show in the outreach instructions screen for the action Paste message")
        static let insertPhotosTitle = MKLocalizedString("outreach.instructions.insert-photos.title",
                                                 comment: "The label to show in the outreach instructions screen for the action Insert photos")
    }
}

public extension OutreachType {

    /// Returns the instructions needed for a specific outreach
    /// - Parameters:
    ///   - hasImagesToShare: an indication for having an option to download images or not
    /// - Returns: An array of instruction depending on the outreach origin and type
    func getInstructions(hasImagesToShare: Bool) -> [OutreachInstructionItem] {
        if hasImagesToShare {
            switch self {
            case .wechat, .kakao:
                return [.selectClient, .pasteMessage, .insertPhotos]
            case .line, .lineWorks:
                return [.selectClient, .insertPhotos]
            case .whatsapp, .email, .sms:
                return [.insertPhotos]
            default:
                return []
            }
        } else {
            switch self {
            case .wechat, .kakao:
                return [.selectClient, .pasteMessage]
            case .line:
                return [.selectClient]
            default:
                return []
            }
        }
    }
}
