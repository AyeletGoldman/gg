//  Copyright (c) 2020 LVMH. All rights reserved.

import UIKit
import MaisonKit
import MaisonKitAuth
import SwiftUI
import Firebase
import Biodag
import Combine
import Foundation

@UIApplicationMain
final class AppDelegate: UIResponder, UIApplicationDelegate {

    private let networkAdapter = NetworkAdapter()
    private let userAdapter = NetworkUserAdapter()
    @AppStorage("fcmToken") private var firebaseNotificationToken: String?

    private var notificationsRegistrationToken: AnyCancellable?

    private lazy var dependencies = DependencyResolver {
        Module { self.networkAdapter as ClientsAdapter }
        Module { self.userAdapter as UserAdapter }
        Module { self.networkAdapter as OutreachAdapter }
        Module { self.networkAdapter as LocalizationAdapter }
        Module { self.networkAdapter as ClientListAdapter }
        Module { self.networkAdapter as Client360Adapter }
        Module { self.networkAdapter as Client360InfoAdapter }
        Module { self.networkAdapter as NPSAdapter }
        Module { self.networkAdapter as DashboardAdapter }
        Module { self.networkAdapter as SettingsAdapter }
        Module { self.networkAdapter as TransactionAdapter }
        Module { self.networkAdapter as ProductCuratorAdapter }
        Module { self.networkAdapter as CatalogAdapter }
        Module { self.networkAdapter as CatalogDetailsAdapter }
        Module { self.networkAdapter as ProductShareAdapter }
        Module(scope: .singleton) { LoadableClientListStore() as LoadableClientListStoring }
        Module(scope: .singleton) { DefaultNotificationsAdapter() as NotificationsAdapter }
    }

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        // TODO: Update Contracts!!
        Server.selected = {
            if Config.default.environment == "dev" { return .development }
            if Config.default.environment == "staging" { return .staging }
            if Config.default.environment == "prod" { return .production }
            return .staging
        }()
        self.dependencies.build()
        FirebaseApp.configure()
        Crashlytics.setMaisonKitKeysAndValues()
        Analytics.register(provider: ConsoleProvider())
        Analytics.register(provider: FirebaseProvider())
        Localization.setup()
        if MaisonKitAuth.retrieveCurrentAccessToken() != nil {
            Localization.updateLocalizationFiles()
        }

        return true
    }

    func application(_ application: UIApplication,
                     configurationForConnecting connectingSceneSession: UISceneSession,
                     options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
}
typealias NativeNotification = Foundation.Notification

extension NativeNotification.Name {
    static let userDidLoginNotificationName = NativeNotification.Name("userDidLoginNotification")
}
