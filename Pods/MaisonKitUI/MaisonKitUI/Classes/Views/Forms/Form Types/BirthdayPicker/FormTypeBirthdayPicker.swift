// Copyright © 2023 LVMH. All rights reserved.

import Foundation
import SwiftUI
import StylableSwiftUI

public struct FormTypeBirthdayPicker: View {

    @Environment(\.isEnabled) private var isEnabled

    @Binding private var birthday: Birthday?
    @State private var isExpanded: Bool = false
    private let titleForValue: (Birthday?) -> String

    public init(birthday: Binding<Birthday?>, isExpanded: Bool = false, titleForValue: @escaping (Birthday?) -> String) {
        self._birthday = birthday
        self.isExpanded = isExpanded
        self.titleForValue = titleForValue
    }

    public var body: some View {
        StylableGroup(StylistIdentifier.buildFullIdentifier(for: "form-type-picklist",
                                                            variant: self.isEnabled ? nil : FormTypeState.disabled.rawValue)) {
            HStack(spacing: 0) {
                Text(self.titleForValue(self.birthday)).style("title")
                Spacer()
                Group {
                    if self.isExpanded {
                        Button(action: {
                            self.birthday = nil
                        }, label: {
                            MaisonKitImage(source: .styledImage(identifier: "icon-clear"))
                        })
                    } else {
                        MaisonKitImage(source: .styledImage(identifier: "icon-up"))
                    }
                }.frame(width: 20, height: 20)
            }
            .contentShape(Rectangle())
            .onTapGesture {
                withAnimation(.easeOut) {
                    self.isExpanded.toggle()
                }
            }
        }
        if self.isExpanded {
            BirthdayPicker(selection: self.$birthday.getRequired())
        }
    }
}

private extension Binding where Value == Birthday? {
    func getRequired() -> Binding<Birthday> {
        return Binding<Birthday> { () -> Birthday in
            return self.wrappedValue ?? Birthday()
        } set: { (newValue: Birthday) in
            self.wrappedValue = newValue
        }
    }
}
