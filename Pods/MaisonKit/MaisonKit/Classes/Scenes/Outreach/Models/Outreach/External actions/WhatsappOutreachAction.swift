// Copyright © 2020 LVMH. All rights reserved.

import Foundation

enum WhatsappOutreachError: Error {
    case couldNotOpenURL(message: String, recipient: String)
}

final class WhatsappOutreachAction: OutreachExternalAction {

    static var isAvailable: Bool {
        guard let url = URL(string: "whatsapp://send") else {
            return false
        }
        return UIApplication.shared.canOpenURL(url)
    }

    static func openAppStoreLink() {
        UIApplication.shared.open(URL(string: "itms-apps://apple.com/app/id310633997")!,
                                  options: [:],
                                  completionHandler: nil)
    }

    func perform(withMessage outreachMessage: OutreachMessage) {
        guard let url = self.getURLToOpen(with: outreachMessage.message, recipient: outreachMessage.recipient) else {
            outreachMessage.callback(.failure(WhatsappOutreachError.couldNotOpenURL(message: outreachMessage.message,
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
        if let whatsAppURL = self.buildWhatsappUniversalLinkURL(with: message, recipient: recipient),
            UIApplication.shared.canOpenURL(whatsAppURL) {
            return whatsAppURL
        } else if let whatsAppDeepLinkURL = self.buildWhatsappDeepLinkURL(with: message, recipient: recipient),
            UIApplication.shared.canOpenURL(whatsAppDeepLinkURL) {
            return whatsAppDeepLinkURL
        }
        return nil
    }

    // eg https://wa.me/15551234567
    private func buildWhatsappUniversalLinkURL(with message: String, recipient: String) -> URL? {
        let cleanedRecipient = self.cleanRecipient(recipient)
        return self.buildURL(scheme: "https", host: "wa.me", recipient: cleanedRecipient, message: message)
    }

    // Be sure to include WhatsApp URL scheme in your application's Info.plist under LSApplicationQueriesSchemes key if
    // you want to determine whether WhatsApp is installed on the user’s iPhone using -[UIApplication canOpenURL:].
    private func buildWhatsappDeepLinkURL(with message: String, recipient: String) -> URL? {
        return self.buildURL(scheme: "whatsapp", host: "send", message: message)
    }

    // Builds:
    // - whatsapp://send?text=Hello%2C%20World!
    // -  https://wa.me/15551234567?text=I'm%20interested%20in%20your%20car%20for%20sale
    private func buildURL(scheme: String,
                          host: String,
                          recipient cleanedRecipient: String = "",
                          message: String) -> URL? {

        var components = URLComponents()
        components.scheme = scheme
        components.host = host
        // If the NSURLComponents has an authority component (user, password, host or port) and a path component, then the path must either begin with “/” or be an empty string.
        // If the NSURLComponents does not have an authority component (user, password, host or port) and has a path component, the path component must not start with “//”.
        // If those requirements are not met, nil is returned.
        components.path = cleanedRecipient.isEmpty ? cleanedRecipient : "/\(cleanedRecipient)"
        components.queryItems = [URLQueryItem(name: "text", value: message)]
        return components.url
    }

    // Use https://wa.me/<number> where the <number> is a full phone number in international format.
    // Omit any brackets, dashes, plus signs, and leading zeros when adding the phone number in international format.
    private func cleanRecipient(_ recipient: String) -> String {
        return recipient
            .components(separatedBy: CharacterSet.decimalDigits.inverted)
            .joined()
            .replacingOccurrences(of: "^0+", with: "", options: .regularExpression) // remove leading zeroes
    }
}
