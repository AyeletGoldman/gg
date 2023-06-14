// Copyright © 2023 LVMH. All rights reserved.

import Foundation

extension FormSection {

    init(title: String? = nil, fields: [EditedField]) {
        self.init(title: title,
                  fields: fields.map { .editedField(title: $0.title, value: $0.value, operation: $0.operation) })
    }
}
