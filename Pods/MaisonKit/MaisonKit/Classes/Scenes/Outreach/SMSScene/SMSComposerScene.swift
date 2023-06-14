// Copyright © 2021 LVMH. All rights reserved.

import Foundation

struct SMSComposerScene: Scene {

    private let messageData: MessageData
    private let onDone: (UIViewController, CancellableResult) -> Void

    init(messageData: MessageData, onDone: @escaping (UIViewController, CancellableResult) -> Void) {
        self.messageData = messageData
        self.onDone = onDone
    }

    func createViewController() -> SMSComposeViewController {
        return SMSComposeViewController()
    }

    func configure(controller: SMSComposeViewController,
                   using factory: SceneFactory) {

        controller.recipients = self.messageData.recipients
        controller.body = self.messageData.content

        controller.viewModel = SMSComposeViewModel(onDone: self.onDone)
    }
}
