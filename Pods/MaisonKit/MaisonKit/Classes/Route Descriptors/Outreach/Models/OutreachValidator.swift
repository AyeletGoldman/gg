// Copyright © 2020 LVMH. All rights reserved.

import Foundation

/// A structure used to validate whether the outreach message we are about to send
/// is valid or not.
/// The outreach validator also decides whether or not the fields in the outreach message
/// are required.
public struct OutreachValidator {

    /// The types of errors that can be thrown by this validator
    public enum FormError: Error {
        case subjectEmpty
        case messageEmpty
        case invalidMessage
    }

    /// Creates a new `OutreachValidator`
    public init() { }

    /// Validates a subject and message for a given `OutreachType` and template `ContentType`.
    /// - Parameter outreachType: the type of outreach we are validating for e.g. email, sms, wechat
    /// - Parameter contentType: the content type of the outreach message; plain text or html, usually.
    /// - Parameter subject: the subject of the message. For outreach types that don't have a subject this is an empty string.
    /// - Parameter message: the body of the message.
    /// This method returns `Void` but throws a `FormError` if there is an error.
    public func validate(outreachType: OutreachType,
                         contentType: Template.ContentType,
                         subject: String,
                         message: String) throws {
        switch outreachType {
        case .email:
            try self.validateEmail(contentType: contentType, subject: subject, message: message)
        case .whatsapp:
            try self.validateWhatsApp(message: message)
        case .sms:
            try self.validateSMS(message: message)
        case .wechat:
            try self.validateWechat(message: message)
        case .lineWorks:
            try self.validateLineWorks(message: message)
        case .line:
            try self.validateLine(message: message)
        case .kakao:
            try self.validateKakao(message: message)
        case .call, .facetime:
            break
        }
    }

    /// Returns whether the subject field is required for the given `OutreachType`
    /// - Parameters:
    ///   - type: the type of outreach to check if it requires a subject or not
    ///   - templateContentType: the content type we are building
    /// - Returns: a boolean indicating whether or not a subject field should be displayed in the UI
    public func isSubjectRequired(for type: OutreachType, templateContentType: Template.ContentType = .text) -> Bool {
        return type == .email && templateContentType == .text
    }

    /// Returns whether the message field is required for the given `OutreachType`
    /// This function returns `true` always.
    /// - Parameters:
    ///   - type: the type of outreach to check if it requires a message or not
    ///   - templateContentType: the content type we are building
    /// - Returns: a boolean indicating whether or not a message field should be displayed in the UI
    public func isMessageRequired(for type: OutreachType, templateContentType: Template.ContentType = .text) -> Bool {
        return true
    }

    private func validateEmail(contentType: Template.ContentType, subject: String, message: String) throws {
        if self.isSubjectRequired(for: .email, templateContentType: contentType) &&
            subject.trimmingCharacters(in: .whitespaces).isEmpty {
            throw FormError.subjectEmpty
        }

        if self.isMessageRequired(for: .email, templateContentType: contentType) &&
            message.trimmingCharacters(in: .whitespaces).isEmpty {
            throw FormError.messageEmpty
        }
    }

    private func validateWhatsApp(message: String) throws {
        // Doesn't validate a subject, so we don't need to check for that
        guard self.isMessageRequired(for: .whatsapp) else {
            return
        }

        guard message.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) != nil else {
            throw FormError.invalidMessage
        }
        guard !message.isEmpty else {
            throw FormError.messageEmpty
        }
    }

    private func validateSMS(message: String) throws {
        // Doesn't validate a subject, so we don't need to check that
        guard self.isMessageRequired(for: .sms) else {
            return
        }
        if message.trimmingCharacters(in: .whitespaces).isEmpty {
            throw FormError.messageEmpty
        }
    }

    private func validateWechat(message: String) throws {
        // Doesn't validate a subject, so we don't need to check that
        guard self.isMessageRequired(for: .wechat) else {
            return
        }
        if message.trimmingCharacters(in: .whitespaces).isEmpty {
            throw FormError.messageEmpty
        }
    }

    private func validateLineWorks(message: String) throws {
        // Doesn't validate a subject, so we don't need to check that
        guard self.isMessageRequired(for: .lineWorks) else {
            return
        }
        if message.trimmingCharacters(in: .whitespaces).isEmpty {
            throw FormError.messageEmpty
        }
    }

    private func validateLine(message: String) throws {
        // Doesn't validate a subject, so we don't need to check that
        guard self.isMessageRequired(for: .line) else {
            return
        }
        guard message.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) != nil else {
            throw FormError.invalidMessage
        }
        guard !message.isEmpty else {
            throw FormError.messageEmpty
        }
    }

    private func validateKakao(message: String) throws {
        guard self.isMessageRequired(for: .kakao) else {
            return
        }
        guard message.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) != nil else {
            throw FormError.invalidMessage
        }
        guard !message.isEmpty else {
            throw FormError.messageEmpty
        }
    }
}
