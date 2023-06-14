// Copyright © 2022 LVMH. All rights reserved.

import SwiftUI

public extension GFField {
    /// Creates generic form readonly action text field
    /// - Parameters:
    ///   - title: The field title
    ///   - value: The field text value
    ///   - placeHolder: The placeholder to show
    ///   - actionType: The action type
    /// - Returns: Generic form field with the readonly action text configuration
    static func text(title: String,
                     value: String,
                     placeHolder: String = "",
                     actionType: ActionType) -> GFField {
        return GFField { (_, isReadOnly, actionTypeFactory: @escaping ((ActionType) -> Void)) -> GFActionTextFieldView in
            return GFActionTextFieldView(value: value,
                                         config: GFFieldConfiguration(title: title,
                                                                      placeholder: placeHolder,
                                                                      isReadOnly: isReadOnly),
                                         performAction: {
                actionTypeFactory(actionType)
            })
        }
    }
}
