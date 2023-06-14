// Copyright © 2020 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

struct NoteCellView: View {

    var item: NoteDisplayable

    var body: some View {
        VStack(spacing: 0) {
            FormTextFieldView(
                typedField: TypedField(title: item.dateField.toString(), value: .text(lines: [item.content])),
                styleType: .compact
            )
            HStack(alignment: .top, spacing: 17) {
                TypedFieldView(typedField: item.advisorNameField)
                    .style("info/title")
                TypedFieldView(typedField: item.storeNameField)
                    .style("info/title")
                Spacer()
            }
            .padding(EdgeInsets(top: 10, leading: 12, bottom: 20, trailing: 0))
        }
    }
}

struct NoteCellView_Previews: PreviewProvider {
    static var previews: some View {
        NoteCellView(
            item: NoteDisplayable(
                id: "String",
                advisorNameField: TypedField(value: .text(lines: ["Walter White"]), icon: "icon-associate"),
                storeNameField: TypedField(value: .text(lines: ["Paris Store"]), icon: "icon-location"),
                dateField: TypedValue.text(lines: ["September, 10th, 2019"]),
                content: "Note content text"
            )
        ).environmentObject(Stylist())
    }
}
