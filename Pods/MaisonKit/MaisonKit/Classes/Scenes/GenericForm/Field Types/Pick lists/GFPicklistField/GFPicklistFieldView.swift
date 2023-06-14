// Copyright © 2021 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

struct GFPicklistFieldView: View {

    private let config: GFFieldConfiguration
    private let valueLabel: String?
    private let items: PicklistOptionsStatus
    private let presentNestedSelectionList: () -> Void

    init(config: GFFieldConfiguration,
         valueLabel: String?,
         items: PicklistOptionsStatus,
         presentNestedSelectionList: @escaping () -> Void) {
        self.config = config
        self.valueLabel = valueLabel
        self.items = items
        self.presentNestedSelectionList = presentNestedSelectionList
    }

    private var buttonAction: (() -> Void)? {
        if self.config.isEditable && self.items.isSuccess {
            return self.presentNestedSelectionList
        } else {
            return nil
        }
    }

    private var shouldShowRetryButton: Bool {
        return self.items.retryAction != nil
    }

    private var shouldShowDisclosureIndicator: Bool {
        return self.config.shouldShowDisclosureIndicator && (self.items.isSuccess || self.items.isWaiting)
    }

    var body: some View {
        Button(action: self.buttonAction ?? { }, label: {
            GFFieldView(title: self.config.title, isRequired: self.config.showRequiredSymbol, content: {
                Text(verbatim: self.valueLabel ?? "")
                    .placeHolder(Text(self.items.errorDescription ?? self.config.placeholder), shouldShow: self.valueLabel == nil)
                    .style("title")
            }, accessory: {
                // If we are loading, we should a loading view
                AccessoryViewFactory.loadingView(isHidden: !self.items.isLoading)
                // If there was an error, we show a retry button
                AccessoryViewFactory.retryButton(action: self.items.retryAction ?? { }, isHidden: !self.shouldShowRetryButton)
                // If the field is locked, we show the lock indicator
                AccessoryViewFactory.lockIcon(isHidden: !self.config.shouldShowLockIcon)
                // If the field needs a disclosure indicator, we show it
                AccessoryViewFactory.disclosureIndicator(isHidden: !self.shouldShowDisclosureIndicator)
            })
        })
        .buttonStyle(NoAnimationButtonStyle(if: self.buttonAction == nil))
        .wrapToGFField(variant: self.config.getInputVariant(isEmpty: self.valueLabel == nil, hasError: self.items.isFailed))
    }
}
