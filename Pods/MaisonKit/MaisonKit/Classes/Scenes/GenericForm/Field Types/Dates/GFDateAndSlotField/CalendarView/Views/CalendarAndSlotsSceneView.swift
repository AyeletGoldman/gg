// Copyright © 2021 LVMH. All rights reserved.

import SwiftUI

struct CalendarAndSlotsSceneView: View {

    @ObservedObject private var viewModel: CalendarAndSlotsViewModel
    @Environment(\.isModalPresentationStyle) private var isPresentedModally

    public init(viewModel: CalendarAndSlotsViewModel) {
        self.viewModel = viewModel
    }

    public var body: some View {
        CalendarAndSlotsView(selectedDate: self.$viewModel.selectedDate,
                             selectedSlot: self.$viewModel.selectedSlot,
                             availableSlots: self.viewModel.availableSlots,
                             shouldDisableDate: self.viewModel.shouldDisableDate)
            .edgesIgnoringSafeArea(.bottom, if: self.isPresentedModally)
    }
}
