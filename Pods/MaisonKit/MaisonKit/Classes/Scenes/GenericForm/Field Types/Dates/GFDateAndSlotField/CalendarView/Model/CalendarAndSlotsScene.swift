// Copyright © 2021 LVMH. All rights reserved.

import UIKit
import Combine

struct CalendarAndSlotsScene: Scene {

    let selectedDateAndSlot: DateAndSlot?
    let pageTitle: String
    let getAvailableSlots: (Date) -> [CalendarSlot]
    let shouldDisableDate: ((Date) -> Bool)?
    let onDismiss: (UIViewController) -> Void
    let onDone: (DateAndSlot?, UIViewController) -> Void

    init(selectedDateAndSlot: DateAndSlot?,
         pageTitle: String,
         getAvailableSlots: @escaping (Date) -> [CalendarSlot],
         shouldDisableDate: ((Date) -> Bool)?,
         onDismiss: @escaping (UIViewController) -> Void,
         onDone: @escaping (DateAndSlot?, UIViewController) -> Void) {
        self.selectedDateAndSlot = selectedDateAndSlot
        self.pageTitle = pageTitle
        self.getAvailableSlots = getAvailableSlots
        self.shouldDisableDate = shouldDisableDate
        self.onDismiss = onDismiss
        self.onDone = onDone
    }

    func createViewController() -> CalendarAndSlotsViewController {
        return CalendarAndSlotsViewController()
    }

    func configure(controller: CalendarAndSlotsViewController,
                   using factory: SceneFactory) {
        let viewModel = CalendarAndSlotsViewModel(
            selectedDateAndSlot: self.selectedDateAndSlot,
            pageTitle: self.pageTitle,
            getAvailableSlots: self.getAvailableSlots,
            shouldDisableDate: self.shouldDisableDate,
            onDismiss: { [weak controller] in
                guard let controller = controller else { return }
                self.onDismiss(controller)
            },
            onDone: { [weak controller] selectedValue in
                guard let controller = controller else { return }
                self.onDone(selectedValue, controller)
            })
        controller.viewModel = viewModel
    }
}
