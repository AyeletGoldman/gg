// Copyright © 2021 LVMH. All rights reserved.

import Foundation

enum KakaoOutreachError: Error {
    case couldNotOpenURL(message: String)
}

final class KakaoOutreachAction: OutreachExternalAction {

    static var isAvailable: Bool {
        guard let url = URL(string: "kakaolink://send") else {
            return false
        }
        return UIApplication.shared.canOpenURL(url)
    }

    static func openAppStoreLink() {
        UIApplication.shared.open(URL(string: "itms-apps://apple.com/app/id362057947")!,
                                  options: [:],
                                  completionHandler: nil)
    }

    func perform(withMessage outreachMessage: OutreachMessage) {
        guard let url = self.getURLToOpen() else {
            outreachMessage.callback(.failure(KakaoOutreachError.couldNotOpenURL(message: outreachMessage.message)))
            return
        }
        UIApplication.shared.open(url, options: [:]) { success in
            if success {
                outreachMessage.callback(.success)
            } else {
                outreachMessage.callback(.failure(nil))
            }
        }
    }

    private func getURLToOpen() -> URL? {
        if let kakaoURL = self.buildKakaoLinkURL(),
            UIApplication.shared.canOpenURL(kakaoURL) {
            return kakaoURL
        }
        return nil
    }

    // eg kakaolink://send
    private func buildKakaoLinkURL() -> URL? {
        var components = URLComponents()
        components.scheme = "kakaolink"
        components.host = ""
        return components.url
    }
}
