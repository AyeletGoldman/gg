// Copyright © 2020 LVMH. All rights reserved.

import Foundation
import Biodag
import Combine
import SwiftUI

/// View model for the `NotificationCenterView`
/// Is responsible of the data displayed and the contact action handling
final class NotificationCenterViewModel: ObservableObject {

    @Published private(set) var displayable: ResultState<NotificationCenterDisplayable, ErrorDisplayable> = .waiting
    @Published var showOnlyUnread = false

    private var refreshTask: Task<NotificationCenterDisplayable, Error>?
    private var fetchTask: Task<Void, Never>?

    private let router: NotificationCenterRouter
    @Inject private var adapter: NotificationCenterAdapter

    init(router: NotificationCenterRouter) {
        self.router = router
    }

    @MainActor
    private func handleAdapterResult(_ result: Result<NotificationCenterDisplayable, ErrorDisplayable>) {
        switch result {
        case .failure(let error):
            self.displayable = .failed(error)
        case .success(let displayable):
            self.displayable = .found(displayable)
        }
    }

    func fetchData(force: Bool = false) {
        guard self.displayable.isWaiting || self.displayable.isFailed || force else {
            return
        }
        self.listenToDataChanges()
    }

    @MainActor
    func refreshData() async {
        let publisher = self.adapter.getNotificationCenterItems()
        let task = Task {
            return try await publisher.getResultAsync()
        }
        self.refreshTask = task
        let result = await task.result.mapError { ErrorDisplayable($0) }
        self.handleAdapterResult(result)
    }

    private func listenToDataChanges() {
        self.displayable = .loading(nil)
        let stream = self.adapter.getNotificationCenterItems().values
        let task = Task { [weak self] in
            do {
                for try await result in stream {
                    await self?.handleAdapterResult(result)
                }
            } catch {
                await self?.handleAdapterResult(.failure(ErrorDisplayable(error)))
            }
        }
        self.fetchTask = task
    }

    func getFilteredItems(for sections: [NotificationCenterSection]) -> [NotificationCenterSection] {
        guard self.showOnlyUnread else {
            return sections
        }
        return sections.reduce([NotificationCenterSection]()) { partialResult, section in
            let sectionItems = section.items.filter { !$0.isRead }
            if sectionItems.isEmpty {
                return partialResult
            } else {
                return partialResult + [NotificationCenterSection(id: section.id,
                                                                  sectionTitle: section.sectionTitle,
                                                                  items: sectionItems)]
            }
        }
    }

    func getTotalFilteredItems(for sections: [NotificationCenterSection]) -> Int {
        self.getFilteredItems(for: sections).map { $0.items.count }.reduce(0, +)
    }

    func markItemAsReadOrUnread(_ notificationItem: NotificationCenterRow) {
        let publisher = notificationItem.isRead ? self.adapter.markItemAsUnread(itemID: notificationItem.id) : self.adapter.markItemAsRead(itemID: notificationItem.id)
        self.updateNotification(notificationItem, read: !notificationItem.isRead, publisher: publisher)
    }

    private func copySectionsChangingReadStatus(ofItemID id: NotificationCenterRow.ID, toValue value: Bool) -> [NotificationCenterSection] {
        let sections = self.displayable.value?.sections ?? []
        return sections.map {
            let newItems = $0.items.map { item in
                let isRead = item.id == id ? value : item.isRead
                return NotificationCenterRow(id: item.id, cellProvider: item.cellProvider, action: item.action, isRead: isRead)
            }
            return NotificationCenterSection(id: $0.id, sectionTitle: $0.sectionTitle, items: newItems)
        }
    }

    @MainActor
    private func handlePublisher<P: Publisher>(_ publisher: P,
                                               itemID: NotificationCenterRow.ID,
                                               isRead: Bool) async where P.Output == Result<Void, ErrorDisplayable>, P.Failure == Error {
        do {
            let result = try await publisher.getAsync()
            switch result {
            case .failure(let error):
                ToastView.show(text: error.localizedDescription, style: .error)
                // Revert the changes done before
                let newSections = self.copySectionsChangingReadStatus(ofItemID: itemID, toValue: !isRead)
                self.displayable = .found(NotificationCenterDisplayable(sections: newSections))
            case .success:
                break
            }
        } catch {
            ToastView.show(text: error.localizedDescription, style: .error)
        }
    }

    func didTapItem(_ item: NotificationCenterRow) {
        guard let action = item.action else { return }
        self.handleActionType(action: action)
        if !item.isRead {
            self.updateNotification(item, read: true, publisher: self.adapter.markItemAsRead(itemID: item.id))
        }
    }

    private func updateNotification<P: Publisher>(_ item: NotificationCenterRow,
                                                  read isRead: Bool,
                                                  publisher: P) where P.Output == Result<Void, ErrorDisplayable>, P.Failure == Error {
        let newSections = self.copySectionsChangingReadStatus(ofItemID: item.id, toValue: isRead)
        self.displayable = .found(NotificationCenterDisplayable(sections: newSections))
        Task {
            await self.handlePublisher(publisher, itemID: item.id, isRead: isRead)
        }
    }
}

extension NotificationCenterViewModel: ActionHandlerViewModel {
    var actionHandlingRouter: ActionScenePresenterRouter {
        return self.router
    }
}
