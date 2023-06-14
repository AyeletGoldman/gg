// Copyright © 2022 LVMH. All rights reserved.

import Foundation

/// The global app group for the SDK.
/// Set this property to the value of the app group to allow sharing data between an application and an extension.
/// MaisonKit uses this value for the notification service extension, to share localized information to translate incoming push notifications.
/// You must set this value from the notification extension, and from within the app you should call `MaisonKit.initialize` and pass in the same value as this property.
public var appGroup: String?
