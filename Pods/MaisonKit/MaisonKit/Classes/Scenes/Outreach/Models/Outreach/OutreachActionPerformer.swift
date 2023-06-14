// Copyright © 2021 LVMH. All rights reserved.

import Foundation
import SwiftUI

struct OutreachActionPerformer {

    private enum Labels {
        static let outreachToastErrorNoSMSTitle =  MKLocalizedString("outreach.toast.error.no-sms-available.title",
                                                                     comment: "Message to show on a toast view when a user cannot use text messaging")
        static let outreachToastErrorNoEmailTitle = MKLocalizedString("outreach.toast.error.no-email-available.title",
                                                                      comment: "Message to show on a toast view when a user cannot use emailing")

        static let outreachFailedToastErrorFormat = MKLocalizedString("outreach.toast.error",
                                                                      comment: """
            Toast message to show when an outreach failed with an error. The error's description is passed in as a parameter.
            """)
        static let outreachFailedToastErrorUnknownTitle = MKLocalizedString("outreach.toast.error.unknown.title",
                                                                            comment: "Toast message to show when an outreach failed with an unknown error")
        static let outreachSucceededToastTitle = MKLocalizedString("outreach.toast.success.title",
                                                                   comment: "Toast message to show when outreach was successful")
    }

    private let outreachType: OutreachType
    private let template: Template?
    private let clientId: String
    private let recipient: String?
    private let onDone: OutreachCallback
    private let subject: String
    private let message: String

    /// We only show success toast for email and sms because they are the only methods we get a callback telling us if
    /// the outreach is successful or not.
    private var shouldShowSuccessToast: Bool {
        return self.outreachType == .email || self.outreachType == .sms
    }

    init(outreachType: OutreachType,
         template: Template?,
         clientId: String,
         recipient: String?,
         subject: String,
         message: String,
         onDone: @escaping OutreachCallback) {
        self.outreachType = outreachType
        self.template = template
        self.clientId = clientId
        self.recipient = recipient
        self.onDone = onDone
        self.subject = subject
        self.message = message
    }

    // swiftlint:disable:next function_body_length
    func performAction() -> InternalOutreachItemContext? {
        let callback: (CancellableResult) -> Void = { result in
            self.showToast(for: result)
            let outreachResult = OutreachResult(outreachType: self.outreachType,
                                                templateId: self.template?.id,
                                                templateName: self.template?.name,
                                                clientId: self.clientId,
                                                resultStatus: result)
            self.onDone(outreachResult)
        }
        switch self.outreachType {
        case .call, .facetime:
            // Do nothing, this isn't handled by outreach
            break
        case .sms:
            if Messaging.canSendTextMessage {
                return .sms(self.buildOutreachMessage(callback: callback))
            } else {
                ToastView.show(text: Labels.outreachToastErrorNoSMSTitle, style: .error)
            }
        case .email:
            if Mail.canSendMail {
                return .mail(self.buildOutreachMessage(callback: callback))
            } else {
                ToastView.show(text: Labels.outreachToastErrorNoEmailTitle, style: .error)
            }
        case .lineWorks:
            let message = self.buildOutreachMessage(callback: callback)
            let action = LineWorksOutreachAction()
            action.perform(withMessage: message)
        case .whatsapp:
            let message = self.buildOutreachMessage(callback: callback)
            let action = WhatsappOutreachAction()
            action.perform(withMessage: message)
        case .wechat:
            UIPasteboard.general.copyToPasteboard(self.message)
            let message = self.buildOutreachMessage(callback: callback)
            let action = WechatOutreachAction()
            action.perform(withMessage: message)
        case .line:
            let message = self.buildOutreachMessage(callback: callback)
            let action = LineOutreachAction()
            action.perform(withMessage: message)
        case .kakao:
            UIPasteboard.general.copyToPasteboard(self.message)
            let message = self.buildOutreachMessage(callback: callback)
            let action = KakaoOutreachAction()
            action.perform(withMessage: message)
        }
        return nil
    }

    private func buildOutreachMessage(callback: @escaping (CancellableResult) -> Void) -> OutreachMessage {
        return OutreachMessage(recipient: self.recipient ?? "",
                               subject: self.subject,
                               message: self.message,
                               callback: callback)
    }

    private func showToast(for result: CancellableResult) {
        switch result {
        case .failure(let error):
            if let error = error {
                let format = Labels.outreachFailedToastErrorFormat
                let message = String(format: format, error.localizedDescription)
                ToastView.show(text: message, style: .error)
            } else {
                ToastView.show(text: Labels.outreachFailedToastErrorUnknownTitle,
                               style: .error)
            }
        case .success:
            if self.shouldShowSuccessToast {
                ToastView.show(text: Labels.outreachSucceededToastTitle,
                               style: .success)
            }
        case .cancelled:
            // Do nothing, the user cancelled.
            break
        }
    }
}
