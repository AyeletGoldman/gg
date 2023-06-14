//  Copyright © 2021 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

struct PBLCopyLinkView: View {

    @ObservedObject private var viewModel: PBLCopyLinkViewModel

    init(viewModel: PBLCopyLinkViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        ResultStateViewBuilder(result: self.viewModel.fields)
            .setLoadingView {
                FormView(fields: .loading)
            }.buildContent {
                FormView(fields: $0)
            }.style("background")
    }
}

private extension Array where Element == TypedField {
    static var loading: Self {
        return [
            TypedField(title: "Loading title", value: .text(lines: ["Loading"])),
            TypedField(title: "Loading", value: .text(lines: ["Loading but a bit longer"])),
            TypedField(title: "Loading title", value: .text(lines: ["Loading"])),
            TypedField(title: "Loading", value: .text(lines: ["Loading but a bit longer"]))
        ]
    }
}
