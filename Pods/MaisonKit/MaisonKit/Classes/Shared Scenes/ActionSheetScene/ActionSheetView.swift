// Copyright © 2022 LVMH. All rights reserved.

import SwiftUI

struct ActionSheetView: View {

    @ObservedObject private var viewModel: ActionSheetViewModel

    init(viewModel: ActionSheetViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                ForEach(self.viewModel.actionSheetContent.items, content: { item in
                    Button(action: { self.viewModel.didSelect(item) },
                           label: {
                        ListItemView(title: item.title)
                            .stackWithAccessory()
                            .styleAsListRow(includeDivider: true)
                    })
                })
                Spacer()
            }
        }
    }
}
