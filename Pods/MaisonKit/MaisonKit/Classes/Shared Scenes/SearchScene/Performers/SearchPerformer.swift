// Copyright © 2020 LVMH. All rights reserved.

import Combine

protocol SearchPerformerDelegate: AnyObject {
    associatedtype ResultType
    func searchPerformerDidFindSearchResult(_ result: ResultState<ResultType, ErrorDisplayable>)
    func searchPerformerDidStartLoading()
    func buildRequestForSearchPerformer(withText text: String) -> AnyPublisher<Result<ResultType, ErrorDisplayable>, Error>
    func handleSearchEvent(withText text: String)
    func isValidQuery(queryText: String) -> Bool
}

extension SearchPerformerDelegate {
    func isValidQuery(queryText: String) -> Bool {
        return !queryText.isEmpty
    }
}

final class SearchPerformer<T, Delegate: SearchPerformerDelegate> where Delegate.ResultType == T {
    private typealias PipelinePublisher = AnyPublisher<PipelineResult, Never>
    private typealias PipelineResult = (result: ResultState<T, ErrorDisplayable>, text: String)

    private let searchText: CurrentValueSubject<String, Never> = CurrentValueSubject("")

    private var disposables = Set<AnyCancellable>()

    private(set) var lastSearch = ""
    weak var delegate: Delegate?
    private let requireDuplicateSearches: Bool

    init(requireDuplicateSearches: Bool = false) {
        self.requireDuplicateSearches = requireDuplicateSearches
        self.setupSearchSubject()
    }

    func performSearch(withText text: String) {
        self.searchText.send(text)
    }

    private func setupSearchSubject() {
        self.searchText
            .dropFirst() // We don't want the first event when we're setting up the subscription.
            .filter { [weak self] text in
                let isValid = self?.delegate?.isValidQuery(queryText: text) ?? false
                let isEmpty = text.isEmpty
                // We allow both empty and valid subscriptions
                // Because empty ones are handled when building the network request to return .waiting
                // and show the recently searched items. Doing this supports the "clear" button in the UI.
                return isValid || isEmpty
            }
            .removeDuplicates(by: { [weak self] previous, current in
                return previous == current && self?.requireDuplicateSearches == false
            }) // Remove duplicate searches
            .debounce(for: .milliseconds(200), scheduler: DispatchQueue.main) // same as Timer
            .handleEvents(receiveOutput: { [weak self] _ in // Start loading
                self?.delegate?.searchPerformerDidStartLoading()
            })
            .map { [weak self] (text) -> PipelinePublisher in // Transform search text to network request or failure
                guard let self = self else { return Just((.waiting, text: text)).eraseToAnyPublisher() }
                return self.buildNetworkRequestIfNecessary(text: text)
            }
            .switchToLatest()
            .sink(receiveValue: { [weak self] (result, text) in
                self?.delegate?.searchPerformerDidFindSearchResult(result)
                if result.isSuccess {
                    self?.lastSearch = text
                }
            })
            .store(in: &self.disposables)
    }

    private func buildNetworkRequestIfNecessary(text: String) -> PipelinePublisher {
        guard let delegate = self.delegate else {
            return Just((.waiting, text: text)).eraseToAnyPublisher()
        }
        // Decide if we want to make a request or not
        if text.isEmpty {
            return Just((.waiting, text: text)).eraseToAnyPublisher()
        } else {
            return delegate.buildRequestForSearchPerformer(withText: text)
                .map { [weak self] in
                    guard let self = self else { return (result: .waiting, text: text) }
                    return self.mapResultToResultState($0, with: text)
                }
                .catch { error in
                    return Just((result: .failed(ErrorDisplayable(error)), text: text))
                }.handleEvents(receiveOutput: { [weak self] (_, text) in
                    self?.delegate?.handleSearchEvent(withText: text)
                })
                .eraseToAnyPublisher()
        }
    }

    private func mapResultToResultState(_ result: Result<T, ErrorDisplayable>, with text: String) -> PipelineResult {
        switch result {
        case .failure(let error):
            return (result: .failed(error), text: text)
        case .success(let data):
            return (result: .found(data), text: text)
        }
    }
}
