// Copyright © 2021 LVMH. All rights reserved.

import Foundation
import Combine
import Biodag

/// A base class for a view model that deals with searching for clients.
public class BaseSearchClientsViewModel {

    private enum Constants {
        static let cacheObjectId = "recentClientSearches"
    }

    @Published private(set) var dataSource: ResultState<[ClientSearchRowDisplayable], ErrorDisplayable> = .waiting
    @Published var alertContext: AlertContext?
    @Published var noticeMessage: String?
    @Published var searchText: String = ""

    @Inject private var clientsAdapter: ClientsAdapter
    private let searchPerformer: SearchPerformer<[ClientSearchRowDisplayable], BaseSearchClientsViewModel>
    fileprivate let recentSearchesPerformer: RecentSearchesPerformer
    private var cancellables = Set<AnyCancellable>()

    let clientListId: String?
    let title: String
    let onDismiss: (() -> Void)?

    /// Creates a new view model
    /// - Parameters:
    ///   - clientListId: the list ID for searching. If this is `nil` the search will be on the whole client base.
    ///   - title: the title of the screen. Usually used to populate the navigation bar's title.
    ///   - onDismiss: a closure to invoke when the user finishes searching and wants to dismiss this view.
    public init(clientListId: String? = nil,
                title: String? = nil,
                onDismiss: (() -> Void)?) {
        self.clientListId = clientListId
        self.title = title ?? Labels.navigationBarTitle
        self.onDismiss = onDismiss

        self.searchPerformer = SearchPerformer()
        self.recentSearchesPerformer = RecentSearchesPerformer(cacheObjectId: Constants.cacheObjectId)
        self.searchPerformer.delegate = self

        self.$searchText
            .dropFirst() // We don't care about the initial value
            .removeDuplicates()  // We don't want to search duplicate values
            .debounce(for: .milliseconds(250), scheduler: DispatchQueue.main) // If user is still typing don't search yet
            .sink { [weak self] _ in
                self?.didCommitSearch() // Search
            }.store(in: &self.cancellables)
    }

    fileprivate func recentSearchTapped(withText text: String) {
        self.searchText = text
        Analytics.log(RecentSearchTappedEvent(source: .clients, query: text))
    }

    func addLastSearchToRecentSearches() {
        self.recentSearchesPerformer.addToRecentSearches(text: self.searchPerformer.lastSearch)
    }

    fileprivate func resetRecentSearchesAlert() {
        let secondaryButton = AlertContext.Button(title: Labels.alertConfirmationClearButtonTitle, style: .destructive(action: self.recentSearchesPerformer.resetRecentSearches))
        self.alertContext = AlertContext(title: Labels.alertConfirmationClearTitle,
                                         message: Labels.alertConfirmationClearMessage,
                                         secondaryButton: secondaryButton)
    }

    func getEmptyDataViewModel() -> AuxiliaryViewModel {
        return AuxiliaryViewModel.emptyDataModel(
            title: Labels.emptyTitle,
            subtitle: Labels.emptySubtitle
        )
    }

    func didCommitSearch() {
        if self.isValidQuery(queryText: self.searchText) {
            self.searchPerformer.performSearch(withText: self.searchText)
        } else if self.searchText.isEmpty {
            self.searchPerformer.performSearch(withText: self.searchText)
            self.noticeMessage = nil
        } else {
            self.noticeMessage = String(format: Labels.minimumNumberOfCharactersText,
                                        self.clientsAdapter.minimumNumberOfSearchCharacters())
        }
    }
}

extension BaseSearchClientsViewModel: SearchPerformerDelegate {
    func searchPerformerDidStartLoading() {
        self.dataSource = .loading(self.dataSource.value)
        self.noticeMessage = nil
    }

    func searchPerformerDidFindSearchResult(_ result: ResultState<[ClientSearchRowDisplayable], ErrorDisplayable>) {
        self.dataSource = result
    }

    func buildRequestForSearchPerformer(withText text: String) -> AnyPublisher<Result<[ClientSearchRowDisplayable], ErrorDisplayable>, Error> {
        return self.clientsAdapter.searchClients(pageIndex: 0, searchText: text, clientListId: self.clientListId)
    }

    func handleSearchEvent(withText text: String) {
        Analytics.log(SearchPerformedEvent(source: .clients, query: text))
    }

    func isValidQuery(queryText: String) -> Bool {
        return queryText.count >= self.clientsAdapter.minimumNumberOfSearchCharacters()
    }
}

private extension BaseSearchClientsViewModel {
    enum Labels {
        static let navigationBarTitle = MKLocalizedString("clients.search.navigationBar.title",
                                                          comment: "Default client search view title")

        static let alertConfirmationClearButtonTitle = MKLocalizedString("clients.search.recently-searched.alert.clear-confirmation.button.title",
                                                                         comment: "Title for button when clearing recent clients searches")
        static let alertConfirmationClearTitle = MKLocalizedString("clients.search.recently-searched.alert.clear-confirmation.title",
                                                                   comment: "The title for the alert when clearing recent clients searches")
        static let alertConfirmationClearMessage = MKLocalizedString("clients.search.recently-searched.alert.clear-confirmation.message",
                                                                     comment: "Message for the alert when clearing recent clients searches")

        static let emptyTitle = MKLocalizedString("clients.search.empty.title",
                                                  comment: "Empty view title when there are no clients")
        static let emptySubtitle = MKLocalizedString("clients.search.empty.subtitle",
                                                     comment: "Empty view subtitle when there are no clients")

        static let recentlySearchedHelpBody = MKLocalizedString("clients.search.recently-searched.help.body", comment: "The help text body in the recently searched clients view")
        static let minimumNumberOfCharactersText = MKLocalizedString("client-search.required-query-length.error.title",
                                                                     comment: "Error message when text searched doesn't have required length")
    }
}

extension BaseSearchClientsViewModel {
    var recentSearchesData: RecentlySearchedData {
        return RecentlySearchedData(onRecentlySearchTapped: { [weak self] searchString in
            self?.recentSearchesPerformer.addToRecentSearches(text: searchString)
            self?.searchText = searchString
        },
        onClearTapped: self.resetRecentSearchesAlert,
        recentSearches: self.recentSearchesPerformer.recentSearches,
        recentlySearchedHelpBodyText: Labels.recentlySearchedHelpBody)
    }
}

extension RecentlySearchedView {
    init(viewModel: BaseSearchClientsViewModel) {
        self.init(onRecentlySearchTapped: viewModel.recentSearchTapped,
                  onClearTapped: viewModel.resetRecentSearchesAlert,
                  recentSearches: viewModel.recentSearchesPerformer.recentSearches,
                  recentlySearchedHelpBodyText: BaseSearchClientsViewModel.Labels.recentlySearchedHelpBody)
    }
}
