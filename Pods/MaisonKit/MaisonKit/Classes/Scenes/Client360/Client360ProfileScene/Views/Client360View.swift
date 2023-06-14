// Copyright © 2020 LVMH. All rights reserved.

import Combine
import SwiftUI
import StylableSwiftUI

/// Client 360 view.
/// Shows all the details of a client
public struct Client360View: View {

    @ObservedObject private var viewModel: Client360ViewModel
    @Environment(\.isModalPresentationStyle) private var isPresentedModally

    /// Creates a new `Client360View`.
    /// - Parameters:
    ///   - viewModel: a `Client360ViewModel` that will handle the fetching of all the informations of the client.
    public init(viewModel: Client360ViewModel) {
        self.viewModel = viewModel
    }

    public var body: some View {
        self.buildMainView(viewModel: self.viewModel.isLoading ? Client360View.loadingDataProvider() : self.viewModel)
            .edgesIgnoringSafeArea(.bottom, if: self.isPresentedModally)
            .alert(alertContext: self.$viewModel.alertContext)
            .style("background")
    }

    private func buildMainView(viewModel: Client360ViewDataProvider) -> some View {
        ZStack(alignment: .top) {
            GeometryReader { proxy in
                StylableGroup("navbar-profile") {
                    Spacer()
                        .frame(maxWidth: .infinity, maxHeight: proxy.size.height / 2)
                        .style("background")
                }
            }
            self.buildClientData(viewModel: viewModel)
        }
    }

    private func buildClientData(viewModel: Client360ViewDataProvider) -> some View {
        MKList {
            // Header
            Client360HeaderView(headerInfo: viewModel.headerInfo)

            // Contact button
            Client360ContactView(hasOutreachChannels: viewModel.hasOutreachChannels,
                                 action: viewModel.contactButtonAction)
            .padding(.horizontal)
            .padding(.top, 20)

            // KPIs
            Client360KPIView(kpiItems: viewModel.kpiInfo)

            // Timeline
            Client360TimelineView(timelineInfo: viewModel.timelineInfo,
                                  availableTimelineEventActions: viewModel.availableTimelineEventActions,
                                  selectedFilters: viewModel.filters,
                                  filterTapped: viewModel.didTapFilter,
                                  addButtonHandler: viewModel.didTapAddEventButton,
                                  onSelectTimelineItem: viewModel.onSelectTimelineItem,
                                  timelineItemConfirmationClosure: viewModel.confirmTimelineItem)
            Spacer()
        }
        .refreshable {
            await self.viewModel.refreshClientData()
        }
    }
}

private extension Client360View {

    private struct LoadingClient360ViewDataProvider: Client360ViewDataProvider {
        var title: String?
        var headerInfo: ResultState<Client360Displayable.Header, ErrorDisplayable> = .loading(nil)
        var kpiInfo: ResultState<Client360Displayable.KPI, ErrorDisplayable> = .loading(nil)
        var timelineInfo: ResultState<TimelineDisplayable, ErrorDisplayable> = .loading(nil)
        var hasOutreachChannels: ResultState<Bool, ErrorDisplayable> = .loading(nil)
        var availableTimelineEventActions: ResultState<[ContextualAction], ErrorDisplayable> = .loading(nil)
        var filters: Binding<Set<TimelineDisplayable.Filter>> = .constant([])

        func contactButtonAction() { }
        func didTapFilter(_ filter: TimelineDisplayable.Filter) { }
        func didTapAddEventButton() { }
        func onSelectTimelineItem(_ item: TimelineDisplayable.Entry) { }
        func confirmTimelineItem(interactionID: String, action: TimelineEntryConfirmationAction) { }
    }

    static func loadingDataProvider() -> Client360ViewDataProvider {
        return LoadingClient360ViewDataProvider()
    }
}

private protocol Client360ViewDataProvider {
    var title: String? { get }
    var headerInfo: ResultState<Client360Displayable.Header, ErrorDisplayable> { get }
    var kpiInfo: ResultState<Client360Displayable.KPI, ErrorDisplayable> { get }
    var timelineInfo: ResultState<TimelineDisplayable, ErrorDisplayable> { get }
    var hasOutreachChannels: ResultState<Bool, ErrorDisplayable> { get }
    var availableTimelineEventActions: ResultState<[ContextualAction], ErrorDisplayable> { get }
    var filters: Binding<Set<TimelineDisplayable.Filter>> { get }

    func contactButtonAction()
    func onSelectTimelineItem(_ item: TimelineDisplayable.Entry)
    func didTapFilter(_ filter: TimelineDisplayable.Filter)
    func didTapAddEventButton()
    func confirmTimelineItem(interactionID: String, action: TimelineEntryConfirmationAction)
}

extension Client360ViewModel: Client360ViewDataProvider {
    var filters: Binding<Set<TimelineDisplayable.Filter>> {
        return Binding<Set<TimelineDisplayable.Filter>> { [weak self] () -> Set<TimelineDisplayable.Filter> in
            return self?.selectedFilters ?? []
        } set: { [weak self] (newValue: Set<TimelineDisplayable.Filter>) in
            self?.selectedFilters = newValue
        }
    }
}
