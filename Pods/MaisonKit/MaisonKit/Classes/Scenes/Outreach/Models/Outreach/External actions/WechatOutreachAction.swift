// Copyright © 2020 LVMH. All rights reserved.

import Foundation

enum WechatOutreachError: Error {
    case couldNotBuildWechatURL
    case couldNotOpenURL
}

final class WechatOutreachAction: OutreachExternalAction {

    static var isAvailable: Bool {
        guard let url = URL(string: "weixin://") else {
            return false
        }
        return UIApplication.shared.canOpenURL(url)
    }

    static func openAppStoreLink() {
        UIApplication.shared.open(URL(string: "itms-apps://apple.com/app/id414478124")!,
                                  options: [:],
                                  completionHandler: nil)
    }

    func perform(withMessage outreachMessage: OutreachMessage) {
        guard let url = URL(string: "weixin://") else {
            outreachMessage.callback(.failure(WechatOutreachError.couldNotBuildWechatURL))
            return
        }

        guard UIApplication.shared.canOpenURL(url) else {
            outreachMessage.callback(.failure(WechatOutreachError.couldNotOpenURL))
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
}
