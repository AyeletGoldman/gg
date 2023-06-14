// Copyright © 2020 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

struct TimelineCellDateView: View {

    private static let dateFormatter = DateFormatter()

    private let components: DateComponents
    private let width: CGFloat?

    init(date: Date,
         calendar: Calendar = .autoupdatingCurrent,
         width: Double? = nil) {
        self.components = date.get(.day, .month, calendar: calendar)
        self.width = width.map { CGFloat($0) }
    }

    var body: some View {
        StylableGroup("timeline-date") {
            VStack {
                if self.components.day != nil {
                    Text(verbatim: "\(self.components.day!)")
                        .style("title")
                }
                if self.components.month != nil && self.components.month! > 0 {
                    self.buildMonthView(self.components.month!)
                        .style("subtitle")
                }
            }
            .padding(.vertical, 3)
            .frame(width: self.width)
            .style("background")
        }
    }

    private func buildMonthView(_ month: Int) -> some View {
        return Text(verbatim: "\(TimelineCellDateView.dateFormatter.shortMonthSymbols[month-1])")
    }
}

extension Date {
    func get(_ components: Calendar.Component...,
             calendar: Calendar = .autoupdatingCurrent) -> DateComponents {
        return calendar.dateComponents(Set(components), from: self)
    }
}
