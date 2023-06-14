// Copyright © 2021 LVMH. All rights reserved.

import Foundation

/// A class to ease implementation of haptic feedback
public final class HapticGenerator {

    private static let generator: UINotificationFeedbackGenerator = {
        let gen = UINotificationFeedbackGenerator()
        gen.prepare()
        return gen
    }()

    /// Generates a success haptic feedback
    public static func success() {
        self.generator.notificationOccurred(.success)
    }

    /// Generates a failure haptic feedback
    public static func failure() {
        self.generator.notificationOccurred(.error)
    }
}

extension HapticGenerator {
    static func resultOccurred(_ result: CancellableResult) {
        switch result {
        case .cancelled:
            break
        case .failure:
            Self.failure()
        case .success:
            Self.success()
        }
    }
}
