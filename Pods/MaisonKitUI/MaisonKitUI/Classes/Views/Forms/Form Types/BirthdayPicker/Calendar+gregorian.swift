// Copyright © 2023 LVMH. All rights reserved.

import Foundation

extension Calendar {
    /// A shortcut for retrieving the gregorian calendar
    static let gregorian: Calendar = {
        var birthdayCalendar = Calendar(identifier: .gregorian)
        birthdayCalendar.locale = Locale.autoupdatingCurrent
        return birthdayCalendar
    }()
}
