//  Copyright © 2021 LVMH. All rights reserved.

import Combine
import Biodag

final class NotificationsPermissionsViewModel: ObservableObject {

    enum Mode {
        case notDetermined
        case declined

        var isDeclined: Bool {
            return self == .declined
        }
    }

    private let onDone: (_ cancelled: Bool) -> Void
    @Inject private var notificationsAdapter: NotificationsAdapter

    @Published var mode: Mode = .notDetermined

    init(onDone: @escaping (_ cancelled: Bool) -> Void) {
        self.onDone = onDone
        UNUserNotificationCenter.current().getNotificationSettings { [weak self] settings in
            self?.mode = settings.authorizationStatus  == .notDetermined ? .notDetermined : .declined
        }
    }

    func didTapEnableNotifications() {
        self.notificationsAdapter.requestRegisterForNotifications { [weak self] _ in
            // Doesn't matter if the user agreed or declined. We consider the action "competed"
            self?.onDone(false)
        }
    }

    func didTapContinueWithoutNotifications() {
        self.onDone(false)
    }

    func didTapGoToSettings() {
        guard let appSettings = URL(string: UIApplication.openSettingsURLString) else { return }
        guard UIApplication.shared.canOpenURL(appSettings) else { return }
        UIApplication.shared.open(appSettings)
        self.onDone(false)
    }

    func didTapCancel() {
        self.onDone(true)
    }
}
