// MH Private Clienteling
// 14/09/2022

import Foundation
import Combine
import MaisonKit

class DashboardStore {
    private let dashboardSubject = CurrentValueSubject<Result<DashboardDisplayable, ErrorDisplayable>?, Error>(nil)
    private let networking: MaisonKitNetworking
    private var cancellables = Set<AnyCancellable>()
    
    @Published var runningUser: String?
    
    init(networking: MaisonKitNetworking) {
        self.networking = networking
        listenToChanges()
    }

    private func listenToChanges() {
        $runningUser
            .removeDuplicates { oldRunningUser, newRunningUser in
                return oldRunningUser == nil && newRunningUser == nil
            }
            .dropFirst()
            .sink(receiveValue: { [weak self] in self?.startFetchingDashboard(runningUser: $0, refresh: true) })
            .store(in: &cancellables)
        
        Task { [weak self] in
            let notifications = NotificationCenter.default.notifications(named: .userDidLoginNotificationName)
            for await _ in notifications {
                guard let self else { return }
                self.startFetchingDashboard(runningUser: self.runningUser, refresh: true)
            }
        }
        
        Task { [weak self] in
            let notifications = NotificationCenter.default.notifications(named: Self.downloadDashboardsOnStart)
            for await _ in notifications {
                guard let self else { return }
                self.runningUser = nil
                self.startFetchingDashboard(runningUser: self.runningUser, refresh: false)
            }
        }
    }

    /// Converting the subject to `AnyPublisher` in order to return it in the `DashboardAdapter`
    var dashboardPublisher: AnyPublisher<Result<DashboardDisplayable, ErrorDisplayable>, Error> {
        return dashboardSubject
            .receive(on: RunLoop.main)
            .compactMap { $0 }
            .eraseToAnyPublisher()
    }
    
    /// This function fetches the dashboard
    /// - Parameters:
    ///   - runningUser: the running user to fetch the dashboard for
    private func startFetchingDashboard(runningUser: String?, refresh: Bool = false) {
        guard let userId = MaisonKitUser.currentLoggedInUser?.id else { return }
        // clear the current dashboard state
        dashboardSubject.value = nil
        Task { [weak dashboardSubject, weak networking] in
            guard let dashboardSubject, let networking else { return }
            do {
                let response = try await networking.dashboardsControllerFindOneByDashboardId(userId: userId, runningUser: runningUser, refreshDashboard: refresh)
                    .unwrapDefaultSuccessResponse().asyncValue
                // publish dashboard
                dashboardSubject.value = .success(DashboardDisplayable(response.data.result))
            } catch {
                // publish error
                dashboardSubject.value = .failure(ErrorDisplayable(error))
            }
        }
    }
    
    static var downloadDashboardsOnStart = NSNotification.Name("downloadDashboardsOnStart")
}

public extension Publisher {
    var asyncValue: Output {
        get async throws {
            try await withCheckedThrowingContinuation { continuation in
                var cancellable: AnyCancellable?
                cancellable = first()
                    .sink { result in
                        switch result {
                        case .finished:
                            break
                        case let .failure(error):
                            continuation.resume(throwing: error)
                        }
                        cancellable?.cancel()
                    } receiveValue: { value in
                        continuation.resume(returning: value)
                    }
            }
        }
    }
}

