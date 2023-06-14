// Copyright © 2020 LVMH. All rights reserved.

import Foundation

public struct NoteDisplayable: Identifiable {
    public let id: String
    let advisorNameField: TypedField
    let storeNameField: TypedField
    let dateField: TypedValue
    let content: String

    public init(id: String, advisorNameField: TypedField, storeNameField: TypedField, dateField: TypedValue, content: String) {
        self.id = id
        self.advisorNameField = advisorNameField
        self.storeNameField = storeNameField
        self.dateField = dateField
        self.content = content
    }
}
