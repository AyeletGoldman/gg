// Copyright © 2020 LVMH. All rights reserved.

import Foundation
import Combine
import MaisonKit
import MaisonKitAuth
import FirebaseCrashlytics

class NetworkUserAdapter: UserAdapter {
    let networking: MaisonKitNetworking
    
    init() {
        self.networking = MaisonKitNetworking(tokenRefresher: AuthTokenRefresher(tokenRefreshAdapter: MaisonKitAuth.refreshToken))
    }
    
    func getUserDetails() -> AnyPublisher<MaisonKit.User, ErrorDisplayable> {
        return self.networking.usersControllerFindCurrent()
            .unwrapDefaultSuccessResponse()
            .handleEvents(receiveOutput: { response in
                NetworkAdapter.currentCurrencyCode = response.data.result.user.currencyCode
                NetworkAdapter.currentStoreCode = response.data.result.store.code
                NetworkAdapter.lastLogin = Date()
                Crashlytics.setMaisonKitKeysAndValues()
            })
            .map(\.data.result)
            .eraseToAnyPublisher()
            .mapToViewModel(responseMap: MaisonKit.User.init)
    }
}

// MARK: - Users
extension MaisonKit.User {
    init(_ userInfo: UserInfo) {
        let role: Role? = {
            if let roleId = userInfo.user.role?.id, let roleName = userInfo.user.role?.name {
                return Role(id: roleId, name: roleName)
            }
            return nil
        }()
        let crmInfo: UserContact? = {
            if let email = userInfo.contact?.email, let information = userInfo.contact?.information {
                return UserContact(information: MKLocalizedString(information, comment: ""),
                                   email: email)
            }
            return nil
        }()
        let storeId = userInfo.store.id
        let storeName = userInfo.store.name
        let storeCode = userInfo.store.code
        let store = MaisonKit.Store(id: storeId, code: storeCode, name: storeName)
        
        let id = userInfo.user.id
        let name = "N/A" // TODO: We don't have a user name anymore?
        
        let displayFields = userInfo.displayFields.map {
            TypedField(id: $0.apiName,
                       title: MKLocalizedString($0.translationKey ?? "N/A", comment: "The translation for this typed field"),
                       value: MaisonKit.TypedValue(from: $0),
                       isCopyable: $0.isCopyable)
        }
        self.init(id: id, email: userInfo.user.email, name: name, role: role, store: store, contact: crmInfo, displayFields: displayFields)
    }
}

extension Crashlytics {
    static func setMaisonKitKeysAndValues() {
        let crashlyticsKeysAndValues: [String: Any] = [
            "Client advisor ID": MaisonKitUser.currentLoggedInUser?.id ?? "",
            "Store code": MaisonKitUser.currentLoggedInUser?.store?.code ?? ""
        ]
        Crashlytics.crashlytics().setCustomKeysAndValues(crashlyticsKeysAndValues)
    }
}
