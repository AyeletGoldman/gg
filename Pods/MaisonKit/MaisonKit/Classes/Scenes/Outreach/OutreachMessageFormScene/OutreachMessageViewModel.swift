// Copyright © 2020 LVMH. All rights reserved.

import Combine

struct OutreachMessage: Identifiable {
    let id = UUID()
    let recipient: String
    let subject: String?
    let message: String
    let callback: (CancellableResult) -> Void
}

enum InternalOutreachItemContext: Identifiable {
    case mail(OutreachMessage)
    case sms(OutreachMessage)

    var id: UUID {
        switch self {
        case .mail(let message), .sms(let message):
            return message.id
        }
    }
}

struct OutreachViewConfigurator {
    enum MessageType {
        case editableText
        case html
    }

    let showSubject: Bool
    let messageType: MessageType

    static let `default` = OutreachViewConfigurator()
    static let htmlContentTypeViewConfigurator = OutreachViewConfigurator(messageType: .html)
    static let noSubjectViewConfigurator = OutreachViewConfigurator(showSubject: false)

    init(showSubject: Bool = true, messageType: MessageType = .editableText) {
        self.showSubject = showSubject
        self.messageType = messageType
    }
}

final class OutreachMessageViewModel: ObservableObject {

    private enum Labels {
        static let editEmailNoticeText = MKLocalizedString("outreach.template-preview.email-notice.title",
                                                           comment: "A title to show above the email to tell the user they can edit it on the next step")
    }

    private let outreachType: OutreachType
    private let assetURLs: [URL]
    private let recipient: String?
    private let clientId: String
    private let validator: OutreachValidator
    private let onDone: OutreachCallback
    private var actionPerformer: OutreachActionPerformer?
    private let router: OutreachMessageFormRouter

    @Published var subject: String
    @Published var message: String
    @Published private(set) var isValidForm = false

    private var viewConfigurator: OutreachViewConfigurator {
        if self.templateContentType == .html {
            return .htmlContentTypeViewConfigurator
        }
        return self.outreachType == .email ? .default : .noSubjectViewConfigurator
    }

    private let template: Template?
    var templateContentType: Template.ContentType {
        return self.template?.contentType ?? .text
    }
    var shouldShowSubject: Bool {
        return self.viewConfigurator.showSubject
    }

    var messageFieldType: OutreachViewConfigurator.MessageType {
        return self.viewConfigurator.messageType
    }

    var isSubjectEditable: Bool {
        return self.templateContentType == .text
    }

    var isSubjectRequired: Bool {
        return self.validator.isSubjectRequired(for: self.outreachType, templateContentType: self.templateContentType)
    }

    var isMessageRequired: Bool {
        return self.validator.isMessageRequired(for: self.outreachType)
    }

    var noticeText: String? {
        let isHtml = self.template?.contentType == .html
        let isEmail = self.outreachType == .email
        return (isHtml && isEmail) ? Labels.editEmailNoticeText : nil
    }

    var shouldPresentInstructions: Bool {
        return !self.outreachType.getInstructions(hasImagesToShare: !self.assetURLs.isEmpty).isEmpty
    }

    var isBodyHTML: Bool {
        return self.templateContentType == .html
    }

    public init(outreachType: OutreachType,
                assetURLs: [URL],
                clientId: String,
                recipient: String?,
                template: Template?,
                validator: OutreachValidator = OutreachValidator(),
                onDone: @escaping OutreachCallback,
                router: OutreachMessageFormRouter) {
        self.outreachType = outreachType
        self.assetURLs = assetURLs
        self.clientId = clientId
        self.recipient = recipient
        self.onDone = onDone
        self.validator = validator
        self.message = template?.content ?? ""
        self.subject = template?.subject ?? ""
        self.template = template
        self.router = router
        self.setupValidFormListener()
    }

    private func setupValidFormListener() {
        self.$message.combineLatest(self.$subject).flatMap { [weak self, outreachType] in
            Just($0)
                .tryMap { (message, subject) -> Bool in
                    guard let self = self else { return false }
                    try self.validator.validate(outreachType: outreachType, contentType: self.templateContentType, subject: subject, message: message)
                    return true
                }.catch { _ in
                    return Just(false)
                }
        }
        .assign(to: &self.$isValidForm)
    }

    func didTapSendMessage() {
        self.actionPerformer = OutreachActionPerformer(outreachType: self.outreachType,
                                                       template: self.template,
                                                       clientId: self.clientId,
                                                       recipient: self.recipient,
                                                       subject: self.subject,
                                                       message: self.message,
                                                       onDone: self.onDone)

        if let outreachItem = self.actionPerformer?.performAction() {
            // present SMS/Mail
            let onDoneClosure: (CancellableResult) -> Void = { [outreachType, clientId, template, onDone] result in
                onDone(OutreachResult(outreachType: outreachType,
                                      templateId: template?.id,
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

    func didTapNext() {
        if self.shouldPresentInstructions {
            let instructionsData = InstructionsData(outreachType: self.outreachType,
                                                    assetURLs: self.assetURLs,
                                                    template: self.template,
                                                    clientId: self.clientId,
                                                    recipient: self.recipient,
                                                    subject: self.subject,
                                                    message: self.message,
                                                    urlOpener: UIApplication.shared,
                                                    onDone: self.onDone)
            self.router.presentInstructions(instructionsData: instructionsData)
        } else {
            self.didTapSendMessage()
        }
    }
}
