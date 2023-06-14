// Copyright © 2020 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

/// A view that presents a lisit of languages for the user to choose from.
struct LanguageSelectionView: View {

    @StateObject private var viewModel: LanguageSelectionViewModel

    init(viewModel: LanguageSelectionViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        SelectionListView(items: self.viewModel.languages,
                          selection: self.$viewModel.selectedLanguageId,
                          rowStylistIdentifier: "input") { language in
            ListItemView(title: language.name)
            // The selection list is in edit mode, but the contents of the list item view are not
                .environment(\.editMode, .constant(.inactive))
        }.environment(\.editMode, .constant(.active))
            .edgesIgnoringSafeArea(.bottom)
    }
}
