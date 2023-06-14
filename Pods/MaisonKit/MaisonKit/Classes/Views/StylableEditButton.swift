// Copyright © 2020 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

public struct StylableEditButton: View {

    private enum Labels {
        static let editingTitle = MKLocalizedString("button.edit.done.title", comment: "Title for done state in the edit button")
        static let doneTitle = MKLocalizedString("button.edit.edit.title", comment: "Title for edit state in the edit button")
    }

    @Binding public var isEditing: Bool

    public init(isEditing: Binding<Bool>) {
        self._isEditing = isEditing
    }

    public var body: some View {
        TertiaryButton(
            buttonData: ButtonData(
                label: self.isEditing ? Labels.editingTitle : Labels.doneTitle,
                icon: StylistIdentifier(self.isEditing ? "icon-done" : "icon-edit"),
                action: { self.isEditing.toggle() }
            ),
            variant: self.isEditing ? .focused : nil
        )
    }
}
