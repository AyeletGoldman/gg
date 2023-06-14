// Copyright © 2022 LVMH. All rights reserved.

import Foundation

public extension OutreachSelectionEntry {

    /// Creates a `.wechat` type `OutreachSelectionEntry`
    /// - Parameters:
    ///   - isPreferred: Whether this action is the preferred action or not
    /// - Returns: A configured `OutreachSelectionEntry`
    static func wechat(isPreferred: Bool = false) -> OutreachSelectionEntry {
        let item = OutreachSelectionItemDisplayable.wechat(isPreferred: isPreferred)
        return .item(OutreachSelectionEntryItem(item: item,
                                                recipient: nil,
                                                outreachType: .wechat))
    }

    /// Creates a `.call` type `OutreachSelectionEntry`
    /// - Parameters:
    ///   - recipients: The recipients for the call action.
    ///   - isPreferred: Whether this action is the preferred action or not
    /// - Returns: A configured `OutreachSelectionEntry`
    static func call(recipients: [String], isPreferred: Bool = false) -> OutreachSelectionEntry {
        let item = OutreachSelectionItemDisplayable.call(isPreferred: isPreferred)
        if recipients.count > 1 {
            return .expandableItem(OutreachSelectionParentEntryItem(item: item,
                                                                    children: recipients.map { .recipients(for: .call, $0) }))
        } else {
            return .item(OutreachSelectionEntryItem(item: item,
                                                    recipient: recipients.first,
                                                    outreachType: .call))
        }
    }

    /// Creates a `.facetime` type `OutreachSelectionEntry`
    /// - Parameters:
    ///   - recipients: The recipients for the FaceTime action.
    ///   - isPreferred: Whether this action is the preferred action or not
    /// - Returns: A configured `OutreachSelectionEntry`
    static func facetime(recipients: [String], isPreferred: Bool = false) -> OutreachSelectionEntry {
        let item = OutreachSelectionItemDisplayable.facetime(isPreferred: isPreferred)
        if recipients.count > 1 {
            return .expandableItem(OutreachSelectionParentEntryItem(item: item,
                                                                    children: recipients.map { .recipients(for: .facetime, $0) }))
        } else {
            return .item(OutreachSelectionEntryItem(item: item,
                                                    recipient: recipients.first,
                                                    outreachType: .facetime))
        }
    }

    /// Creates a `.sms` type `OutreachSelectionEntry`
    /// - Parameters:
    ///   - recipients: The recipients for the SMS action.
    ///   - isPreferred: Whether this action is the preferred action or not
    /// - Returns: A configured `OutreachSelectionEntry`
    static func sms(recipients: [String], isPreferred: Bool = false) -> OutreachSelectionEntry {
        let item = OutreachSelectionItemDisplayable.sms(isPreferred: isPreferred)
        if recipients.count > 1 {
            return .expandableItem(OutreachSelectionParentEntryItem(item: item,
                                                                    children: recipients.map { .recipients(for: .sms, $0) }))
        } else {
            return .item(OutreachSelectionEntryItem(item: item,
                                                    recipient: recipients.first,
                                                    outreachType: .sms))
        }
    }

    /// Creates a `.email` type `OutreachSelectionEntry`
    /// - Parameters:
    ///   - recipients: The recipients for the email action.
    ///   - isPreferred: Whether this action is the preferred action or not
    /// - Returns: A configured `OutreachSelectionEntry`
    static func email(recipients: [String], isPreferred: Bool = false) -> OutreachSelectionEntry {
        let item = OutreachSelectionItemDisplayable.email(isPreferred: isPreferred)
        if recipients.count > 1 {
            return .expandableItem(OutreachSelectionParentEntryItem(item: item,
                                                                    children: recipients.map { .recipients(for: .email, $0) }))
        } else {
            return .item(OutreachSelectionEntryItem(item: item,
                                                    recipient: recipients.first,
                                                    outreachType: .email))
        }
    }

    /// Creates a `.whatsapp` type `OutreachSelectionEntry`
    /// - Parameters:
    ///   - recipients: The recipients for the whatsapp action.
    ///   - isPreferred: Whether this action is the preferred action or not
    /// - Returns: A configured `OutreachSelectionEntry`
    static func whatsapp(recipients: [String], isPreferred: Bool = false) -> OutreachSelectionEntry {
        let item = OutreachSelectionItemDisplayable.whatsapp(isPreferred: isPreferred)
        if recipients.count > 1 && WhatsappOutreachAction.isAvailable {
            return .expandableItem(OutreachSelectionParentEntryItem(item: item,
                                                                    children: recipients.map { .recipients(for: .whatsapp, $0) }))
        } else {
            return .item(OutreachSelectionEntryItem(item: item,
                                                    recipient: recipients.first,
                                                    outreachType: .whatsapp))
        }
    }

    /// Creates a `.line` type `OutreachSelectionEntry`
    /// - Parameters:
    ///   - isPreferred: Whether this action is the preferred action or not
    /// - Returns: A configured `OutreachSelectionEntry`
    static func line(isPreferred: Bool = false) -> OutreachSelectionEntry {
        let item = OutreachSelectionItemDisplayable.line(isPreferred: isPreferred)
        return .item(OutreachSelectionEntryItem(item: item,
                                                recipient: nil,
                                                outreachType: .line))
    }

    /// Creates a `.lineWorks` type `OutreachSelectionEntry`
    /// - Parameters:
    ///   - isPreferred: Whether this action is the preferred action or not
    /// - Returns: A configured `OutreachSelectionEntry`
    static func lineWorks(isPreferred: Bool = false) -> OutreachSelectionEntry {
        let item = OutreachSelectionItemDisplayable.lineWorks(isPreferred: isPreferred)
        return .item(OutreachSelectionEntryItem(item: item,
                                                recipient: nil,
                                                outreachType: .lineWorks))
    }

    /// Creates a `.kakao` type `OutreachSelectionEntry`
    /// - Parameters:
    ///   - isPreferred: Whether this action is the preferred action or not
    /// - Returns: A configured `OutreachSelectionEntry`
    static func kakao(isPreferred: Bool = false) -> OutreachSelectionEntry {
        let item = OutreachSelectionItemDisplayable.kakao(isPreferred: isPreferred)
        return .item(OutreachSelectionEntryItem(item: item,
                                                recipient: nil,
                                                outreachType: .kakao))
    }
}

private extension OutreachSelectionEntryItem {
    static func recipients(for outreachType: OutreachType, _ recipient: String) -> OutreachSelectionEntryItem {
        return .init(item: OutreachSelectionItemDisplayable(icon: nil,
                                                            title: recipient,
                                                            tag: nil,
                                                            body: nil,
                                                            trailingIcon: nil),
                     recipient: recipient,
                     outreachType: outreachType)
    }
}

private extension OutreachSelectionItemDisplayable {

    private enum Labels {
        static let isPreferredLabel = MKLocalizedString("outreach-selection.item.is-preferred.label.title",
                                                        comment: "The title for the label to show if an outreach type is preferred")
        static let installAppLabel = MKLocalizedString("outreach-selection.item.install-app.label.title",
                                                       comment: "The title for the label to show to send the user to the app store")
        static let phoneLabel = MKLocalizedString("outreach-selection.item.phone.label.title",
                                                  comment: "The title for the label to show to allow the user to call a client")

        static let wechatAppName = MKLocalizedString("outreach-selection.item.wechat",
                                                     comment: "The name of the app WeChat")
        static let faceTimeAppName = MKLocalizedString("outreach-selection.item.facetime",
                                                     comment: "The name of the app FaceTime")
        static let SMSAppName = MKLocalizedString("outreach-selection.item.sms",
                                                     comment: "The name of the app SMS")
        static let emailAppName = MKLocalizedString("outreach-selection.item.email",
                                                     comment: "The name of the app email")
        static let whatsAppAppName = MKLocalizedString("outreach-selection.item.whatsapp",
                                                     comment: "The name of the app WhatsApp")
        static let lineAppName = MKLocalizedString("outreach-selection.item.line",
                                                     comment: "The name of the app Line")
        static let lineWorksAppName = MKLocalizedString("outreach-selection.item.lineworks",
                                                     comment: "The name of the app LineWorks")
        static let kakaoAppName = MKLocalizedString("outreach-selection.item.kakao",
                                                     comment: "The name of the app Kakao")
    }

    private enum Constants {
        static let launchAppStoreIcon = ImageSource.styledImage(identifier: "icon-launch")
    }

    static func wechat(isPreferred: Bool = false) -> OutreachSelectionItemDisplayable {
        return OutreachSelectionItemDisplayable(icon: .styledImage(identifier: "icon-wechat-app"),
                                                title: Labels.wechatAppName,
                                                tag: isPreferred ? Labels.isPreferredLabel : nil,
                                                body: WechatOutreachAction.isAvailable ? nil : Labels.installAppLabel,
                                                trailingIcon: WechatOutreachAction.isAvailable ? nil : Constants.launchAppStoreIcon)
    }

    static func call(isPreferred: Bool = false) -> OutreachSelectionItemDisplayable {
        return OutreachSelectionItemDisplayable(icon: .styledImage(identifier: "icon-call"),
                                                title: Labels.phoneLabel,
                                                tag: isPreferred ? Labels.isPreferredLabel : nil,
                                                body: nil,
                                                trailingIcon: nil)
    }

    static func facetime(isPreferred: Bool = false) -> OutreachSelectionItemDisplayable {
        return OutreachSelectionItemDisplayable(icon: .styledImage(identifier: "icon-facetime"),
                                                title: Labels.faceTimeAppName,
                                                tag: isPreferred ? Labels.isPreferredLabel : nil,
                                                body: nil,
                                                trailingIcon: nil)
    }

    static func sms(isPreferred: Bool = false) -> OutreachSelectionItemDisplayable {
        return OutreachSelectionItemDisplayable(icon: .styledImage(identifier: "icon-sms-app"),
                                                title: Labels.SMSAppName,
                                                tag: isPreferred ? Labels.isPreferredLabel : nil,
                                                body: nil,
                                                trailingIcon: nil)
    }

    static func email(isPreferred: Bool = false) -> OutreachSelectionItemDisplayable {
        return OutreachSelectionItemDisplayable(icon: .styledImage(identifier: "icon-email-app"),
                                                title: Labels.emailAppName,
                                                tag: isPreferred ? Labels.isPreferredLabel : nil,
                                                body: nil,
                                                trailingIcon: nil)
    }

    static func whatsapp(isPreferred: Bool = false) -> OutreachSelectionItemDisplayable {
        return OutreachSelectionItemDisplayable(icon: .styledImage(identifier: "icon-whatsapp-app"),
                                                title: Labels.whatsAppAppName,
                                                tag: isPreferred ? Labels.isPreferredLabel : nil,
                                                body: WhatsappOutreachAction.isAvailable ? nil : Labels.installAppLabel,
                                                trailingIcon: WhatsappOutreachAction.isAvailable ? nil : Constants.launchAppStoreIcon)
    }

    static func line(isPreferred: Bool = false) -> OutreachSelectionItemDisplayable {
        return OutreachSelectionItemDisplayable(icon: .styledImage(identifier: "icon-line-app"),
                                                title: Labels.lineAppName,
                                                tag: isPreferred ? Labels.isPreferredLabel : nil,
                                                body: LineOutreachAction.isAvailable ? nil : Labels.installAppLabel,
                                                trailingIcon: LineOutreachAction.isAvailable ? nil : Constants.launchAppStoreIcon)
    }

    static func lineWorks(isPreferred: Bool = false) -> OutreachSelectionItemDisplayable {
        return OutreachSelectionItemDisplayable(icon: .styledImage(identifier: "icon-line-app"),
                                                title: Labels.lineWorksAppName,
                                                tag: isPreferred ? Labels.isPreferredLabel : nil,
                                                body: LineWorksOutreachAction.isAvailable ? nil : Labels.installAppLabel,
                                                trailingIcon: LineWorksOutreachAction.isAvailable ? nil : Constants.launchAppStoreIcon)
    }

    static func kakao(isPreferred: Bool = false) -> OutreachSelectionItemDisplayable {
        return OutreachSelectionItemDisplayable(icon: .styledImage(identifier: "icon-kakao-app"),
                                                title: Labels.kakaoAppName,
                                                tag: isPreferred ? Labels.isPreferredLabel : nil,
                                                body: KakaoOutreachAction.isAvailable ? nil : Labels.installAppLabel,
                                                trailingIcon: KakaoOutreachAction.isAvailable ? nil : Constants.launchAppStoreIcon)
    }
}
