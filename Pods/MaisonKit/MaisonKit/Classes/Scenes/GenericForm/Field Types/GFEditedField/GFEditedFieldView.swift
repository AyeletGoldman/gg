// Copyright © 2023 LVMH. All rights reserved.

import SwiftUI

struct GFEditedFieldView: View {

    private let value: String
    private let operation: EditedFieldOperation

    private let config: GFFieldConfiguration

    init(value: String, operation: EditedFieldOperation, config: GFFieldConfiguration) {
        self.value = value
        self.config = config
        self.operation = operation
    }

    var body: some View {
        GFFieldView(title: self.config.title, isRequired: false, tag: BadgeViewData(title: self.operation.title, variant: self.operation.stylistVariant), content: {
            Text(verbatim: self.value)
                .style("title")
        })
        .wrapToGFField(variant: self.operation == .removed ? .blurred : nil)
    }
}
