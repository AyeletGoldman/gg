/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.
///
/// Clienteling APIs
/// Clienteling APIs.
/// Version: v1

import Foundation

extension DateFormatter {
    static let iso8601Full: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ"
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.timeZone = TimeZone.autoupdatingCurrent
        // We don't want to have `autoupdatingCurrent` here because it appears
        // that DateFormatter's behaviour is to override the date format
        // with the given locale. So in 12-hour settings (i.e. the user's phone
        // set to 12hr time instead of 24hr time) the `HH` portion of the format
        // was overridden to return no leading 0. This failed validation.
        // In any case, it probably makes sense for this to be in a specific locale
        // and not changing based on the user's locale since this is not something
        // that will be displayed to the user.
        formatter.locale = Locale(identifier: "en_US_POSIX")
        return formatter
    }()
}
