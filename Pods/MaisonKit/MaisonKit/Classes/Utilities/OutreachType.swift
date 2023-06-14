// Copyright © 2021 LVMH. All rights reserved.

import Foundation

/// The types of outreaches supported in MaisonKit
/// Each of these outreaches belongs to a channel.
public enum OutreachType: String {
    case call
    case sms
    case email
    case whatsapp
    case lineWorks
    case wechat
    case line
    /// KakaoTalk is a popular messaging app in Korea
    case kakao
    /// FaceTime is used for calling clients via video chat
    case facetime
}
