// Copyright © 2022 LVMH. All rights reserved.

import Foundation
import Combine

private struct Interaction {
    let publisher: VoidResultPublisher
    let onDone: ((Result<Void, ErrorDisplayable>) -> Void)?

    init<P: Publisher>(publisher: P, onDone: ((P.Output) -> Void)?) where P.Output == Result<Void, ErrorDisplayable>, P.Failure == Error {
        self.publisher = publisher.eraseToAnyPublisher()
        self.onDone = onDone
    }
}

final class OutreachPublisherHandler {

    private var interactions: [Interaction] = []

    private var cancellables = Set<AnyCancellable>()

    private var isBackgrounded = false
    private let notificationCenter: NotificationCenter

    init(notificationCenter: NotificationCenter = .default) {
        self.notificationCenter = notificationCenter
        notificationCenter.publisher(for: UIApplication.didEnterBackgroundNotification)
            .merge(with: notificationCenter.publisher(for: UIApplication.willResignActiveNotification))
            .sink { [weak self] _ in
                self?.isBackgrounded = true
            }.store(in: &self.cancellables)

        notificationCenter.publisher(for: UIApplication.willEnterForegroundNotification)
            .merge(with: notificationCenter.publisher(for: UIApplication.didBecomeActiveNotification))
            .sink { [weak self] _ in
                self?.isBackgrounded = false
                self?.clearQueue()
            }.store(in: &self.cancellables)
    }

    func sinkPublisherWhenNeeded<P: Publisher>(_ publisher: P,
                                               onDone: ((P.Output) -> Void)?) where P.Output == Result<Void, ErrorDisplayable>,
                                                                                                            P.Failure == Error {
        DispatchQueue.main.async {
            if self.isBackgrounded {
                let interaction = Interaction(publisher: publisher,
                                              onDone: onDone)
                self.interactions.append(interaction)
            } else {
                self.sinkPublisher(publisher, onDone: onDone)
            }
        }
    }

    private func clearQueue() {
        for interaction in interactions {
            self.sinkPublisher(interaction.publisher, onDone: interaction.onDone)
        }
        self.interactions.removeAll()
    }

    private func sinkPublisher<P: Publisher>(_ publisher: P,
                                             onDone: ((P.Output) -> Void)?) where P.Output == Result<Void, ErrorDisplayable>,
                                                                                                            P.Failure == Error {
        publisher
            .catch { return Just(.failure(ErrorDisplayable($0))) }
            .sink(receiveValue: { result in
                onDone?(result)
            })
            .store(in: &self.cancellables)
    }
}
