// MH Private Clienteling
// 05/04/2022

import SwiftUI
import StylableSwiftUI
import MaisonKit

struct GFToggleFieldView: View {

    @Binding private var value: Bool
    private let config: GFFieldConfiguration

    init(value: Binding<Bool>, config: GFFieldConfiguration) {
        self._value = value
        self.config = config
    }

    var body: some View {
        Toggle(isOn: self.$value ) {
            Text(self.config.title)
                .style("title")
        }
        .disabled(!self.config.isEditable)
        .wrapToGFField(variant: self.config.getInputVariant(isEmpty: false))
    }
}
