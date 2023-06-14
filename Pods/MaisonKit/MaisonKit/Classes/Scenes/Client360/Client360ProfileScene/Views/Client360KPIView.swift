// Copyright © 2020 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

struct Client360KPIView: View {

    private enum Constants {
        static let kpiSize = CGSize(width: 80, height: 75)
    }

    private let kpiItems: ResultState<Client360Displayable.KPI, ErrorDisplayable>

    init(kpiItems: ResultState<Client360Displayable.KPI, ErrorDisplayable>) {
        self.kpiItems = kpiItems
    }

    var body: some View {
        ResultStateViewBuilder(result: self.kpiItems).setLoadingView {
            self.buildMainView(kpiItems: .loadingData)
        }.buildContent { kpiItems in
            self.buildMainView(kpiItems: kpiItems)
        }
    }

    @ViewBuilder
    private func buildMainView(kpiItems: Client360Displayable.KPI) -> some View {
        if !kpiItems.items.isEmpty {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    ForEach(kpiItems.items, id: \.id) { kpi in
                        kpi.makeBody()
                    }
                }.padding(.horizontal)
            }
            .padding(.top, 20)
        }
    }
}

private extension Client360Displayable.KPI {
    static var loadingData: Client360Displayable.KPI {
        return Client360Displayable.KPI(items: [
            TypedField(value: .text(lines: ["Loading", "Data"])),
            TypedField(value: .text(lines: ["Loading", "Data"])),
            TypedField(value: .text(lines: ["Loading", "Data"]))
        ])
    }
}
