// Copyright © 2021 LVMH. All rights reserved.

import Foundation
import Combine

/// An instructions view model.
/// The screen for this view model is presented when a user wants to perform an interaction
/// with a client and there are additional instructions to be done that cannot be done automatically.
///
/// The exact situations are:
/// - During all product shares
/// - During a WeChat interaction when contacting a client directly.
final class InstructionsViewModel: ObservableObject {

    private enum Labels {
        static let smsOutreachInstructionTitle = MKLocalizedString("outreach.instructions.title.sms", comment: "The outreach instructions title for sms")
        static let emailOutreachInstructionTitle = MKLocalizedString("outreach.instructions.title.email", comment: "The outreach instructions title for email")
        static let lineWorksOutreachInstructionTitle = MKLocalizedString("outreach.instructions.title.lineworks", comment: "The outreach instructions title for lineworks")
        static let whatsappOutreachInstructionTitle = MKLocalizedString("outreach.instructions.title.whatsapp", comment: "The outreach instructions title for whatsapp")
        static let wechatOutreachInstructionTitle = MKLocalizedString("outreach.instructions.title.wechat", comment: "The outreach instructions title for wechat")
        static let lineOutreachInstructionTitle = MKLocalizedString("outreach.instructions.title.line", comment: "The outreach instructions title for line")
        static let kakaoOutreachInstructionTitle = MKLocalizedString("outreach.instructions.title.kakao", comment: "The outreach instructions title for Kakao")

        static let smsDontForgetMessage = MKLocalizedString("outreach.instructions.dont-forget.message.sms",
                                                            comment: "The message for the don't forget part of the instructions for sms")
        static let emailDontForgetMessage = MKLocalizedString("outreach.instructions.dont-forget.message.email",
                                                              comment: "The message for the don't forget part of the instructions for email")
        static let lineWorksDontForgetMessage = MKLocalizedString("outreach.instructions.dont-forget.message.lineworks",
                                                                  comment: "The message for the don't forget part of the instructions for lineworks")
        static let whatsappDontForgetMessage = MKLocalizedString("outreach.instructions.dont-forget.message.whatsapp",
                                                                 comment: "The message for the don't forget part of the instructions for whatsapp")
        static let wechatDontForgetMessage = MKLocalizedString("outreach.instructions.dont-forget.message.wechat",
                                                               comment: "The message for the don't forget part of the instructions for wechat")
        static let lineDontForgetMessage = MKLocalizedString("outreach.instructions.dont-forget.message.line",
                                                             comment: "The message for the don't forget part of the instructions for line")
        static let kakaoDontForgetMessage = MKLocalizedString("outreach.instructions.dont-forget.message.kakao",
                                                              comment: "The message for the don't forget part of the instructions for line")

        static let smsContinueButtonTitle = MKLocalizedString("outreach.instructions.continue-button.title.sms",
                                                              comment: "The title for the button that sends the user to the third party app for sms")
        static let emailContinueButtonTitle = MKLocalizedString("outreach.instructions.continue-button.title.email",
                                                                comment: "The title for the button that sends the user to the third party app for email")
        static let lineWorksContinueButtonTitle = MKLocalizedString("outreach.instructions.continue-button.title.lineworks",
                                                                    comment: "The title for the button that sends the user to lineworks")
        static let whatsappContinueButtonTitle = MKLocalizedString("outreach.instructions.continue-button.title.whatsapp",
                                                                   comment: "The title for the button that sends the user to whatsapp")
        static let wechatContinueButtonTitle = MKLocalizedString("outreach.instructions.continue-button.title.wechat",
                                                                 comment: "The title for the button that sends the user to wechat")
        static let lineContinueButtonTitle = MKLocalizedString("outreach.instructions.continue-button.title.line",
                                                               comment: "The title for the button that sends the user to line")
        static let kakaoContinueButtonTitle = MKLocalizedString("outreach.instructions.continue-button.title.kakao",
                                                                comment: "The title for the button that sends the user to Kakao")

        static let picturesDownloadFailedToastErrorTitle = MKLocalizedString("outreach.toast.error.pictures-download.title",
                                                                             comment: "Message to show on a toast view when a the pictures download has failed")

        static let settingsAlertTitle = MKLocalizedString("outreach.instructions.alert.settings.title",
                                                          comment: "The title for the alert when a user has denied access to his photo but still want to save some in it")
        static let settingsAlertMessage = MKLocalizedString("outreach.instructions.alert.settings.message",
                                                            comment: "The message for the alert when a user has denied access to his photo but still want to save some in it")
        static let settingsAlertActionTitle = MKLocalizedString("outreach.instructions.alert.settings.action",
                                                                comment: "The action for the alert when a user has denied access to his photo but still want to save some in it")
    }

    var instructionsSubtitle: String? {
        switch outreachType {
        case .call, .facetime:
            return nil
        case .sms:
            return Labels.smsDontForgetMessage
        case .email:
            return Labels.emailDontForgetMessage
        case .lineWorks:
            return Labels.lineWorksDontForgetMessage
        case .whatsapp:
            return Labels.whatsappDontForgetMessage
        case .wechat:
            return Labels.wechatDontForgetMessage
        case .line:
            return Labels.lineDontForgetMessage
        case .kakao:
            return Labels.kakaoDontForgetMessage
        }
    }

    var instructionsButtonTitle: String {
        switch outreachType {
        case .call, .facetime:
            // This isn't used, because you never get here from a "call" sharing.
            return "Call"
        case .sms:
            return Labels.smsContinueButtonTitle
        case .email:
            return Labels.emailContinueButtonTitle
        case .lineWorks:
            return Labels.lineWorksContinueButtonTitle
        case .whatsapp:
            return Labels.whatsappContinueButtonTitle
        case .wechat:
            return Labels.wechatContinueButtonTitle
        case .line:
            return Labels.lineContinueButtonTitle
        case .kakao:
            return Labels.kakaoContinueButtonTitle
        }
    }

    var instructionsDisplayable: InstructionsDisplayable? {
        let instructions = self.outreachType.getInstructions(hasImagesToShare: !self.assetURLs.isEmpty)
        switch outreachType {
        case .call, .facetime:
            // This isn't used, because you never get here from a "call" or "facetime" sharing.
            return nil
        case .sms:
            return InstructionsDisplayable(title: Labels.smsOutreachInstructionTitle, instructions: instructions)
        case .email:
            return InstructionsDisplayable(title: Labels.emailOutreachInstructionTitle, instructions: instructions)
        case .lineWorks:
            return InstructionsDisplayable(title: Labels.lineWorksOutreachInstructionTitle, instructions: instructions)
        case .whatsapp:
            return InstructionsDisplayable(title: Labels.whatsappOutreachInstructionTitle, instructions: instructions)
        case .wechat:
            return InstructionsDisplayable(title: Labels.wechatOutreachInstructionTitle, instructions: instructions)
        case .line:
            return InstructionsDisplayable(title: Labels.lineOutreachInstructionTitle, instructions: instructions)
        case .kakao:
            return InstructionsDisplayable(title: Labels.kakaoOutreachInstructionTitle, instructions: instructions)
        }
    }

    var showSaveImagesToggle: Bool {
        return !self.assetURLs.isEmpty
    }

    @Published var isToggleOn = true
    @Published var alertContext: AlertContext?
    @Published var picturesDownload: ResultState<Bool, Error> = .waiting
    private var cancellables = Set<AnyCancellable>()

    private let outreachType: OutreachType
    private let assetURLs: [URL]
    private let templateContentType: Template.ContentType?
    private let assetDownloader: AssetDownloader
    private let actionPerformer: OutreachActionPerformer
    private let urlOpener: URLOpener
    private let clientId: String
    private let onDone: OutreachCallback
    private let router: InstructionsRouter

    var isBodyHTML: Bool {
        return self.templateContentType == .html
    }

    init(outreachType: OutreachType,
         assetURLs: [URL],
         template: Template?,
         clientId: String,
         recipient: String?,
         subject: String,
         message: String,
         urlOpener: URLOpener = UIApplication.shared,
         router: InstructionsRouter,
         onDone: @escaping OutreachCallback) {
        self.outreachType = outreachType
        self.assetURLs = assetURLs
        self.assetDownloader = AssetDownloader()
        self.templateContentType = template?.contentType
        self.urlOpener = urlOpener
        self.clientId = clientId
        self.onDone = onDone
        self.router = router

        self.actionPerformer = OutreachActionPerformer(outreachType: outreachType,
                                                       template: template,
                                                       clientId: clientId,
                                                       recipient: recipient,
                                                       subject: subject,
                                                       message: message,
                                                       onDone: onDone)
    }

    func didTapOpenAppButton() {
        let performAction = { [weak self] in
            guard let self = self else { return }
            if let outreachItem = self.actionPerformer.performAction() {
                // present SMS/Mail
                let outreachType = self.outreachType
                let clientId = self.clientId
                let onDone = self.onDone
                let onDoneClosure: (CancellableResult) -> Void = { result in
                    onDone(OutreachResult(outreachType: outreachType,
                                          clientId: clientId,
                                          resultStatus: result))
                }
                switch outreachItem {
                case .mail(let message):
                    self.router.presentMailComposer(emailData: EmailData(emails: [message.recipient],
                                                                         subject: message.subject,
                                                                         body: message.message,
                                                                         isBodyHtml: self.isBodyHTML),
                                                    onDone: onDoneClosure)
                case .sms(let message):
                    self.router.presentSMSComposer(messageData: MessageData(recipients: [message.recipient],
                                                                            content: message.message),
                                                   onDone: onDoneClosure)
                }
            }
        }

        if self.isToggleOn, !self.assetURLs.isEmpty {
            self.downloadAssets(assetURLs: self.assetURLs, performAction: performAction)
        } else {
            performAction()
        }
    }

    private func downloadAssets(assetURLs: [URL], performAction: @escaping () -> Void) {
        self.picturesDownload = .loading(true)
        self.assetDownloader.downloadAndSaveAssets(assetURLs: assetURLs)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    DispatchQueue.main.async {
                        switch error {
                        case AssetDownloader.AssetDownloaderError.accessDeniedToLibrary:
                            self.buildOpenSettingsAlertContext()
                        default:
                            ToastView.show(text: Labels.picturesDownloadFailedToastErrorTitle, style: .error)
                        }
                        self.picturesDownload = .found(false)
                    }
                case .finished: break
                }

            }, receiveValue: { succeeded in
                DispatchQueue.main.async {
                    self.picturesDownload = .found(succeeded)
                    performAction()
                }
            }).store(in: &cancellables)
    }

    private func buildOpenSettingsAlertContext() {
        let settingsButton = AlertContext.Button(title: Labels.settingsAlertActionTitle,
                                                 style: .default(action: { [weak self] in
                                                    self?.openAppSettings()
                                                 }))
        self.alertContext = AlertContext(title: Labels.settingsAlertTitle,
                                         message: Labels.settingsAlertMessage,
                                         primaryButton: .cancel(),
                                         secondaryButton: settingsButton)
    }

    private func openAppSettings() {
        self.urlOpener.openAppSettingsURL()
    }
}
