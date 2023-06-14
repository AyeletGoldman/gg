// MH Private Clienteling
// 05/04/2022

import SwiftUI
import MaisonKit
import StylableSwiftUI

public extension GFField {
    
    static func toogle(title: String,
                       editMode: GFFieldEditMode = .editable,
                       keyPath: WritableKeyPath<Object, Bool>) -> GFField {
        return GFField() { object, isReadOnly in
            return GFToggleFieldView(value: object[dynamicMember: keyPath],
                                     config: GFFieldConfiguration(title: title,
                                                                  editMode: editMode,
                                                                  isReadOnly: isReadOnly))
        }
    }
}


public extension GFField {
    static func checkMark(title: String,
                          editMode: GFFieldEditMode = .editable,
                          keyPath: WritableKeyPath<Object, Bool>) -> GFField {
        return GFField() { object, isReadOnly in
            return GFCheckMarkFieldView(value: object[dynamicMember: keyPath],
                                        config: GFFieldConfiguration(title: title,
                                                                     editMode: editMode,
                                                                     isReadOnly: isReadOnly))
        }
    }
}
struct GFCheckMarkFieldView: View {
    
    @Binding private var value: Bool
    private let config: GFFieldConfiguration
    
    init(value: Binding<Bool>, config: GFFieldConfiguration) {
        self._value = value
        self.config = config
    }
    
    var body: some View {
        HStack {
            Text(config.title)
                .frame(maxWidth: .infinity, alignment: .leading)
                .style("input[compact]/title")
            MaisonKitImage(source: .disk(name: value ? "icon-check" : "icon-cross"))
                .frame(width: 20, height: 20)
            
        }
        .disabled(!self.config.isEditable)
        .wrapToGFField(variant: self.config.getInputVariant(isEmpty: false))
    }
}

fileprivate struct GFCheckMarkPreview: PreviewProvider {
    static var previews: some View {
        GFCheckMarkFieldView(
            value: .constant(true),
            config: GFFieldConfiguration(
                title: "Email Opt-in",
                isReadOnly: true)
        )
        .environmentObject(Stylist.create())
    }
}
