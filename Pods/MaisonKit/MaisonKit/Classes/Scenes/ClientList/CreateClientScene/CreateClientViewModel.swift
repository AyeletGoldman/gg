// Copyright © 2023 LVMH. All rights reserved.

import Foundation

final class CreateClientViewModel: ObservableObject {

    func setupGuidedAccess(_ enabled: Bool) {
        guard UIAccessibility.isGuidedAccessEnabled != enabled else { return }

        UIAccessibility.requestGuidedAccessSession(enabled: enabled) { success in
            print("Request guided access to \(enabled), success \(success)")
        }
    }
}
