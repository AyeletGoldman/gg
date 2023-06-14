// Copyright © 2021 LVMH. All rights reserved.

import Foundation

/// An adapter to request notification permissions.
public protocol NotificationsAdapter {

    /// Requests notification permissions from the host application
    /// - Parameter onDone: a closure to invoke when notifciation permissions have been requested, with the result.
    func requestRegisterForNotifications(onDone: @escaping (Result<Void, Error>) -> Void)

    /// Asks the adapter if the host app has permissions to receive notifications
    /// - Parameter completion: a completion handler to invoke with the result
    func hasNotificationsPermissions(completion: @escaping (Bool) -> Void)
}

/// A default implementation of a notification adapter.
///
/// This is a simple implementation that uses ``UNUNUserNotificationCenter``'s `current()` center to request authorization.
/// It requests all possible options: `.alert`, `.badge` and `.sound`.
/// If the user gives permission, it registers the application for remote notifications via `UIApplication.shared.registerForRemoteNotifications()`.
public final class DefaultNotificationsAdapter: NotificationsAdapter {

    public init() { }

    public func requestRegisterForNotifications(onDone: @escaping (Result<Void, Error>) -> Void) {
        let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
        UNUserNotificationCenter.current().requestAuthorization(options: authOptions) { granted, error in
            DispatchQueue.main.async {
                if let error, !granted {
                    return onDone(.failure(error))
                }

                UIApplication.shared.registerForRemoteNotifications()
                onDone(.success(()))
            }
        }
    }

    public func hasNotificationsPermissions(completion: @escaping (Bool) -> Void) {
        return UNUserNotificationCenter.current().getNotificationSettings { settings in
            DispatchQueue.main.async {
                let isAuthorised = settings.authorizationStatus == .authorized && UIApplication.shared.isRegisteredForRemoteNotifications
                completion(isAuthorised)
            }
        }
    }
}
