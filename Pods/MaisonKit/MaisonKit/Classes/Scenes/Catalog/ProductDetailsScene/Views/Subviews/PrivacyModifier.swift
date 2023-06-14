// Copyright © 2021 LVMH. All rights reserved.

import Foundation
import SwiftUI

/// The EnvironmentKey that enables @Environment(\.privacyMode) environment variable.
struct PrivacyModeGroupKey: EnvironmentKey {
    static let defaultValue: PrivacyMode = .detail
}

extension EnvironmentValues {
    var privacyMode: PrivacyMode {
        get {
            return self[PrivacyModeGroupKey.self]
        }
        set {
            self[PrivacyModeGroupKey.self] = newValue
        }
    }
}

/// The types of privacy mode supported by views.
/// A privacy mode of `privacy` indicates to the view that they should display their content
/// in a privacy-aware manner.
/// A privacy mde of `detail` indicates to the view that they should display their content normally.
@objc public enum PrivacyMode: Int, Codable {
    case privacy
    case detail
}

/// A view modifier to enable views to be tapped to change their privacy mode and give them the ability
/// to respond to these changes.
///
/// Setting this modifier to a view will give the modified view an @Environment variable that they can
/// use to lay out their private or detail view.
struct PrivacyViewModifier: ViewModifier {

    @Binding var privacyMode: PrivacyMode

    func body(content: Content) -> some View {
        return content.onTapGesture {
            self.privacyMode = self.privacyMode == .privacy ? .detail : .privacy
        }.environment(\.privacyMode, self.privacyMode)
    }
}

extension View {
    func setPrivacyMode(_ mode: Binding<PrivacyMode>) -> some View {
        self.modifier(PrivacyViewModifier(privacyMode: mode))
    }
}
