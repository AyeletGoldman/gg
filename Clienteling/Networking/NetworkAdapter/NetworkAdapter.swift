// Copyright © 2020 LVMH. All rights reserved.

import Foundation
import Combine
import MaisonKit
import MaisonKitAuth
import StylableSwiftUI

/// A class like this must be implemented by every client of the library
final class NetworkAdapter {
    let networking: MaisonKitNetworking
    let dashboardStore: DashboardStore
    let clientTimelineStore = IdentifiedAdapterStore<ClientTimelineV2, String>()
    var cancellables = Set<AnyCancellable>()

    private enum Constants {
        static let currencyCodeKey = "UserDefaultsCurrencyCodeKey"
        static let storeCodeKey = "UserDefaultsStoreCodeKey"
        static let storeIdKey = "UserDefaultsStoreIdKey"
        static let lastLoginDateKey = "UserDefaultsLastLoginDateKey"
    }

    static var currentCurrencyCode: String? {
        get {
            UserDefaults.standard.string(forKey: Constants.currencyCodeKey)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: Constants.currencyCodeKey)
        }
    }

    static var currentStoreCode: String? {
        get {
            UserDefaults.standard.string(forKey: Constants.storeCodeKey)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: Constants.storeCodeKey)
        }
    }
    
    static var currentStoreId: String? {
        get {
            UserDefaults.standard.string(forKey: Constants.storeIdKey)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: Constants.storeIdKey)
        }
    }

    var currentAcceptLanguageHeaderValue: String {
        // The LVMH API only accepts these languages,
        // so we map the preferred localization to the first one that we find
        let acceptedLanguages = ["en", "fr", "it", "ja", "ko", "zh-CN"]
        let preferredLocalization = Bundle.main.preferredLocalizations.compactMap { localization -> String? in
            if localization.lowercased() == "zh-hans" {
                return "zh-CN"
            }
            let language = localization.contains("-") ? String(localization.split(separator: "-")[0]) : localization
            if acceptedLanguages.contains(language) {
                return localization
            }
            return nil
        }.first ?? "en"
        return preferredLocalization
    }
    static var lastLogin: Date? {
        get {
            Date(timeIntervalSince1970: UserDefaults.standard.double(forKey: Constants.lastLoginDateKey))
        }
        set {
            if let newValue = newValue {
                UserDefaults.standard.set(newValue.timeIntervalSince1970, forKey: Constants.lastLoginDateKey)
            }
        }
    }
    init() {
        self.networking = MaisonKitNetworking(tokenRefresher: AuthTokenRefresher(tokenRefreshAdapter: MaisonKitAuth.refreshToken))
        self.dashboardStore = DashboardStore(networking: networking)
    }
}

let iconsByFieldApiName: [String: StylistIdentifier] = [
    "lastPurchaseDate": StylistIdentifier("icon-cart"),
    "lastContactDate": StylistIdentifier("icon-last-contact"),
    "advisor": StylistIdentifier("icon-associate"),
    "cart": StylistIdentifier("icon-cart"),
    "store": StylistIdentifier("icon-location"),
    "clientStore": StylistIdentifier("icon-location"),
    "outreachTemplate": StylistIdentifier("icon-template"),
    "productShare": StylistIdentifier("icon-cart"),
    "newsletter": StylistIdentifier("icon-newsletter"),
    "timespan": StylistIdentifier("icon-calendar"),
    "team": StylistIdentifier("icon-team")
]

let titleByFieldApiName: [String: String] = [
    "lastPurchaseDate": MKLocalizedString("client-list.subtitle.last-purchase-date", comment: "The last purchase date subtitle"),
    "lastContactDate": MKLocalizedString("client-list.subtitle.last-contact-date", comment: "The last contact date subtitle"),
    "clientStore": MKLocalizedString("client.fields.clientStore", comment: "The client store subtitle"),
    "advisor": MKLocalizedString("client-list.subtitle.advisor", comment: "The advisor subtitle"),
    "cart": MKLocalizedString("client-list.subtitle.cart", comment: "The cart subtitle"),
    "store": MKLocalizedString("client-list.subtitle.store", comment: "The store subtitle"),
    "outreachTemplate": MKLocalizedString("client-list.subtitle.outreach-template", comment: "The outreach template subtitle"),
    "productShare": MKLocalizedString("client-list.subtitle.product-share", comment: "The product share subtitle"),
    "newsletter": MKLocalizedString("client-list.subtitle.newsletter", comment: "The newsletter subtitle"),
    "timespan": MKLocalizedString("client-list.subtitle.timespan", comment: "The timespan subtitle"),
    "team": MKLocalizedString("client-list.subtitle.team", comment: "The team subtitle"),
    "kzo_birthday_date__c": MKLocalizedString("client-list.subtitle.birthday", comment: "The birthday subtitle"),
    "mainStore": MKLocalizedString("client-list.subtitle.store", comment: "The store subtitle")
]
