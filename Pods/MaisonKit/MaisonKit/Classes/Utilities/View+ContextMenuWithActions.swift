// Copyright © 2022 LVMH. All rights reserved.

import SwiftUI

extension View {
    @ViewBuilder
    func contextMenu(actions: [ContextualAction], performActionType: @escaping (ActionType) -> Void) -> some View {
        self.contextMenu {
            VStack(alignment: .leading, spacing: 8) {
                ForEach(0..<actions.count, id: \.self) { index in
                    let action = actions[index]

                    Button {
                        performActionType(action.type)
                    } label: {
                        HStack {
                            Text(action.localizedTitle)
                            if let imageIdentifier = action.imageIdentifier {
                                Spacer()
                                MaisonKitImage(source: .styledImage(identifier: imageIdentifier))
                            }
                        }
                    }
                    .disabled(!action.isEnabled)
                 }
            }
        }
    }
}
