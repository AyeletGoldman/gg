//  Copyright © 2021 LVMH. All rights reserved.

import SwiftUI

struct ThemeView: View {

    @ObservedObject private var viewModel: ThemeViewModel

    init(viewModel: ThemeViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        SelectionListView(items: self.viewModel.availableThemes.map { SelectionListItem(id: $0.identifier, title: $0.displayName) },
                          selection: self.$viewModel.selectedTheme,
                          rowStylistIdentifier: "input") { item in
            SelectionListItemView(item: item)
        }.environment(\.editMode, .constant(.active))
    }
}
