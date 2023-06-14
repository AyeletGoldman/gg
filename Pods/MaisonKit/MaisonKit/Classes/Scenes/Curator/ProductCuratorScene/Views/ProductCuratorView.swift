//  Copyright © 2021 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

struct ProductCuratorView: View {

    private enum Labels {
        static let emptyTitle = MKLocalizedString("product-curator.empty.title",
                                                  comment: "The title of the error view when the curator is empty")
        static let emptyDescription = MKLocalizedString("product-curator.empty.description",
                                                        comment: "The description of the error view when the curator is empty")
    }

    @ObservedObject private var viewModel: ProductCuratorViewModel

    init(viewModel: ProductCuratorViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        ResultStateViewBuilder(result: self.viewModel.products).setEmptyView {
            VStack {
                AuxiliaryView(viewModel: AuxiliaryViewModel(imageSource: .styledImage(identifier: "icon-lrg-cart-empty"),
                                                            title: Labels.emptyTitle,
                                                            subtitle: Labels.emptyDescription), topMargin: 60, bottomMargin: 100)
                Spacer()
            }
            .padding()
            .style("background")
            .edgesIgnoringSafeArea(.bottom)
        }.setLoadingView({
            ScrollView {
                self.buildResultsView(cells: [Self.curatorLoadingDisplayable,
                                              Self.curatorLoadingDisplayable,
                                              Self.curatorLoadingDisplayable])
            }
        })
        .buildContent { cells in
            self.buildResultsView(cells: cells)
                .withFloatingActionView(value: self.viewModel.actions.value?.count) {
                    VStack {
                        ResultStateViewBuilder(result: self.viewModel.actions)
                            .setLoadingView({ actions in
                                self.buildActions(actions: actions ?? Self.loadingActions)
                            })
                            .buildContent { actions in
                                self.buildActions(actions: actions)
                            }
                    }
                    .padding()
                }
        }
        .alert(alertContext: self.$viewModel.alertContext)
    }

    @ViewBuilder
    private func buildResultsView(cells: [CuratedProductDisplayable]) -> some View {
        VStack(spacing: 20) {
            ForEach(cells, id: \.id) { cell in
                CuratorCellView(displayable: cell, onTapDelete: {
                    self.viewModel.didTapDeleteButton(for: cell.id)
                }, onImagesEditTap: {
                    self.viewModel.presentChoosePhotos(for: cell.id)
                })
            }
        }.padding()
    }

    @ViewBuilder
    private func buildActions(actions: [ButtonAction]) -> some View {
        ForEach(0..<actions.count, id: \.self) { index in
            StyledButton.fullWidthPaddedButton(data: ButtonData(label: actions[index].action.localizedTitle,
                                                                isEnabled: actions[index].action.isEnabled,
                                                                action: {
                self.viewModel.handleActionTypeAction(action: actions[index].action)
            }),
                                               style: actions[index].buttonIdentifier)
        }
    }
}

private extension ProductCuratorView {
    static var curatorLoadingDisplayable: CuratedProductDisplayable {
        return CuratedProductDisplayable(id: UUID().uuidString,
                                         title: "Product Name",
                                         assets: [.image(source: .loadingPlaceholder)],
                                         properties: Array(repeating: CuratedProductProperty(label: "Label",
                                                                                             value: "Some value"),
                                                           count: 3))
    }

    static var loadingActions: [ButtonAction] {
        return [
            ButtonAction(action: ContextualAction(localizedTitle: "Action", action: { }))
        ]
    }
}
