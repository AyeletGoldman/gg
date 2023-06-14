// Copyright © 2021 LVMH. All rights reserved.

import SwiftUI

extension View {
    func asIdentifiableView(id: String) -> IdentifiableView {
        if let anySelf = self as? IdentifiableView {
            return anySelf
        }
        return IdentifiableView(id: id, wrapped: self.eraseToAnyView())
    }
}

struct IdentifiableView: View, Identifiable {

    let id: String
    let wrapped: AnyView

    init(id: String, wrapped: AnyView) {
        self.id = id
        self.wrapped = wrapped
    }

    var body: some View {
        self.wrapped
    }
}
