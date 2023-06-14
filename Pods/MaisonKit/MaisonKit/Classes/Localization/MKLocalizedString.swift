// Copyright © 2020 LVMH. All rights reserved.

import Foundation
import SwiftUI

/// Localizes a string given a particular key.
/// - Parameters:
///   - key: The key to use for localization. This will usually be a full-stop separated identifier like "some.localization.key"
///   - defaultValue: The default value to use for this localization if no other can be found.
///   - comment: The comment that will be used to give context to the translators.
/// - Returns: The localized string for the key,
public func MKLocalizedString(_ key: String, defaultValue: String? = nil, comment: String) -> String {
    /// There are three different localization bundles:
    /// - The "dynamic" bundle that's loaded from an API
    /// - The localization bundle shipped with MaisonKit
    /// - The bundle shipped with the app
    /// The order of preference to load translations from these bundles is:
    /// 1. Dynamic bundle
    /// 2. App bundle (so apps can override localization if they want)
    /// 3. Localization bundle shipped with MaisonKit

    // 1. Find out if the dynamic bundle is available and it has the translation we're looking for
    if let bundle = Bundle.localization {
        var translatedString = NSLocalizedString(key, bundle: bundle, value: defaultValue ?? "", comment: comment)
        // 2. If the translated string from the dynamic bundle is == key then we don't have a translation for this key
        if translatedString == key {
            // 3. Try to translate from the app's bundle
            translatedString = appLocalization(for: key, comment: comment)
            // 4. If we didn't find a translation in the app, default to any translation sent with the SDK
            if translatedString == key {
                return SDKLocalization(for: key, defaultValue: defaultValue, comment: comment)
            }
        }
        return translatedString
    }

    // If for some reason we weren't able to find a dynamic localization bundle
    // First try the app bundle for localizations, then the SDK's bundle
    let translation = appLocalization(for: key, comment: comment)
    if translation == key {
        return SDKLocalization(for: key, defaultValue: defaultValue, comment: comment)
    }
    return translation
}

private func SDKLocalization(for key: String, defaultValue: String?, comment: String) -> String {

    let bundle = getSDKBundle()

    if let defaultValue = defaultValue {
        return NSLocalizedString(key, bundle: bundle, value: defaultValue, comment: comment)
    }
    return NSLocalizedString(key, bundle: bundle, comment: comment)
}

private func getSDKBundle() -> Bundle {
    // If we have no app group (e.g. the implementing app does not want to support translating push, or does not use an
    // app extension to translate push, just return the regular SDK localization location
    guard let appGroup = MaisonKit.appGroup else { return .sdkLocalization }
    // If we have an app group, get the URL for it and try to create a bundle from that URL
    let manager = LocalizationBundleManager(appGroup: appGroup)
    guard let bundleURL = manager.getBundleURL(),
            let bundle = Bundle(url: bundleURL) else { return .sdkLocalization }
    return bundle
}

private func appLocalization(for key: String, comment: String) -> String {
    return NSLocalizedString(key, bundle: Bundle.main, comment: comment)
}
