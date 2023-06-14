// Copyright © 2021 LVMH. All rights reserved.

import Foundation

enum LineOutreachError: Error {
    case couldNotOpenURL(message: String)
}

final class LineOutreachAction: OutreachExternalAction {

    static var isAvailable: Bool {
        guard let url = URL(string: "line://send") else {
            return false
        }
        return UIApplication.shared.canOpenURL(url)
    }

    static func openAppStoreLink() {
        UIApplication.shared.open(URL(string: "itms-apps://apple.com/app/id443904275")!,
                                  options: [:],
                                  completionHandler: nil)
    }

    func perform(withMessage outreachMessage: OutreachMessage) {
        guard let url = self.getURLToOpen(with: outreachMessage.message) else {
            outreachMessage.callback(.failure(LineOutreachError.couldNotOpenURL(message: outreachMessage.message)))
            return
        }
        UIApplication.shared.open(url,
                                  options: [:]) { success in
            if success {
                outreachMessage.callback(.success)
            } else {
                outreachMessage.callback(.failure(nil))
            }
        }
    }

    private func getURLToOpen(with message: String) -> URL? {
        if let lineURL = self.buildLineUniversalLinkURL(with: message),
            UIApplication.shared.canOpenURL(lineURL) {
            return lineURL
        }
        return nil
    }

    // Builds a universal link
    // See: https://developers.line.biz/en/docs/messaging-api/using-line-url-scheme/#sending-text-messages
    // eg https://line.me/R/msg/text/?{text_message}
    // Line doesn't support sending messages to regular accounts (only LINE Official Accounts).
    // So we open the share sheet that then the user can select the recipient.
    private func buildLineUniversalLinkURL(with message: String) -> URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "line.me"
        components.path = "/R/msg/text/"
        components.query = message
        return components.url
    }
}
