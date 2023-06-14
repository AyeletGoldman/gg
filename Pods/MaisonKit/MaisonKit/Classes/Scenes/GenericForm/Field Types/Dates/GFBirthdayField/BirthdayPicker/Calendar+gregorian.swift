// Copyright © 2022 LVMH. All rights reserved.

import Foundation

public extension Calendar {
    /// A shortcut for retrieving the gregorian calendar
    static let gregorian: Calendar = {
        var birthdayCalendar = Calendar(identifier: .gregorian)
        birthdayCalendar.locale = Locale.autoupdatingCurrent
        return birthdayCalendar
    }()
}
