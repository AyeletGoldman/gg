// Copyright © 2022 LVMH. All rights reserved.

import WebKit

extension WKWebView {
    func determineContentHeight(done: @escaping (CGFloat?) -> Void) {
        self.evaluateJavaScript("document.readyState", completionHandler: { [weak self] (complete, _) in
            guard let self = self else {
                done(nil)
                return
            }
            if complete != nil {
                self.evaluateJavaScript("document.body.scrollHeight", completionHandler: { (height, _) in
                    let webViewHeight = height as? CGFloat
                    done(webViewHeight)
                })
            } else {
                done(nil)
            }
        })
    }
}
