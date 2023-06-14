// Copyright © 2021 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

struct GFDateAndSlotsFieldView: View {

    private let config: GFFieldConfiguration
    private let value: DateAndSlot?
    private let formatter: Formatter
    private let availableSlotsStatus: AvailableSlotsStatus
    private let presentCalendarAndSlots: () -> Void

    init(config: GFFieldConfiguration,
         value: DateAndSlot?,
         formatter: Formatter,
         availableSlotsStatus: AvailableSlotsStatus,
         presentCalendarAndSlots: @escaping () -> Void) {
        self.config = config
        self.value = value
        self.formatter = formatter
        self.availableSlotsStatus = availableSlotsStatus
        self.presentCalendarAndSlots = presentCalendarAndSlots
    }

    private var buttonAction: (() -> Void)? {
        if self.config.isEditable && self.availableSlotsStatus.isSuccess {
            return self.presentCalendarAndSlots
        } else {
            return nil
        }
    }

    private var shouldShowRetryButton: Bool {
        return self.availableSlotsStatus.retryAction != nil
    }

    private var shouldShowDisclosureIndicator: Bool {
        return self.config.shouldShowDisclosureIndicator && (self.availableSlotsStatus.isSuccess || self.availableSlotsStatus.isWaiting)
    }

    var body: some View {
        Button(action: self.buttonAction ?? { }, label: {
            GFFieldView(title: self.config.title, isRequired: self.config.showRequiredSymbol, content: {
                Text(verbatim: self.formatter.string(for: self.value) ?? "")
                    .placeHolder(Text(self.availableSlotsStatus.errorDescription ?? self.config.placeholder),
                                 shouldShow: self.value == nil)
                    .style("title")
            }, accessory: {
                // If we are loading, we should a loading view
                AccessoryViewFactory.loadingView(isHidden: !self.availableSlotsStatus.isLoading)
                // If there was an error, we show a retry button
                AccessoryViewFactory.retryButton(action: self.availableSlotsStatus.retryAction ?? { }, isHidden: !self.shouldShowRetryButton)
                // If the field is locked, we show the lock indicator
                AccessoryViewFactory.lockIcon(isHidden: !self.config.shouldShowLockIcon)
                // If the field needs a disclosure indicator, we show it
                AccessoryViewFactory.disclosureIndicator(isHidden: !self.shouldShowDisclosureIndicator)
            })
        })
        .buttonStyle(NoAnimationButtonStyle(if: self.buttonAction == nil))
        .wrapToGFField(variant: self.config.getInputVariant(isEmpty: self.value == nil, hasError: self.availableSlotsStatus.isFailed))
    }
}
