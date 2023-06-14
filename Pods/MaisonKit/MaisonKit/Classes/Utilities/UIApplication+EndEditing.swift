// Copyright © 2023 LVMH. All rights reserved.

import UIKit

extension UIApplication {
    func endEditing(_ force: Bool) {
        // https://stackoverflow.com/a/58031897/1027644
        self.connectedScenes
            .compactMap { ($0 as? UIWindowScene)?.keyWindow }
            .first?
            .endEditing(force)
    }
}
