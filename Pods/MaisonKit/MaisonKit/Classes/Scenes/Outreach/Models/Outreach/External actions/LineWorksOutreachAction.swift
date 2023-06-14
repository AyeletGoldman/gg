// Copyright © 2021 LVMH. All rights reserved.

import Foundation

enum LineWorksOutreachError: Error {
    case couldNotOpenURL(message: String, recipient: String)
}

final class LineWorksOutreachAction: OutreachExternalAction {

    static var isAvailable: Bool {
        guard let url = URL(string: "lineworks://") else {
            return false
        }
        return UIApplication.shared.canOpenURL(url)
    }

    static func openAppStoreLink() {
        UIApplication.shared.open(URL(string: "itms-apps://apple.com/app/id1012129122")!,
                                  options: [:],
                                  completionHandler: nil)
    }

    func perform(withMessage outreachMessage: OutreachMessage) {
        guard let url = self.getURLToOpen(with: outreachMessage.message, recipient: outreachMessage.recipient) else {
            outreachMessage.callback(.failure(LineWorksOutreachError.couldNotOpenURL(message: outreachMessage.message,
                                                                                    recipient: outreachMessage.recipient)))
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

    private func getURLToOpen(with message: String, recipient: String) -> URL? {
        if let lineWorksURL = self.buildLineWorksUniversalLinkURL(with: message, recipient: recipient),
            UIApplication.shared.canOpenURL(lineWorksURL) {
            return lineWorksURL
        } else if let lineWorksDeepLinkURL = self.buildLineWorksDeepLinkURL(with: message, recipient: recipient),
            UIApplication.shared.canOpenURL(lineWorksDeepLinkURL) {
            return lineWorksDeepLinkURL
        }
        return nil
    }

    private func buildLineWorksUniversalLinkURL(with message: String, recipient: String) -> URL? {
        return self.buildURL(scheme: "https", host: "line.worksmobile.com", path: "/message/send", recipient: recipient, message: message, version: "18")
    }

    // Be sure to include LineWorks URL scheme in your application's Info.plist under LSApplicationQueriesSchemes key if
    // you want to determine whether LineWorks is installed on the user’s iPhone using -[UIApplication canOpenURL:].
    private func buildLineWorksDeepLinkURL(with message: String, recipient: String) -> URL? {
        return self.buildURL(scheme: "lineworks", host: "message", path: "/send", recipient: recipient, message: message, version: "15")
    }

    // Builds:
    // - lineworks://message/send?version=15&message=Hello%2C%20World!
    // - https://line.worksmobile.com/message/send?version=15&message=Hello%2C%20World!&emailsList=
    private func buildURL(scheme: String,
                          host: String,
                          path: String,
                          recipient: String? = nil,
                          message: String,
                          version: String) -> URL? {
        var components = URLComponents()
        components.scheme = scheme
        components.host = host
        components.path = path
        components.queryItems = [URLQueryItem(name: "version", value: version), URLQueryItem(name: "message", value: message), URLQueryItem(name: "emailList", value: recipient)]
        return components.url
    }
}
