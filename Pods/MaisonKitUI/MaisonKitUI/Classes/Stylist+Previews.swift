import Foundation
import SwiftUI
import StylableSwiftUI

/*
 * THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
 * IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
 * YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
 */

// swiftlint:disable all
#if DEBUG
extension Stylist {

    static let defaultStylist: Stylist = {
        let stylist = Stylist.create()
        return stylist
    }()

    static let darkModeStylist: Stylist = {
        let stylist = Stylist.create()
        stylist.currentTheme = .dark
        return stylist
    }()
}

extension Stylist {
    static func create() -> Stylist {

        let stylist = Stylist()

        stylist.addStyle(identifier: "@dark/accordion/body") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 15))
                .foregroundColor(Color(red: 0.69, green: 0.69, blue: 0.69, opacity: 1))
                .lineSpacing(4)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/accordion/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("AvenirNext-Medium", size: 15))
                .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/alert/background") {
            $0
                .background(Color(red: 0.18, green: 0.18, blue: 0.18, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        stylist.addStyle(identifier: "@dark/alert/list-row/background") {
            $0
                .background(Color(red: 0.18, green: 0.18, blue: 0.18, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        stylist.addStyle(identifier: "@dark/alert/list-row/divider/background") {
            $0
                .background(Color(red: 0.18, green: 0.18, blue: 0.18, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        stylist.addStyle(identifier: "@dark/alert/list-row/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("AvenirNext-Medium", size: 14))
                .foregroundColor(Color(red: 0.69, green: 0.69, blue: 0.69, opacity: 1))
                .lineSpacing(4)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/alert/subtitle") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("AvenirNext-Medium", size: 14))
                .foregroundColor(Color(red: 0.69, green: 0.69, blue: 0.69, opacity: 1))
                .lineSpacing(4)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/alert/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("AvenirNext-Medium", size: 16))
                .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .lineSpacing(6)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/assets/block/background") {
            $0
                .background(Color(red: 0.07, green: 0.07, blue: 0.07, opacity: 1))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(Color(red: 0.18, green: 0.18, blue: 0.18, opacity: 1), style: StrokeStyle(lineWidth: 1, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        stylist.addStyle(identifier: "@dark/attributes/background") {
            $0
                .background(Color(red: 0.07, green: 0.07, blue: 0.07, opacity: 1))
        }
        stylist.addStyle(identifier: "@dark/attributes/tag-status/background") {
            $0
                .background(Color(red: 0.07, green: 0.07, blue: 0.07, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 4))
        }
        stylist.addStyle(identifier: "@dark/attributes/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 17))
                .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .lineSpacing(5)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/background") {
            $0
                .background(Color(red: 0.07, green: 0.07, blue: 0.07, opacity: 1))
        }
        stylist.addStyle(identifier: "@dark/badge/background") {
            $0
                .background(Color(red: 0, green: 0.64, blue: 1, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "@dark/banners/background") {
            $0
                .background(Color(red: 0.05, green: 0.21, blue: 0.3, opacity: 1))
        }
        stylist.addStyle(identifier: "@dark/banners/divider/background") {
            $0
                .background(Color(red: 0.05, green: 0.21, blue: 0.3, opacity: 1))
        }
        stylist.addStyle(identifier: "@dark/banners/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.1)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 15))
                .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .lineSpacing(-1)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/banners[alert]/background") {
            $0
                .background(Color(red: 0.24, green: 0.02, blue: 0.02, opacity: 1))
        }
        stylist.addStyle(identifier: "@dark/banners[alert]/divider[full]/background") {
            $0
                .background(Color(red: 0.24, green: 0.02, blue: 0.02, opacity: 1))
        }
        stylist.addStyle(identifier: "@dark/banners[alert]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.1)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 15))
                .foregroundColor(Color(red: 0.97, green: 0, blue: 0, opacity: 1))
                .lineSpacing(-1)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/block-stats/background") {
            $0
                .background(Color(red: 0.18, green: 0.18, blue: 0.18, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        stylist.addStyle(identifier: "@dark/block-stats/body") {
            $0
                .styleText { text in
                    text
                        .tracking(-0.5)
                }
                .font(Font.custom("AvenirNext-Regular", size: 36))
                .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .lineSpacing(-8)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/block-stats/subtitle") {
            $0
                .font(Font.custom("SFProDisplay-Medium", size: 13))
                .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .lineSpacing(-1)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/block-stats/title") {
            $0
                .styleText { text in
                    text
                        .tracking(-0.1)
                }
                .font(Font.custom("AvenirNext-Medium", size: 10))
                .foregroundColor(Color(red: 0.69, green: 0.69, blue: 0.69, opacity: 1))
                .lineSpacing(1)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "@dark/block-stats[circle-wide]/body") {
            $0
                .styleText { text in
                    text
                        .tracking(-0.5)
                }
                .font(Font.custom("AvenirNext-Regular", size: 34))
                .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .lineSpacing(-6)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/block-stats[circle-wide]/subtitle") {
            $0
                .font(Font.custom("SFProDisplay-Medium", size: 15))
                .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .lineSpacing(1)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/block-stats[circle3-wide]/body") {
            $0
                .font(Font.custom("SFProDisplay-Regular", size: 13))
                .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/block-stats[circle3-wide]/subtitle") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("AvenirNext-Medium", size: 13))
                .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/block/background") {
            $0
                .background(Color(red: 0.07, green: 0.07, blue: 0.07, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        stylist.addStyle(identifier: "@dark/block/body") {
            $0
                .styleText { text in
                    text
                        .tracking(-0.1)
                }
                .font(Font.custom("AvenirNext-DemiBold", size: 14))
                .foregroundColor(Color(red: 0.69, green: 0.69, blue: 0.69, opacity: 1))
                .lineSpacing(8)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/block/subtitle") {
            $0
                .styleText { text in
                    text
                        .tracking(-0.2)
                }
                .font(Font.custom("SFProDisplay-Medium", size: 10))
                .foregroundColor(Color(red: 0.69, green: 0.69, blue: 0.69, opacity: 1))
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "@dark/block/title") {
            $0
                .styleText { text in
                    text
                        .tracking(-0.2)
                }
                .font(Font.custom("AvenirNext-DemiBold", size: 20))
                .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/block[available-hide]/subtitle") {
            $0
                .styleText { text in
                    text
                        .tracking(-0.2)
                }
                .font(Font.custom("SFProDisplay-Medium", size: 10))
                .foregroundColor(Color(red: 0.69, green: 0.69, blue: 0.69, opacity: 1))
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "@dark/block[available]/subtitle") {
            $0
                .styleText { text in
                    text
                        .tracking(-0.2)
                }
                .font(Font.custom("SFProDisplay-Medium", size: 10))
                .foregroundColor(Color(red: 0.69, green: 0.69, blue: 0.69, opacity: 1))
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "@dark/block[available]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.1333333333333333)
                }
                .font(Font.custom("AvenirNext-Medium", size: 20))
                .foregroundColor(Color(red: 0.55, green: 0.82, blue: 0.02, opacity: 1))
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/block[out-of-stock-hide]/subtitle") {
            $0
                .styleText { text in
                    text
                        .tracking(-0.2)
                }
                .font(Font.custom("SFProDisplay-Medium", size: 10))
                .foregroundColor(Color(red: 0.69, green: 0.69, blue: 0.69, opacity: 1))
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "@dark/block[out-of-stock]/subtitle") {
            $0
                .styleText { text in
                    text
                        .tracking(-0.2)
                }
                .font(Font.custom("SFProDisplay-Medium", size: 10))
                .foregroundColor(Color(red: 0.69, green: 0.69, blue: 0.69, opacity: 1))
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "@dark/block[out-of-stock]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.1333333333333333)
                }
                .font(Font.custom("AvenirNext-Medium", size: 20))
                .foregroundColor(Color(red: 0.96, green: 0.03, blue: 0.03, opacity: 1))
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/body") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 14))
                .foregroundColor(Color(red: 0.65, green: 0.65, blue: 0.65, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/button-action-row/background") {
            $0
                .background(Color(red: 0.18, green: 0.18, blue: 0.18, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        stylist.addStyle(identifier: "@dark/button-action-row/subtitle") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 14))
                .foregroundColor(Color(red: 0.69, green: 0.69, blue: 0.69, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/button-action-row/tag-secondary/background") {
            $0
                .background(Color(red: 0.18, green: 0.18, blue: 0.18, opacity: 1))
                .overlay(RoundedRectangle(cornerRadius: 4).strokeBorder(Color(red: 0, green: 0.64, blue: 1, opacity: 1), style: StrokeStyle(lineWidth: 1, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
                .clipShape(RoundedRectangle(cornerRadius: 4))
        }
        stylist.addStyle(identifier: "@dark/button-action-row/tag-secondary/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("AvenirNext-Medium", size: 10))
                .foregroundColor(Color(red: 0, green: 0.64, blue: 1, opacity: 1))
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "@dark/button-action-row/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.1764705882352941)
                }
                .font(Font.custom("AvenirNext-Medium", size: 15))
                .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .lineSpacing(3)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/button-alert/background") {
            $0
                .background(Color(red: 0.24, green: 0.02, blue: 0.02, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        stylist.addStyle(identifier: "@dark/button-alert/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("AvenirNext-Medium", size: 14))
                .foregroundColor(Color(red: 0.97, green: 0, blue: 0, opacity: 1))
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "@dark/button-badge/background") {
            $0
                .background(Color(red: 0.07, green: 0.07, blue: 0.07, opacity: 1))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(Color(red: 0.18, green: 0.18, blue: 0.18, opacity: 1), style: StrokeStyle(lineWidth: 1, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        stylist.addStyle(identifier: "@dark/button-badge/subtitle") {
            $0
                .styleText { text in
                    text
                        .tracking(-0.2)
                }
                .font(Font.custom("SFProDisplay-Medium", size: 10))
                .foregroundColor(Color(red: 0.69, green: 0.69, blue: 0.69, opacity: 1))
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "@dark/button-badge/title") {
            $0
                .styleText { text in
                    text
                        .tracking(-0.2)
                }
                .font(Font.custom("AvenirNext-DemiBold", size: 20))
                .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/button-badge[selected]/background") {
            $0
                .background(Color(red: 0.18, green: 0.18, blue: 0.18, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        stylist.addStyle(identifier: "@dark/button-badge[selected]/subtitle") {
            $0
                .styleText { text in
                    text
                        .tracking(-0.2)
                }
                .font(Font.custom("SFProDisplay-Medium", size: 10))
                .foregroundColor(Color(red: 0, green: 0.64, blue: 1, opacity: 1))
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "@dark/button-badge[selected]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(-0.2)
                }
                .font(Font.custom("AvenirNext-DemiBold", size: 20))
                .foregroundColor(Color(red: 0, green: 0.64, blue: 1, opacity: 1))
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/button-filters-avatar/background") {
            $0
                .background(Color(red: 0.18, green: 0.18, blue: 0.18, opacity: 1).overlay(Image("5c953cc19e315c165d7ba22a7547d815284a5ccb", bundle: nil).resizable().aspectRatio(contentMode: .fill)))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "@dark/button-filters-avatar/badge/background") {
            $0
                .background(Color(red: 0, green: 0, blue: 0, opacity: 0))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "@dark/button-filters-avatar/badge/title") {
            $0
                .styleText { text in
                    text
                        .tracking(-0.2)
                }
                .font(Font.custom("AvenirNext-Medium", size: 14))
                .foregroundColor(Color(red: 0.62, green: 0.62, blue: 0.62, opacity: 1))
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/button-filters-avatar/overlay") {
            $0
                .background(Color(red: 0, green: 0, blue: 0, opacity: 0))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "@dark/button-filters-avatar/subtitle") {
            $0
                .font(Font.custom("AvenirNext-UltraLight", size: 28))
                .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/button-filters-avatar/title") {
            $0
                .styleText { text in
                    text
                        .tracking(-0.2)
                }
                .font(Font.custom("AvenirNext-Medium", size: 14))
                .foregroundColor(Color(red: 0.69, green: 0.69, blue: 0.69, opacity: 1))
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/button-filters-avatar[disabled]/background") {
            $0
                .background(Color(red: 0.18, green: 0.18, blue: 0.18, opacity: 1).overlay(Image("5c953cc19e315c165d7ba22a7547d815284a5ccb", bundle: nil).resizable().aspectRatio(contentMode: .fill)))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "@dark/button-filters-avatar[disabled]/badge/title") {
            $0
                .styleText { text in
                    text
                        .tracking(-0.2)
                }
                .font(Font.custom("AvenirNext-Medium", size: 14))
                .foregroundColor(Color(red: 0.43, green: 0.43, blue: 0.43, opacity: 1))
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/button-filters-avatar[disabled]/overlay") {
            $0
                .background(Color(red: 0, green: 0, blue: 0, opacity: 0.4))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "@dark/button-filters-avatar[disabled]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(-0.2)
                }
                .font(Font.custom("AvenirNext-Medium", size: 14))
                .foregroundColor(Color(red: 0.43, green: 0.43, blue: 0.43, opacity: 1))
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/button-filters-avatar[selected]/badge/title") {
            $0
                .styleText { text in
                    text
                        .tracking(-0.2)
                }
                .font(Font.custom("AvenirNext-Medium", size: 14))
                .foregroundColor(Color(red: 0, green: 0.64, blue: 1, opacity: 1))
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/button-filters-avatar[selected]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(-0.2)
                }
                .font(Font.custom("AvenirNext-Medium", size: 14))
                .foregroundColor(Color(red: 0, green: 0.64, blue: 1, opacity: 1))
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/button-filters-icon/background") {
            $0
                .background(Color(red: 0.07, green: 0.07, blue: 0.07, opacity: 1))
                .overlay(RoundedRectangle(cornerRadius: 25).strokeBorder(Color(red: 0.18, green: 0.18, blue: 0.18, opacity: 1), style: StrokeStyle(lineWidth: 1, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "@dark/button-filters-icon[selected]/background") {
            $0
                .background(Color(red: 0, green: 0.64, blue: 1, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "@dark/button-filters-multi/background") {
            $0
                .background(Color(red: 0.07, green: 0.07, blue: 0.07, opacity: 1))
                .overlay(RoundedRectangle(cornerRadius: 25).strokeBorder(Color(red: 0.18, green: 0.18, blue: 0.18, opacity: 1), style: StrokeStyle(lineWidth: 1, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "@dark/button-filters-multi/title") {
            $0
                .font(Font.custom("AvenirNext-Medium", size: 12))
                .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/button-filters-multi[disabled]/background") {
            $0
                .background(Color(red: 0.07, green: 0.07, blue: 0.07, opacity: 1))
                .overlay(RoundedRectangle(cornerRadius: 25).strokeBorder(Color(red: 0.18, green: 0.18, blue: 0.18, opacity: 1), style: StrokeStyle(lineWidth: 1, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "@dark/button-filters-multi[disabled]/title") {
            $0
                .font(Font.custom("AvenirNext-Medium", size: 12))
                .foregroundColor(Color(red: 0.43, green: 0.43, blue: 0.43, opacity: 1))
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/button-filters-multi[selected]/background") {
            $0
                .background(Color(red: 0, green: 0.64, blue: 1, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "@dark/button-filters/background") {
            $0
                .background(Color(red: 0.07, green: 0.07, blue: 0.07, opacity: 1))
                .overlay(RoundedRectangle(cornerRadius: 25).strokeBorder(Color(red: 0.18, green: 0.18, blue: 0.18, opacity: 1), style: StrokeStyle(lineWidth: 1, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "@dark/button-filters/badge/background") {
            $0
                .background(Color(red: 0, green: 0, blue: 0, opacity: 0))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "@dark/button-filters/badge/title") {
            $0
                .font(Font.custom("AvenirNext-Medium", size: 12))
                .foregroundColor(Color(red: 0.67, green: 0.67, blue: 0.67, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/button-filters/info/title") {
            $0
                .font(Font.custom("AvenirNext-Medium", size: 12))
                .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/button-filters/title") {
            $0
                .font(Font.custom("AvenirNext-Medium", size: 12))
                .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/button-filters[disabled]/background") {
            $0
                .background(Color(red: 0.18, green: 0.18, blue: 0.18, opacity: 1))
                .overlay(RoundedRectangle(cornerRadius: 25).strokeBorder(Color(red: 0.18, green: 0.18, blue: 0.18, opacity: 1), style: StrokeStyle(lineWidth: 1, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "@dark/button-filters[disabled]/badge/title") {
            $0
                .font(Font.custom("AvenirNext-Medium", size: 12))
                .foregroundColor(Color(red: 0.43, green: 0.43, blue: 0.43, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/button-filters[disabled]/info/title") {
            $0
                .font(Font.custom("AvenirNext-Medium", size: 12))
                .foregroundColor(Color(red: 0.43, green: 0.43, blue: 0.43, opacity: 1))
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/button-filters[disabled]/title") {
            $0
                .font(Font.custom("AvenirNext-Medium", size: 12))
                .foregroundColor(Color(red: 0.43, green: 0.43, blue: 0.43, opacity: 1))
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/button-filters[selected]/background") {
            $0
                .background(Color(red: 0, green: 0.64, blue: 1, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "@dark/button-filters[selected]/badge/title") {
            $0
                .font(Font.custom("AvenirNext-Medium", size: 12))
                .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/button-filters[selected]/info/title") {
            $0
                .font(Font.custom("AvenirNext-Medium", size: 12))
                .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/button-filters[selected]/title") {
            $0
                .font(Font.custom("AvenirNext-Medium", size: 12))
                .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/button-icon-center/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Medium", size: 12))
                .foregroundColor(Color(red: 0, green: 0.64, blue: 1, opacity: 1))
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "@dark/button-icon-center[disabled]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Medium", size: 12))
                .foregroundColor(Color(red: 0.4, green: 0.4, blue: 0.4, opacity: 1))
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "@dark/button-icon-left/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Medium", size: 17))
                .foregroundColor(Color(red: 0, green: 0.64, blue: 1, opacity: 1))
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/button-icon-right/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Medium", size: 17))
                .foregroundColor(Color(red: 0, green: 0.64, blue: 1, opacity: 1))
                .multilineTextAlignment(.trailing)
                .frame(alignment: .trailing)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/button-icon-right[disabled]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Medium", size: 17))
                .foregroundColor(Color(red: 0.43, green: 0.43, blue: 0.43, opacity: 1))
                .multilineTextAlignment(.trailing)
                .frame(alignment: .trailing)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/button-icon-right[highlighted]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Medium", size: 17))
                .foregroundColor(Color(red: 0, green: 0.64, blue: 1, opacity: 1))
                .multilineTextAlignment(.trailing)
                .frame(alignment: .trailing)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/button-primary/background") {
            $0
                .background(Color(red: 0, green: 0.64, blue: 1, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        stylist.addStyle(identifier: "@dark/button-primary[disabled]/background") {
            $0
                .background(Color(red: 0.07, green: 0.07, blue: 0.07, opacity: 1))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(Color(red: 0.18, green: 0.18, blue: 0.18, opacity: 1), style: StrokeStyle(lineWidth: 1, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        stylist.addStyle(identifier: "@dark/button-primary[disabled]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("AvenirNext-Medium", size: 14))
                .foregroundColor(Color(red: 0.4, green: 0.4, blue: 0.4, opacity: 1))
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "@dark/button-primary[highlighted]/background") {
            $0
                .background(Color(red: 0.18, green: 0.29, blue: 0.45, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        stylist.addStyle(identifier: "@dark/button-secondary/background") {
            $0
                .background(Color(red: 0.18, green: 0.18, blue: 0.18, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        stylist.addStyle(identifier: "@dark/button-secondary/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("AvenirNext-Medium", size: 14))
                .foregroundColor(Color(red: 0, green: 0.64, blue: 1, opacity: 1))
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "@dark/button-secondary[disabled]/background") {
            $0
                .background(Color(red: 0.07, green: 0.07, blue: 0.07, opacity: 1))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(Color(red: 0.18, green: 0.18, blue: 0.18, opacity: 1), style: StrokeStyle(lineWidth: 1, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        stylist.addStyle(identifier: "@dark/button-secondary[disabled]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("AvenirNext-Medium", size: 14))
                .foregroundColor(Color(red: 0.4, green: 0.4, blue: 0.4, opacity: 1))
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "@dark/button-secondary[highlighted]/background") {
            $0
                .background(Color(red: 0, green: 0.64, blue: 1, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        stylist.addStyle(identifier: "@dark/button-secondary[highlighted]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("AvenirNext-Medium", size: 14))
                .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "@dark/button-swipe/background") {
            $0
                .background(Color(red: 0, green: 0.64, blue: 1, opacity: 1))
        }
        stylist.addStyle(identifier: "@dark/button-swipe[alert]/background") {
            $0
                .background(Color(red: 0.97, green: 0, blue: 0, opacity: 1))
        }
        stylist.addStyle(identifier: "@dark/button-tabbar/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 13))
                .foregroundColor(Color(red: 0.13, green: 0.61, blue: 1, opacity: 1))
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/button-tabbar[disabled]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 13))
                .foregroundColor(Color(red: 0.82, green: 0.82, blue: 0.82, opacity: 1))
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/button-tabs/background") {
            $0
                .background(Color(red: 0.22, green: 0.22, blue: 0.22, opacity: 1))
        }
        stylist.addStyle(identifier: "@dark/button-tabs/divider/background") {
            $0
                .background(Color(red: 0.18, green: 0.18, blue: 0.18, opacity: 1))
        }
        stylist.addStyle(identifier: "@dark/button-tabs/subtitle") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Medium", size: 10))
                .foregroundColor(Color(red: 0.69, green: 0.69, blue: 0.69, opacity: 1))
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "@dark/button-tabs/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.1333333333333333)
                }
                .font(Font.custom("AvenirNext-Medium", size: 20))
                .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/button-tabs[selected]/background") {
            $0
                .background(Color(red: 0.22, green: 0.22, blue: 0.22, opacity: 1))
        }
        stylist.addStyle(identifier: "@dark/button-tabs[selected]/divider/background") {
            $0
                .background(Color(red: 0, green: 0.64, blue: 1, opacity: 1))
        }
        stylist.addStyle(identifier: "@dark/button-tabs[selected]/subtitle") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Medium", size: 10))
                .foregroundColor(Color(red: 0, green: 0.64, blue: 1, opacity: 1))
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "@dark/button-tabs[selected]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.1333333333333333)
                }
                .font(Font.custom("AvenirNext-Medium", size: 20))
                .foregroundColor(Color(red: 0, green: 0.64, blue: 1, opacity: 1))
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/button-tabswitch/background") {
            $0
                .background(Color(red: 0.07, green: 0.07, blue: 0.07, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 6))
        }
        stylist.addStyle(identifier: "@dark/button-tabswitch/title") {
            $0
                .font(Font.custom("AvenirNext-Medium", size: 12))
                .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/button-tabswitch[selected]/background") {
            $0
                .background(Color(red: 0, green: 0.64, blue: 1, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 6))
        }
        stylist.addStyle(identifier: "@dark/button-tabswitch[selected]/title") {
            $0
                .font(Font.custom("AvenirNext-Medium", size: 12))
                .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/button-tertiary/background") {
            $0
                .background(Color(red: 0.07, green: 0.07, blue: 0.07, opacity: 1))
                .overlay(RoundedRectangle(cornerRadius: 25).strokeBorder(Color(red: 0.24, green: 0.24, blue: 0.24, opacity: 1), style: StrokeStyle(lineWidth: 1, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "@dark/button-tertiary/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Medium", size: 12))
                .foregroundColor(Color(red: 0, green: 0.64, blue: 1, opacity: 1))
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "@dark/button-tertiary[disabled]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Medium", size: 12))
                .foregroundColor(Color(red: 0.4, green: 0.4, blue: 0.4, opacity: 1))
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "@dark/button-tertiary[error]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Medium", size: 12))
                .foregroundColor(Color(red: 0.97, green: 0, blue: 0, opacity: 1))
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "@dark/button-tertiary[highlighted]/background") {
            $0
                .background(Color(red: 0.16, green: 0.16, blue: 0.16, opacity: 1))
                .overlay(RoundedRectangle(cornerRadius: 25).strokeBorder(Color(red: 0.23, green: 0.23, blue: 0.23, opacity: 1), style: StrokeStyle(lineWidth: 1, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "@dark/button-tertiary[highlighted]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Medium", size: 12))
                .foregroundColor(Color(red: 0.57, green: 0.84, blue: 0.03, opacity: 1))
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "@dark/button-toolbar/background") {
            $0
                .background(Color(red: 0.07, green: 0.07, blue: 0.07, opacity: 0))
        }
        stylist.addStyle(identifier: "@dark/button-toolbar/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("AvenirNext-Medium", size: 14))
                .foregroundColor(Color(red: 0, green: 0.64, blue: 1, opacity: 1))
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "@dark/calendar-day/background") {
            $0
                .background(Color(red: 0.07, green: 0.07, blue: 0.07, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "@dark/calendar-day/indicator/background") {
            $0
                .background(Color(red: 0.46, green: 0.45, blue: 0.45, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "@dark/calendar-day/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Medium", size: 16))
                .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "@dark/calendar-day[disabled]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Medium", size: 16))
                .foregroundColor(Color(red: 0.44, green: 0.44, blue: 0.44, opacity: 1))
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "@dark/calendar-day[highlighted]/background") {
            $0
                .background(Color(red: 0, green: 0.26, blue: 0.41, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "@dark/calendar-day[highlighted]/indicator/background") {
            $0
                .background(Color(red: 0, green: 0.64, blue: 1, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "@dark/calendar-day[highlighted]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Medium", size: 16))
                .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "@dark/calendar-day[selected]/background") {
            $0
                .background(Color(red: 0, green: 0.64, blue: 1, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "@dark/calendar-day[selected]/indicator/background") {
            $0
                .background(Color(red: 0, green: 0.64, blue: 1, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "@dark/calendar-day[selected]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Medium", size: 16))
                .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "@dark/calendar/background") {
            $0
                .background(Color(red: 0.07, green: 0.07, blue: 0.07, opacity: 1))
        }
        stylist.addStyle(identifier: "@dark/calendar/subtitle") {
            $0
                .styleText { text in
                    text
                        .tracking(0.1)
                }
                .font(Font.custom("SFProDisplay-Medium", size: 13))
                .foregroundColor(Color(red: 0.69, green: 0.69, blue: 0.69, opacity: 1))
                .lineSpacing(4)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "@dark/calendar/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("AvenirNext-Medium", size: 15))
                .foregroundColor(Color(red: 0, green: 0.64, blue: 1, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "@dark/camera-view/background") {
            $0
                .background(Color(red: 0.18, green: 0.18, blue: 0.18, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        stylist.addStyle(identifier: "@dark/camera-view/button-icon-left/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Medium", size: 17))
                .foregroundColor(Color(red: 0, green: 0.64, blue: 1, opacity: 1))
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/carousel/heading/divider/background") {
            $0
                .background(Color(red: 0.07, green: 0.07, blue: 0.07, opacity: 1))
        }
        stylist.addStyle(identifier: "@dark/client-row/background") {
            $0
                .background(Color(red: 0.06, green: 0.06, blue: 0.06, opacity: 1))
        }
        stylist.addStyle(identifier: "@dark/client-row/divider/background") {
            $0
                .background(Color(red: 0.22, green: 0.22, blue: 0.22, opacity: 1))
        }
        stylist.addStyle(identifier: "@dark/client-row/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 18))
                .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .lineSpacing(-1)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/client-row[highlighted]/background") {
            $0
                .background(Color(red: 0.18, green: 0.18, blue: 0.18, opacity: 1))
                .blur(radius: 0)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.2), radius: 20, x: 0, y: 10)
        }
        stylist.addStyle(identifier: "@dark/clients/button-tertiary-center/background") {
            $0
                .background(Color(red: 0.18, green: 0.14, blue: 0.01, opacity: 1))
                .overlay(RoundedRectangle(cornerRadius: 25).strokeBorder(Color(red: 0.95, green: 0.8, blue: 0.25, opacity: 1), style: StrokeStyle(lineWidth: 1, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "@dark/clients/button-tertiary-center/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Medium", size: 12))
                .foregroundColor(Color(red: 0.95, green: 0.8, blue: 0.25, opacity: 1))
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "@dark/clients/create/line") {
            $0
                .overlay(Rectangle().strokeBorder(Color(red: 1, green: 1, blue: 1, opacity: 1), style: StrokeStyle(lineWidth: 3, lineCap: CGLineCap(rawValue: 2), lineJoin: CGLineJoin(rawValue: 0))))
        }
        stylist.addStyle(identifier: "@dark/clients/create/modal/background") {
            $0
                .background(Color(red: 0.22, green: 0.22, blue: 0.22, opacity: 1))
        }
        stylist.addStyle(identifier: "@dark/clients/create/modal/heading/background") {
            $0
                .background(Color(red: 0, green: 0, blue: 0, opacity: 0))
        }
        stylist.addStyle(identifier: "@dark/clients/create/note-instructions/background") {
            $0
                .background(Color(red: 0.07, green: 0.07, blue: 0.07, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        stylist.addStyle(identifier: "@dark/clients/profile/background") {
            $0
                .background(Color(red: 0.07, green: 0.07, blue: 0.07, opacity: 1))
        }
        stylist.addStyle(identifier: "@dark/clients/profile/block/background") {
            $0
                .background(Color(red: 0.07, green: 0.07, blue: 0.07, opacity: 1))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(Color(red: 0.18, green: 0.18, blue: 0.18, opacity: 1), style: StrokeStyle(lineWidth: 1, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        stylist.addStyle(identifier: "@dark/clients/profile/color-item/background") {
            $0
                .background(Color(red: 0.2, green: 0.2, blue: 0.2, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "@dark/curations/block/background") {
            $0
                .background(Color(red: 0.07, green: 0.07, blue: 0.07, opacity: 1))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(Color(red: 0.18, green: 0.18, blue: 0.18, opacity: 1), style: StrokeStyle(lineWidth: 1, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        stylist.addStyle(identifier: "@dark/date-picker/underlay") {
            $0
                .background(Color(red: 0.17, green: 0.17, blue: 0.17, opacity: 1))
        }
        stylist.addStyle(identifier: "@dark/divider/background") {
            $0
                .background(Color(red: 0.18, green: 0.18, blue: 0.18, opacity: 1))
        }
        stylist.addStyle(identifier: "@dark/divider/overlay") {
            $0
                .background(Color(red: 0.07, green: 0.07, blue: 0.07, opacity: 1))
        }
        stylist.addStyle(identifier: "@dark/divider/title") {
            $0
                .styleText { text in
                    text
                        .tracking(1.2)
                }
                .font(Font.custom("SFProDisplay-Medium", size: 11))
                .foregroundColor(Color(red: 0.69, green: 0.69, blue: 0.69, opacity: 1))
                .lineSpacing(-3)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "@dark/email/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("AvenirNext-DemiBold", size: 18))
                .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "@dark/expandable/body") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 16))
                .foregroundColor(Color(red: 0.69, green: 0.69, blue: 0.69, opacity: 1))
                .lineSpacing(3)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/expandable/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 16))
                .foregroundColor(Color(red: 0, green: 0.64, blue: 1, opacity: 1))
                .lineSpacing(3)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/fab/background") {
            $0
                .background(LinearGradient(gradient: Gradient(stops:[.init(color: Color(red: 0.07, green: 0.07, blue: 0.07, opacity: 0), location: 0),.init(color: Color(red: 0.07, green: 0.07, blue: 0.07, opacity: 1), location: 1)]), startPoint: UnitPoint(x: 0.5, y: 0), endPoint: UnitPoint(x: 0.5, y: 0.55)))
        }
        stylist.addStyle(identifier: "@dark/fab/divider/background") {
            $0
                .background(Color(red: 0.07, green: 0.07, blue: 0.07, opacity: 0))
        }
        stylist.addStyle(identifier: "@dark/fab/info/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 14))
                .foregroundColor(Color(red: 0.65, green: 0.65, blue: 0.65, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/filters/background") {
            $0
                .background(Color(red: 0.07, green: 0.07, blue: 0.07, opacity: 1))
        }
        stylist.addStyle(identifier: "@dark/fold/overlay") {
            $0
                .background(Color(red: 0, green: 0, blue: 0, opacity: 0.5))
        }
        stylist.addStyle(identifier: "@dark/form-field-message/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 12))
                .foregroundColor(Color(red: 0.76, green: 0.76, blue: 0.76, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/form-field-title/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("AvenirNext-Regular", size: 14))
                .foregroundColor(Color(red: 0.76, green: 0.76, blue: 0.76, opacity: 1))
                .lineSpacing(3)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/form-field/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 0))
        }
        stylist.addStyle(identifier: "@dark/form-field/badge/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 0))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "@dark/form-field/badge/title") {
            $0
                .font(Font.custom("AvenirNext-Medium", size: 12))
                .foregroundColor(Color(red: 0.65, green: 0.66, blue: 0.69, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/form-field/button-tertiary/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 0))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "@dark/form-field/button-tertiary/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Medium", size: 12))
                .foregroundColor(Color(red: 0, green: 0.64, blue: 1, opacity: 1))
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "@dark/form-field/subtitle") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 15))
                .foregroundColor(Color(red: 0.65, green: 0.66, blue: 0.7, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/form-field/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 17))
                .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .lineSpacing(3)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/form-field[disabled]/badge/title") {
            $0
                .font(Font.custom("AvenirNext-Medium", size: 12))
                .foregroundColor(Color(red: 0.44, green: 0.44, blue: 0.44, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/form-field[disabled]/button-tertiary/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Medium", size: 12))
                .foregroundColor(Color(red: 0.44, green: 0.44, blue: 0.44, opacity: 1))
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "@dark/form-field[disabled]/form-field-message/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 12))
                .foregroundColor(Color(red: 0.44, green: 0.44, blue: 0.44, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/form-field[disabled]/form-field-title/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("AvenirNext-Regular", size: 14))
                .foregroundColor(Color(red: 0.44, green: 0.44, blue: 0.44, opacity: 1))
                .lineSpacing(3)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/form-field[disabled]/form-type-button/background") {
            $0
                .background(Color(red: 0.91, green: 0.91, blue: 0.92, opacity: 1))
                .overlay(RoundedRectangle(cornerRadius: 25).strokeBorder(Color(red: 0.91, green: 0.91, blue: 0.92, opacity: 1), style: StrokeStyle(lineWidth: 1, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "@dark/form-field[disabled]/form-type-button/info/title") {
            $0
                .font(Font.custom("AvenirNext-Medium", size: 12))
                .foregroundColor(Color(red: 0.65, green: 0.66, blue: 0.69, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/form-field[disabled]/form-type-button/title") {
            $0
                .font(Font.custom("AvenirNext-Medium", size: 12))
                .foregroundColor(Color(red: 0.65, green: 0.66, blue: 0.69, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/form-field[disabled]/form-type-signature/body") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 14))
                .foregroundColor(Color(red: 0.44, green: 0.44, blue: 0.44, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/form-field[disabled]/form-type-signature/line") {
            $0
                .overlay(Rectangle().strokeBorder(Color(red: 0.44, green: 0.44, blue: 0.44, opacity: 1), style: StrokeStyle(lineWidth: 1, lineCap: CGLineCap(rawValue: 2), lineJoin: CGLineJoin(rawValue: 0))))
        }
        stylist.addStyle(identifier: "@dark/form-field[disabled]/form-type-signature/subtitle") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("AvenirNext-Medium", size: 14))
                .foregroundColor(Color(red: 0.44, green: 0.44, blue: 0.44, opacity: 1))
                .lineSpacing(3)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/form-field[disabled]/subtitle") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 15))
                .foregroundColor(Color(red: 0.44, green: 0.44, blue: 0.44, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/form-field[disabled]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 17))
                .foregroundColor(Color(red: 0.44, green: 0.44, blue: 0.44, opacity: 1))
                .lineSpacing(3)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/form-field[error]/background") {
            $0
                .background(Color(red: 0.24, green: 0.02, blue: 0.02, opacity: 1))
        }
        stylist.addStyle(identifier: "@dark/form-field[error]/divider/background") {
            $0
                .background(Color(red: 0.97, green: 0, blue: 0, opacity: 1))
        }
        stylist.addStyle(identifier: "@dark/form-field[error]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 17))
                .foregroundColor(Color(red: 0.97, green: 0, blue: 0, opacity: 1))
                .lineSpacing(3)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/form-field[placeholder]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 17))
                .foregroundColor(Color(red: 0.65, green: 0.66, blue: 0.69, opacity: 1))
                .lineSpacing(3)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/form-field[warning]/background") {
            $0
                .background(Color(red: 0.28, green: 0.18, blue: 0, opacity: 1))
        }
        stylist.addStyle(identifier: "@dark/form-field[warning]/divider/background") {
            $0
                .background(Color(red: 0.88, green: 0.57, blue: 0, opacity: 1))
        }
        stylist.addStyle(identifier: "@dark/form-field[warning]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 17))
                .foregroundColor(Color(red: 0.88, green: 0.57, blue: 0, opacity: 1))
                .lineSpacing(3)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/form-group/background") {
            $0
                .background(Color(red: 0.07, green: 0.07, blue: 0.07, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        stylist.addStyle(identifier: "@dark/form-type-button/background") {
            $0
                .background(Color(red: 0.07, green: 0.07, blue: 0.07, opacity: 1))
                .overlay(RoundedRectangle(cornerRadius: 25).strokeBorder(Color(red: 0, green: 0.64, blue: 1, opacity: 1), style: StrokeStyle(lineWidth: 1.5, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "@dark/form-type-button/info/title") {
            $0
                .styleText { text in
                    text
                        .tracking(-0.2)
                }
                .font(Font.custom("AvenirNext-Medium", size: 14))
                .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/form-type-button/title") {
            $0
                .styleText { text in
                    text
                        .tracking(-0.2)
                }
                .font(Font.custom("AvenirNext-Medium", size: 14))
                .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/form-type-button[disabled]/background") {
            $0
                .background(Color(red: 0.2, green: 0.2, blue: 0.2, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "@dark/form-type-button[disabled]/badge/title") {
            $0
                .styleText { text in
                    text
                        .tracking(-0.2)
                }
                .font(Font.custom("AvenirNext-Medium", size: 14))
                .foregroundColor(Color(red: 0.68, green: 0.68, blue: 0.68, opacity: 1))
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/form-type-button[disabled]/info/title") {
            $0
                .styleText { text in
                    text
                        .tracking(-0.2)
                }
                .font(Font.custom("AvenirNext-Medium", size: 14))
                .foregroundColor(Color(red: 0.68, green: 0.68, blue: 0.68, opacity: 1))
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/form-type-button[selected]/background") {
            $0
                .background(Color(red: 0, green: 0.64, blue: 1, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "@dark/form-type-button[selected]/badge/title") {
            $0
                .styleText { text in
                    text
                        .tracking(-0.2)
                }
                .font(Font.custom("AvenirNext-Medium", size: 14))
                .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/form-type-button[selected]/info/title") {
            $0
                .styleText { text in
                    text
                        .tracking(-0.2)
                }
                .font(Font.custom("AvenirNext-Medium", size: 14))
                .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/form-type-button[selected]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(-0.2)
                }
                .font(Font.custom("AvenirNext-Medium", size: 14))
                .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/form-type-calendar-week/button-tertiary/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 0))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "@dark/form-type-calendar-week/button-tertiary[highlighted]/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 0))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "@dark/form-type-calendar-week/subtitle") {
            $0
                .styleText { text in
                    text
                        .tracking(0.1)
                }
                .font(Font.custom("SFProDisplay-Medium", size: 13))
                .foregroundColor(Color(red: 0.56, green: 0.57, blue: 0.64, opacity: 1))
                .lineSpacing(4)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "@dark/form-type-calendar-week/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("AvenirNext-Medium", size: 15))
                .foregroundColor(Color(red: 0, green: 0.64, blue: 1, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "@dark/form-type-calendar/button-tertiary/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 0))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "@dark/form-type-calendar/button-tertiary[highlighted]/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 0))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "@dark/form-type-calendar/subtitle") {
            $0
                .styleText { text in
                    text
                        .tracking(0.1)
                }
                .font(Font.custom("SFProDisplay-Medium", size: 13))
                .foregroundColor(Color(red: 0.56, green: 0.57, blue: 0.64, opacity: 1))
                .lineSpacing(4)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "@dark/form-type-calendar/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("AvenirNext-Medium", size: 15))
                .foregroundColor(Color(red: 0, green: 0.64, blue: 1, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "@dark/form-type-client[disabled]/info/subtitle") {
            $0
                .styleText { text in
                    text
                        .tracking(-0.2)
                }
                .font(Font.custom("AvenirNext-Medium", size: 14))
                .foregroundColor(Color(red: 0.65, green: 0.66, blue: 0.69, opacity: 1))
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/form-type-client[disabled]/info/title") {
            $0
                .styleText { text in
                    text
                        .tracking(-0.2)
                }
                .font(Font.custom("AvenirNext-Medium", size: 14))
                .foregroundColor(Color(red: 0.65, green: 0.66, blue: 0.69, opacity: 1))
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/form-type-client[disabled]/subtitle") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 15))
                .foregroundColor(Color(red: 0.82, green: 0.84, blue: 0.87, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/form-type-client[disabled]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 17))
                .foregroundColor(Color(red: 0.82, green: 0.84, blue: 0.87, opacity: 1))
                .lineSpacing(3)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/form-type-image-sm/background") {
            $0
                .background(Color(red: 0.2, green: 0.2, blue: 0.2, opacity: 1).overlay(Image("853732577995ec08625706620b0235b0184b90e8", bundle: nil).resizable().aspectRatio(contentMode: .fill)))
                .clipShape(RoundedRectangle(cornerRadius: 15))
        }
        stylist.addStyle(identifier: "@dark/form-type-image-sm/indicator/background") {
            $0
                .background(Color(red: 0.3, green: 0.82, blue: 0, opacity: 1))
                .overlay(RoundedRectangle(cornerRadius: 25).strokeBorder(Color(red: 0.07, green: 0.07, blue: 0.07, opacity: 1), style: StrokeStyle(lineWidth: 2, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "@dark/form-type-image-sm/indicator[expired]/background") {
            $0
                .background(Color(red: 0.22, green: 0.22, blue: 0.22, opacity: 1))
                .overlay(RoundedRectangle(cornerRadius: 25).strokeBorder(Color(red: 0.07, green: 0.07, blue: 0.07, opacity: 1), style: StrokeStyle(lineWidth: 2, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "@dark/form-type-image-sm/indicator[low-stock]/background") {
            $0
                .background(Color(red: 0.87, green: 0.5, blue: 0, opacity: 1))
                .overlay(RoundedRectangle(cornerRadius: 25).strokeBorder(Color(red: 0.07, green: 0.07, blue: 0.07, opacity: 1), style: StrokeStyle(lineWidth: 2, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "@dark/form-type-image-sm/indicator[no-stock]/background") {
            $0
                .background(Color(red: 0.7, green: 0.7, blue: 0.7, opacity: 1))
                .overlay(RoundedRectangle(cornerRadius: 25).strokeBorder(Color(red: 0.07, green: 0.07, blue: 0.07, opacity: 1), style: StrokeStyle(lineWidth: 2, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "@dark/form-type-image-sm/indicator[on-demand]/background") {
            $0
                .background(Color(red: 0.99, green: 0.77, blue: 0.12, opacity: 1))
                .overlay(RoundedRectangle(cornerRadius: 25).strokeBorder(Color(red: 0.07, green: 0.07, blue: 0.07, opacity: 1), style: StrokeStyle(lineWidth: 2, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "@dark/form-type-image-sm/indicator[out-of-stock]/background") {
            $0
                .background(Color(red: 0.79, green: 0, blue: 0, opacity: 1))
                .overlay(RoundedRectangle(cornerRadius: 25).strokeBorder(Color(red: 0.07, green: 0.07, blue: 0.07, opacity: 1), style: StrokeStyle(lineWidth: 2, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "@dark/form-type-image-sm/overlay") {
            $0
                .background(Color(red: 0.07, green: 0.07, blue: 0.07, opacity: 0))
                .clipShape(RoundedRectangle(cornerRadius: 15))
        }
        stylist.addStyle(identifier: "@dark/form-type-image-sm/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 15))
                .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .lineSpacing(5)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "@dark/form-type-image-sm[disabled]/overlay") {
            $0
                .background(Color(red: 0.07, green: 0.07, blue: 0.07, opacity: 0.6))
                .clipShape(RoundedRectangle(cornerRadius: 15))
        }
        stylist.addStyle(identifier: "@dark/form-type-image-sm[disabled]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 15))
                .foregroundColor(Color(red: 0.57, green: 0.57, blue: 0.57, opacity: 1))
                .lineSpacing(5)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "@dark/form-type-image-sm[selected]/overlay") {
            $0
                .background(Color(red: 0.07, green: 0.07, blue: 0.07, opacity: 0))
                .overlay(RoundedRectangle(cornerRadius: 15).strokeBorder(Color(red: 0.07, green: 0.07, blue: 0.07, opacity: 1), style: StrokeStyle(lineWidth: 4, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
                .overlay(RoundedRectangle(cornerRadius: 15).strokeBorder(Color(red: 0, green: 0.64, blue: 1, opacity: 1), style: StrokeStyle(lineWidth: 2, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
                .clipShape(RoundedRectangle(cornerRadius: 15))
        }
        stylist.addStyle(identifier: "@dark/form-type-image/background") {
            $0
                .background(Color(red: 0.2, green: 0.2, blue: 0.2, opacity: 1).overlay(Image("853732577995ec08625706620b0235b0184b90e8", bundle: nil).resizable().aspectRatio(contentMode: .fill)))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "@dark/form-type-image/info/title") {
            $0
                .styleText { text in
                    text
                        .tracking(-0.2)
                }
                .font(Font.custom("AvenirNext-Medium", size: 14))
                .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/form-type-image/overlay") {
            $0
                .background(Color(red: 0.07, green: 0.07, blue: 0.07, opacity: 0))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "@dark/form-type-image/subtitle") {
            $0
                .font(Font.custom("AvenirNext-Regular", size: 28))
                .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/form-type-image[disabled]/badge/title") {
            $0
                .font(Font.custom("AvenirNext-Medium", size: 12))
                .foregroundColor(Color(red: 0.47, green: 0.47, blue: 0.47, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/form-type-image[disabled]/info/title") {
            $0
                .styleText { text in
                    text
                        .tracking(-0.2)
                }
                .font(Font.custom("AvenirNext-Medium", size: 14))
                .foregroundColor(Color(red: 0.47, green: 0.47, blue: 0.47, opacity: 1))
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/form-type-image[disabled]/overlay") {
            $0
                .background(Color(red: 0.07, green: 0.07, blue: 0.07, opacity: 0.6))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "@dark/form-type-image[selected]/badge/title") {
            $0
                .font(Font.custom("AvenirNext-Medium", size: 12))
                .foregroundColor(Color(red: 0, green: 0.64, blue: 1, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/form-type-image[selected]/info/title") {
            $0
                .styleText { text in
                    text
                        .tracking(-0.2)
                }
                .font(Font.custom("AvenirNext-Medium", size: 14))
                .foregroundColor(Color(red: 0, green: 0.64, blue: 1, opacity: 1))
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/form-type-image[selected]/overlay") {
            $0
                .background(Color(red: 0.07, green: 0.07, blue: 0.07, opacity: 0))
                .overlay(RoundedRectangle(cornerRadius: 25).strokeBorder(Color(red: 0.07, green: 0.07, blue: 0.07, opacity: 1), style: StrokeStyle(lineWidth: 4, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
                .overlay(RoundedRectangle(cornerRadius: 25).strokeBorder(Color(red: 0, green: 0.64, blue: 1, opacity: 1), style: StrokeStyle(lineWidth: 2, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "@dark/form-type-profile-photo/image/background") {
            $0
                .background(Color(red: 0.07, green: 0.07, blue: 0.07, opacity: 1).overlay(Image("5c953cc19e315c165d7ba22a7547d815284a5ccb", bundle: nil).resizable().aspectRatio(contentMode: .fill)))
                .clipShape(RoundedRectangle(cornerRadius: 50))
        }
        stylist.addStyle(identifier: "@dark/form-type-select-inline[disabled]/badge/title") {
            $0
                .font(Font.custom("AvenirNext-Medium", size: 12))
                .foregroundColor(Color(red: 0.82, green: 0.84, blue: 0.87, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/form-type-select-inline[disabled]/subtitle") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 15))
                .foregroundColor(Color(red: 0.82, green: 0.84, blue: 0.87, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/form-type-select-inline[disabled]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 17))
                .foregroundColor(Color(red: 0.82, green: 0.84, blue: 0.87, opacity: 1))
                .lineSpacing(3)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/form-type-select-stacked[disabled]/badge/title") {
            $0
                .font(Font.custom("AvenirNext-Medium", size: 12))
                .foregroundColor(Color(red: 0.82, green: 0.84, blue: 0.87, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/form-type-select-stacked[disabled]/subtitle") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 15))
                .foregroundColor(Color(red: 0.82, green: 0.84, blue: 0.87, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/form-type-select-stacked[disabled]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 17))
                .foregroundColor(Color(red: 0.82, green: 0.84, blue: 0.87, opacity: 1))
                .lineSpacing(3)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/form-type-select[disabled]/badge/title") {
            $0
                .font(Font.custom("AvenirNext-Medium", size: 12))
                .foregroundColor(Color(red: 0.82, green: 0.84, blue: 0.87, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/form-type-select[disabled]/subtitle") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 15))
                .foregroundColor(Color(red: 0.82, green: 0.84, blue: 0.87, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/form-type-select[disabled]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 17))
                .foregroundColor(Color(red: 0.82, green: 0.84, blue: 0.87, opacity: 1))
                .lineSpacing(3)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/form-type-signature/button-tertiary/background") {
            $0
                .background(Color(red: 0.07, green: 0.07, blue: 0.07, opacity: 0))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "@dark/form-type-signature/line") {
            $0
                .overlay(Rectangle().strokeBorder(Color(red: 0.56, green: 0.57, blue: 0.64, opacity: 1), style: StrokeStyle(lineWidth: 1, lineCap: CGLineCap(rawValue: 2), lineJoin: CGLineJoin(rawValue: 0))))
        }
        stylist.addStyle(identifier: "@dark/fullscreen/background") {
            $0
                .background(Image("b5a859b5a4a68d962e6427f9fce2a2f579a28f17", bundle: nil).resizable().aspectRatio(contentMode: .fill))
        }
        stylist.addStyle(identifier: "@dark/graph-item/background") {
            $0
                .background(Color(red: 0.28, green: 0.28, blue: 0.28, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "@dark/heading/background") {
            $0
                .background(Color(red: 0.16, green: 0.16, blue: 0.16, opacity: 0))
        }
        stylist.addStyle(identifier: "@dark/heading/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("AvenirNext-Medium", size: 19))
                .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .lineSpacing(-2)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/heading[feature]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("AvenirNext-Medium", size: 22))
                .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .lineSpacing(-3)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/home-indicator/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 1))
        }
        stylist.addStyle(identifier: "@dark/homepage/note/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("AvenirNext-DemiBold", size: 24))
                .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/image/background") {
            $0
                .background(Color(red: 0.2, green: 0.2, blue: 0.2, opacity: 1).overlay(Image("d1dfb56cf342436cb051370564838256ff90c98b", bundle: nil).resizable().aspectRatio(contentMode: .fill)))
                .clipShape(RoundedRectangle(cornerRadius: 10))
        }
        stylist.addStyle(identifier: "@dark/image/line") {
            $0
                .overlay(Rectangle().strokeBorder(Color(red: 0.07, green: 0.07, blue: 0.07, opacity: 1), style: StrokeStyle(lineWidth: 3, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
        }
        stylist.addStyle(identifier: "@dark/image/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 18))
                .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .lineSpacing(6)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/image[highlighted]/background") {
            $0
                .background(Color(red: 0.2, green: 0.2, blue: 0.2, opacity: 1).overlay(Image("d1dfb56cf342436cb051370564838256ff90c98b", bundle: nil).resizable().aspectRatio(contentMode: .fill)))
                .overlay(RoundedRectangle(cornerRadius: 10).strokeBorder(Color(red: 0.07, green: 0.07, blue: 0.07, opacity: 1), style: StrokeStyle(lineWidth: 5, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
                .overlay(RoundedRectangle(cornerRadius: 10).strokeBorder(Color(red: 0, green: 0.64, blue: 1, opacity: 1), style: StrokeStyle(lineWidth: 2, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
                .clipShape(RoundedRectangle(cornerRadius: 10))
        }
        stylist.addStyle(identifier: "@dark/image[icon-highlighted]/background") {
            $0
                .background(Color(red: 0.2, green: 0.2, blue: 0.2, opacity: 1).overlay(Image("d1dfb56cf342436cb051370564838256ff90c98b", bundle: nil).resizable().aspectRatio(contentMode: .fill)))
                .overlay(RoundedRectangle(cornerRadius: 10).strokeBorder(Color(red: 0.07, green: 0.07, blue: 0.07, opacity: 1), style: StrokeStyle(lineWidth: 5, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
                .overlay(RoundedRectangle(cornerRadius: 10).strokeBorder(Color(red: 0, green: 0.64, blue: 1, opacity: 1), style: StrokeStyle(lineWidth: 2, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
                .clipShape(RoundedRectangle(cornerRadius: 10))
        }
        stylist.addStyle(identifier: "@dark/image[loading]/background") {
            $0
                .background(Color(red: 0.2, green: 0.2, blue: 0.2, opacity: 1).overlay(Image("30bf39b5b9c4a0f9ce5ddc6c6f33f21810aed7ac", bundle: nil).resizable().aspectRatio(contentMode: .fill)))
                .clipShape(RoundedRectangle(cornerRadius: 10))
        }
        stylist.addStyle(identifier: "@dark/indicator/background") {
            $0
                .background(Color(red: 0.55, green: 0.82, blue: 0.02, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "@dark/indicator[low-stock]/background") {
            $0
                .background(Color(red: 0.87, green: 0.5, blue: 0, opacity: 1))
                .overlay(RoundedRectangle(cornerRadius: 25).strokeBorder(Color(red: 0, green: 0, blue: 0, opacity: 1), style: StrokeStyle(lineWidth: 2, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "@dark/indicator[no-stock]/background") {
            $0
                .background(Color(red: 0.7, green: 0.7, blue: 0.7, opacity: 1))
                .overlay(RoundedRectangle(cornerRadius: 25).strokeBorder(Color(red: 0, green: 0, blue: 0, opacity: 1), style: StrokeStyle(lineWidth: 2, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "@dark/indicator[out-of-stock]/background") {
            $0
                .background(Color(red: 0.79, green: 0, blue: 0, opacity: 1))
                .overlay(RoundedRectangle(cornerRadius: 25).strokeBorder(Color(red: 0, green: 0, blue: 0, opacity: 1), style: StrokeStyle(lineWidth: 2, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "@dark/info/subtitle") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 15))
                .foregroundColor(Color(red: 0.69, green: 0.69, blue: 0.69, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/info/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 15))
                .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/info[label-error]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 15))
                .foregroundColor(Color(red: 0.97, green: 0, blue: 0, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/info[label-highlighted]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Semibold", size: 15))
                .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/input/background") {
            $0
                .background(Color(red: 0.16, green: 0.16, blue: 0.16, opacity: 0))
        }
        stylist.addStyle(identifier: "@dark/input/badge/background") {
            $0
                .background(Color(red: 0, green: 0, blue: 0, opacity: 0))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "@dark/input/badge/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 15))
                .foregroundColor(Color(red: 0.84, green: 0.84, blue: 0.84, opacity: 1))
                .lineSpacing(7)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/input/body") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 15))
                .foregroundColor(Color(red: 0.69, green: 0.69, blue: 0.69, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/input/button-tertiary/background") {
            $0
                .background(Color(red: 0.07, green: 0.07, blue: 0.07, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "@dark/input/carousel/background") {
            $0
                .background(Color(red: 0.2, green: 0.2, blue: 0.2, opacity: 1).overlay(Image("d1dfb56cf342436cb051370564838256ff90c98b", bundle: nil).resizable().aspectRatio(contentMode: .fill)))
                .overlay(RoundedRectangle(cornerRadius: 15).strokeBorder(Color(red: 0.07, green: 0.07, blue: 0.07, opacity: 1), style: StrokeStyle(lineWidth: 1, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
                .clipShape(RoundedRectangle(cornerRadius: 15))
        }
        stylist.addStyle(identifier: "@dark/input/carousel/indicator/background") {
            $0
                .background(Color(red: 0.3, green: 0.82, blue: 0, opacity: 1))
                .overlay(RoundedRectangle(cornerRadius: 25).strokeBorder(Color(red: 0.07, green: 0.07, blue: 0.07, opacity: 1), style: StrokeStyle(lineWidth: 2, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "@dark/input/carousel/overlay") {
            $0
                .overlay(RoundedRectangle(cornerRadius: 15).strokeBorder(Color(red: 0.07, green: 0.07, blue: 0.07, opacity: 1), style: StrokeStyle(lineWidth: 2, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
                .clipShape(RoundedRectangle(cornerRadius: 15))
        }
        stylist.addStyle(identifier: "@dark/input/carousel[disabled]/overlay") {
            $0
                .background(Color(red: 0.07, green: 0.07, blue: 0.07, opacity: 0.8001969999999999))
                .overlay(RoundedRectangle(cornerRadius: 15).strokeBorder(Color(red: 0.07, green: 0.07, blue: 0.07, opacity: 1), style: StrokeStyle(lineWidth: 2, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
                .clipShape(RoundedRectangle(cornerRadius: 15))
        }
        stylist.addStyle(identifier: "@dark/input/carousel[selected]/overlay") {
            $0
                .overlay(RoundedRectangle(cornerRadius: 15).strokeBorder(Color(red: 0.07, green: 0.07, blue: 0.07, opacity: 1), style: StrokeStyle(lineWidth: 4, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
                .overlay(RoundedRectangle(cornerRadius: 15).strokeBorder(Color(red: 0, green: 0.64, blue: 1, opacity: 1), style: StrokeStyle(lineWidth: 2, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
                .clipShape(RoundedRectangle(cornerRadius: 15))
        }
        stylist.addStyle(identifier: "@dark/input/divider/background") {
            $0
                .background(Color(red: 0.22, green: 0.22, blue: 0.22, opacity: 1))
        }
        stylist.addStyle(identifier: "@dark/input/subtitle") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("AvenirNext-Regular", size: 14))
                .foregroundColor(Color(red: 0.69, green: 0.69, blue: 0.69, opacity: 1))
                .lineSpacing(3)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/input/tag-status/background") {
            $0
                .background(Color(red: 0.07, green: 0.07, blue: 0.07, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 4))
        }
        stylist.addStyle(identifier: "@dark/input/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 17))
                .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .lineSpacing(5)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/input[blurred]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 17))
                .foregroundColor(Color(red: 0.43, green: 0.43, blue: 0.43, opacity: 1))
                .lineSpacing(5)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/input[date-time-blurred]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 17))
                .foregroundColor(Color(red: 0.43, green: 0.43, blue: 0.43, opacity: 1))
                .lineSpacing(5)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/input[disabled]/subtitle") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("AvenirNext-Regular", size: 14))
                .foregroundColor(Color(red: 0.45, green: 0.46, blue: 0.47, opacity: 1))
                .lineSpacing(3)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/input[disabled]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 17))
                .foregroundColor(Color(red: 0.45, green: 0.46, blue: 0.47, opacity: 1))
                .lineSpacing(5)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/input[error]/body") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 12))
                .foregroundColor(Color(red: 0.69, green: 0.69, blue: 0.69, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/input[error]/divider/background") {
            $0
                .background(Color(red: 0.97, green: 0, blue: 0, opacity: 1))
        }
        stylist.addStyle(identifier: "@dark/input[error]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 17))
                .foregroundColor(Color(red: 0.97, green: 0, blue: 0, opacity: 1))
                .lineSpacing(5)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/input[radio-box-disabled]/badge/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 15))
                .foregroundColor(Color(red: 0.43, green: 0.43, blue: 0.43, opacity: 1))
                .lineSpacing(7)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/input[radio-box-disabled]/subtitle") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 15))
                .foregroundColor(Color(red: 0.43, green: 0.43, blue: 0.43, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.trailing)
                .frame(alignment: .trailing)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/input[radio-box-disabled]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 17))
                .foregroundColor(Color(red: 0.43, green: 0.43, blue: 0.43, opacity: 1))
                .lineSpacing(5)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/input[radio-box-preview-disabled]/badge/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 15))
                .foregroundColor(Color(red: 0.43, green: 0.43, blue: 0.43, opacity: 1))
                .lineSpacing(7)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/input[radio-box-preview-disabled]/subtitle") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 15))
                .foregroundColor(Color(red: 0.43, green: 0.43, blue: 0.43, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.trailing)
                .frame(alignment: .trailing)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/input[radio-box-preview-disabled]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 17))
                .foregroundColor(Color(red: 0.43, green: 0.43, blue: 0.43, opacity: 1))
                .lineSpacing(5)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/input[radio-box]/body") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 15))
                .foregroundColor(Color(red: 0.69, green: 0.69, blue: 0.69, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.trailing)
                .frame(alignment: .trailing)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/input[warning]/divider/background") {
            $0
                .background(Color(red: 1, green: 0.65, blue: 0, opacity: 1))
        }
        stylist.addStyle(identifier: "@dark/line") {
            $0
                .overlay(Rectangle().strokeBorder(Color(red: 0.43, green: 0.43, blue: 0.43, opacity: 1), style: StrokeStyle(lineWidth: 1, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
        }
        stylist.addStyle(identifier: "@dark/list-row/background") {
            $0
                .background(Color(red: 0.22, green: 0.22, blue: 0.22, opacity: 0))
        }
        stylist.addStyle(identifier: "@dark/list-row/body") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 16))
                .foregroundColor(Color(red: 0.55, green: 0.55, blue: 0.55, opacity: 1))
                .lineSpacing(1)
                .multilineTextAlignment(.trailing)
                .frame(alignment: .trailing)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/list-row/divider/background") {
            $0
                .background(Color(red: 0.16, green: 0.16, blue: 0.16, opacity: 1))
        }
        stylist.addStyle(identifier: "@dark/list-row/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 18))
                .foregroundColor(Color(red: 0.74, green: 0.74, blue: 0.74, opacity: 1))
                .lineSpacing(-1)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/list-row[double-edit]/body") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 16))
                .foregroundColor(Color(red: 0.55, green: 0.55, blue: 0.55, opacity: 1))
                .lineSpacing(1)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/list-row[highlighted]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 18))
                .foregroundColor(Color(red: 0.99, green: 0, blue: 0, opacity: 1))
                .lineSpacing(-1)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/list-row[stacked]/body") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 16))
                .foregroundColor(Color(red: 0.55, green: 0.55, blue: 0.55, opacity: 1))
                .lineSpacing(1)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/list-row[task-completed]/body") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 16))
                .foregroundColor(Color(red: 0.44, green: 0.44, blue: 0.44, opacity: 1))
                .lineSpacing(1)
                .multilineTextAlignment(.trailing)
                .frame(alignment: .trailing)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/list-row[task-completed]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                        .strikethrough(true)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 18))
                .foregroundColor(Color(red: 0.44, green: 0.44, blue: 0.44, opacity: 1))
                .lineSpacing(-1)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/list-row[task]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 18))
                .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .lineSpacing(-1)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/list/background") {
            $0
                .background(Color(red: 0.22, green: 0.22, blue: 0.22, opacity: 0))
        }
        stylist.addStyle(identifier: "@dark/list/divider/background") {
            $0
                .background(Color(red: 0.16, green: 0.16, blue: 0.16, opacity: 1))
        }
        stylist.addStyle(identifier: "@dark/login/background") {
            $0
                .background(Image("b5a859b5a4a68d962e6427f9fce2a2f579a28f17", bundle: nil).resizable().aspectRatio(contentMode: .fill))
        }
        stylist.addStyle(identifier: "@dark/login/status-bar/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 1))
        }
        stylist.addStyle(identifier: "@dark/login/subtitle") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("AvenirNext-Regular", size: 14))
                .foregroundColor(Color(red: 0.69, green: 0.69, blue: 0.69, opacity: 1))
                .lineSpacing(3)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/login/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("AvenirNext-Regular", size: 18))
                .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/login[keycloak]/background") {
            $0
                .background(Color(red: 0.07, green: 0.07, blue: 0.07, opacity: 1))
        }
        stylist.addStyle(identifier: "@dark/login[keycloak]/overlay") {
            $0
                .background(Image("b5a859b5a4a68d962e6427f9fce2a2f579a28f17", bundle: nil).resizable().aspectRatio(contentMode: .fill))
        }
        stylist.addStyle(identifier: "@dark/message-view/background") {
            $0
                .background(Color(red: 0.07, green: 0.07, blue: 0.07, opacity: 0))
        }
        stylist.addStyle(identifier: "@dark/message-view/subtitle") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 15))
                .foregroundColor(Color(red: 0.69, green: 0.69, blue: 0.69, opacity: 1))
                .lineSpacing(3)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/message-view/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("AvenirNext-Medium", size: 16))
                .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .lineSpacing(6)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/modal/background") {
            $0
                .background(Color(red: 0.06, green: 0.06, blue: 0.06, opacity: 1))
        }
        stylist.addStyle(identifier: "@dark/modal/button-icon-left/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Medium", size: 17))
                .foregroundColor(Color(red: 0, green: 0.64, blue: 1, opacity: 1))
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/modal/button-icon-right/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Medium", size: 17))
                .foregroundColor(Color(red: 0, green: 0.64, blue: 1, opacity: 1))
                .multilineTextAlignment(.trailing)
                .frame(alignment: .trailing)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/modal/heading/background") {
            $0
                .background(Color(red: 0.06, green: 0.06, blue: 0.06, opacity: 1))
        }
        stylist.addStyle(identifier: "@dark/modal/navbar/background") {
            $0
                .background(Color(red: 0.22, green: 0.22, blue: 0.22, opacity: 1))
        }
        stylist.addStyle(identifier: "@dark/modal/navbar/button-icon-left/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Medium", size: 17))
                .foregroundColor(Color(red: 0, green: 0.64, blue: 1, opacity: 1))
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/modal/navbar/button-icon-right/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Medium", size: 17))
                .foregroundColor(Color(red: 0, green: 0.64, blue: 1, opacity: 1))
                .multilineTextAlignment(.trailing)
                .frame(alignment: .trailing)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/modal/navbar/button-icon-right[disabled]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Medium", size: 17))
                .foregroundColor(Color(red: 0.43, green: 0.43, blue: 0.43, opacity: 1))
                .multilineTextAlignment(.trailing)
                .frame(alignment: .trailing)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/modal/navbar/divider/background") {
            $0
                .background(Color(red: 0.22, green: 0.22, blue: 0.22, opacity: 1))
        }
        stylist.addStyle(identifier: "@dark/modal/navbar/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("AvenirNext-Medium", size: 18))
                .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .lineSpacing(4)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/modal/search[highlighted]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("AvenirNext-Regular", size: 16))
                .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .lineSpacing(3)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/modal/searchbar/background") {
            $0
                .background(Color(red: 0.22, green: 0.22, blue: 0.22, opacity: 1))
        }
        stylist.addStyle(identifier: "@dark/modal/searchbar/divider/background") {
            $0
                .background(Color(red: 0.22, green: 0.22, blue: 0.22, opacity: 1))
        }
        stylist.addStyle(identifier: "@dark/modal/searchbar/search/background") {
            $0
                .background(Color(red: 0.14, green: 0.14, blue: 0.14, opacity: 1))
        }
        stylist.addStyle(identifier: "@dark/modal/subtitle") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("AvenirNext-Medium", size: 14))
                .foregroundColor(Color(red: 0.69, green: 0.69, blue: 0.69, opacity: 1))
                .lineSpacing(4)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/modal/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("AvenirNext-Medium", size: 16))
                .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .lineSpacing(6)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/modal[tray]/background") {
            $0
                .background(Color(red: 0.22, green: 0.22, blue: 0.22, opacity: 1))
        }
        stylist.addStyle(identifier: "@dark/modal[tray]/navbar/background") {
            $0
                .background(Color(red: 0.22, green: 0.22, blue: 0.22, opacity: 1))
        }
        stylist.addStyle(identifier: "@dark/modal[tray]/navbar/divider/background") {
            $0
                .background(Color(red: 0.22, green: 0.22, blue: 0.22, opacity: 1))
        }
        stylist.addStyle(identifier: "@dark/modal[tray]/navbar/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("AvenirNext-Medium", size: 18))
                .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .lineSpacing(4)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/navbar-profile/background") {
            $0
                .background(Color(red: 0, green: 0, blue: 0, opacity: 1))
        }
        stylist.addStyle(identifier: "@dark/navbar-profile/block/background") {
            $0
                .background(Color(red: 0, green: 0, blue: 0, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        stylist.addStyle(identifier: "@dark/navbar-profile/block/subtitle") {
            $0
                .styleText { text in
                    text
                        .tracking(-0.1)
                }
                .font(Font.custom("SFProDisplay-Medium", size: 10))
                .foregroundColor(Color(red: 0.69, green: 0.69, blue: 0.69, opacity: 1))
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "@dark/navbar-profile/button-tertiary/background") {
            $0
                .background(Color(red: 0, green: 0, blue: 0, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "@dark/navbar-profile/divider/background") {
            $0
                .background(Color(red: 0, green: 0, blue: 0, opacity: 1))
        }
        stylist.addStyle(identifier: "@dark/navbar-profile/info/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("AvenirNext-Medium", size: 16))
                .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .lineSpacing(4)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/navbar/background") {
            $0
                .background(Color(red: 0, green: 0, blue: 0, opacity: 1))
        }
        stylist.addStyle(identifier: "@dark/navbar/button-icon-right[disabled]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Medium", size: 17))
                .foregroundColor(Color(red: 0.43, green: 0.43, blue: 0.43, opacity: 1))
                .multilineTextAlignment(.trailing)
                .frame(alignment: .trailing)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/navbar/divider/background") {
            $0
                .background(Color(red: 0, green: 0, blue: 0, opacity: 1))
        }
        stylist.addStyle(identifier: "@dark/navbar/overlay") {
            $0
                .background(Color(red: 0, green: 0, blue: 0, opacity: 0.60098).overlay(LinearGradient(gradient: Gradient(stops:[.init(color: Color(red: 0, green: 0, blue: 0, opacity: 0.5), location: 0),.init(color: Color(red: 0, green: 0, blue: 0, opacity: 0), location: 1)]), startPoint: UnitPoint(x: 0.5, y: 0), endPoint: UnitPoint(x: 0.5, y: 0.5))))
        }
        stylist.addStyle(identifier: "@dark/navbar[image-search]/searchbar/search/background") {
            $0
                .background(Color(red: 0, green: 0, blue: 0, opacity: 0.25))
        }
        stylist.addStyle(identifier: "@dark/navbar[image]/searchbar/search/background") {
            $0
                .background(Color(red: 0, green: 0, blue: 0, opacity: 0.25))
        }
        stylist.addStyle(identifier: "@dark/note-instructions/background") {
            $0
                .background(Color(red: 0.18, green: 0.18, blue: 0.18, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        stylist.addStyle(identifier: "@dark/note-instructions/body") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 14))
                .foregroundColor(Color(red: 0.69, green: 0.69, blue: 0.69, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/note-instructions/subtitle") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("AvenirNext-Medium", size: 14))
                .foregroundColor(Color(red: 0.69, green: 0.69, blue: 0.69, opacity: 1))
                .lineSpacing(8)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/note-instructions/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("AvenirNext-Medium", size: 16))
                .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .lineSpacing(6)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/note-instructions[alert]/background") {
            $0
                .background(Color(red: 0.24, green: 0.02, blue: 0.02, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        stylist.addStyle(identifier: "@dark/note-instructions[alert]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("AvenirNext-Medium", size: 16))
                .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .lineSpacing(6)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/note/body") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 15))
                .foregroundColor(Color(red: 0.69, green: 0.69, blue: 0.69, opacity: 1))
                .lineSpacing(4)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/note/progress-item[disabled]/background") {
            $0
                .background(Color(red: 0.15, green: 0.15, blue: 0.15, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        stylist.addStyle(identifier: "@dark/note/subtitle") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Medium", size: 15))
                .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .multilineTextAlignment(.trailing)
                .frame(alignment: .trailing)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/note/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("AvenirNext-Medium", size: 15))
                .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/note[alert]/body") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 15))
                .foregroundColor(Color(red: 0.96, green: 0.03, blue: 0.03, opacity: 1))
                .lineSpacing(4)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/note[alert]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("AvenirNext-Medium", size: 14))
                .foregroundColor(Color(red: 0.96, green: 0.03, blue: 0.03, opacity: 1))
                .lineSpacing(3)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "@dark/note[status]/background") {
            $0
                .background(Color(red: 0.18, green: 0.18, blue: 0.18, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        stylist.addStyle(identifier: "@dark/notification/background") {
            $0
                .background(Color(red: 0.07, green: 0.07, blue: 0.07, opacity: 1))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(Color(red: 0.24, green: 0.24, blue: 0.24, opacity: 1), style: StrokeStyle(lineWidth: 1, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.2), radius: 20, x: 0, y: 10)
        }
        stylist.addStyle(identifier: "@dark/notification/body") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 12))
                .foregroundColor(Color(red: 0.69, green: 0.69, blue: 0.69, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.trailing)
                .frame(alignment: .trailing)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/notification/info[label]/subtitle") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 13))
                .foregroundColor(Color(red: 0.69, green: 0.69, blue: 0.69, opacity: 1))
                .lineSpacing(1)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/notification/info[label]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 13))
                .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .lineSpacing(1)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/notification/subtitle") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 13))
                .foregroundColor(Color(red: 0.69, green: 0.69, blue: 0.69, opacity: 1))
                .lineSpacing(1)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/notification/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 15))
                .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .lineSpacing(3)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/notification/underlay") {
            $0
                .background(Color(red: 0, green: 0.64, blue: 1, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        stylist.addStyle(identifier: "@dark/notification[read]/background") {
            $0
                .background(Color(red: 0.07, green: 0.07, blue: 0.07, opacity: 1))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(Color(red: 0.24, green: 0.24, blue: 0.24, opacity: 1), style: StrokeStyle(lineWidth: 1, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        stylist.addStyle(identifier: "@dark/notification[swipe]/background") {
            $0
                .background(Color(red: 0.18, green: 0.18, blue: 0.18, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        stylist.addStyle(identifier: "@dark/notification[unread]/background") {
            $0
                .background(Color(red: 0.18, green: 0.18, blue: 0.18, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        stylist.addStyle(identifier: "@dark/overlay") {
            $0
                .background(Color(red: 0, green: 0, blue: 0, opacity: 0.3))
        }
        stylist.addStyle(identifier: "@dark/product/background") {
            $0
                .background(Color(red: 0.07, green: 0.07, blue: 0.07, opacity: 1))
        }
        stylist.addStyle(identifier: "@dark/product/body") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 15))
                .foregroundColor(Color(red: 0.69, green: 0.69, blue: 0.69, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/product/image/line") {
            $0
                .overlay(Rectangle().strokeBorder(Color(red: 0.18, green: 0.18, blue: 0.18, opacity: 1), style: StrokeStyle(lineWidth: 3, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
        }
        stylist.addStyle(identifier: "@dark/product/subtitle") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("AvenirNext-Medium", size: 10))
                .foregroundColor(Color(red: 0.69, green: 0.69, blue: 0.69, opacity: 1))
                .lineSpacing(1)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "@dark/product/tag-primary/background") {
            $0
                .background(Color(red: 0.18, green: 0.18, blue: 0.18, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 4))
        }
        stylist.addStyle(identifier: "@dark/product/tag-primary/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("AvenirNext-Medium", size: 12))
                .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .lineSpacing(-2)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "@dark/product/tag-primary[highlighted]/background") {
            $0
                .background(Color(red: 0.37, green: 0.09, blue: 0.09, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 4))
        }
        stylist.addStyle(identifier: "@dark/product/tag-primary[highlighted]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("AvenirNext-Medium", size: 12))
                .foregroundColor(Color(red: 0.97, green: 0, blue: 0, opacity: 1))
                .lineSpacing(-2)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "@dark/product/tag-secondary/background") {
            $0
                .background(Color(red: 0, green: 0, blue: 0, opacity: 0))
                .clipShape(RoundedRectangle(cornerRadius: 4))
        }
        stylist.addStyle(identifier: "@dark/product/tag-secondary/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                        .strikethrough(true)
                }
                .font(Font.custom("AvenirNext-Medium", size: 12))
                .foregroundColor(Color(red: 0.69, green: 0.69, blue: 0.69, opacity: 1))
                .lineSpacing(-2)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "@dark/product/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("AvenirNext-Medium", size: 17))
                .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .lineSpacing(1)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/product[group-swipe]/background") {
            $0
                .background(Color(red: 0.18, green: 0.18, blue: 0.18, opacity: 1))
        }
        stylist.addStyle(identifier: "@dark/product[group-swipe]/button-tertiary/background") {
            $0
                .background(Color(red: 0.18, green: 0.18, blue: 0.18, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "@dark/product[group]/background") {
            $0
                .background(Color(red: 0.18, green: 0.18, blue: 0.18, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        stylist.addStyle(identifier: "@dark/product[group]/button-tertiary/background") {
            $0
                .background(Color(red: 0.18, green: 0.18, blue: 0.18, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "@dark/product[info]/button-tertiary/background") {
            $0
                .background(Color(red: 0.07, green: 0.07, blue: 0.07, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "@dark/product[info]/button-tertiary/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("AvenirNext-Medium", size: 10))
                .foregroundColor(Color(red: 0.69, green: 0.69, blue: 0.69, opacity: 1))
                .lineSpacing(1)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "@dark/product[info]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2666666666666667)
                }
                .font(Font.custom("AvenirNext-Medium", size: 24))
                .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/product[item]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("AvenirNext-Medium", size: 15))
                .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .lineSpacing(3)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/product[row-swipe]/background") {
            $0
                .background(Color(red: 0.18, green: 0.18, blue: 0.18, opacity: 1))
        }
        stylist.addStyle(identifier: "@dark/product[row]/background") {
            $0
                .background(Color(red: 0.18, green: 0.18, blue: 0.18, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        stylist.addStyle(identifier: "@dark/product[row]/tag-primary/background") {
            $0
                .background(Color(red: 0, green: 0, blue: 0, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 4))
        }
        stylist.addStyle(identifier: "@dark/product[row]/tag-primary[highlighted]/background") {
            $0
                .background(Color(red: 0.4, green: 0.05, blue: 0.05, opacity: 1).overlay(Color(red: 0, green: 0, blue: 0, opacity: 1)))
                .clipShape(RoundedRectangle(cornerRadius: 4))
        }
        stylist.addStyle(identifier: "@dark/products/client-row/background") {
            $0
                .background(Color(red: 0.07, green: 0.07, blue: 0.07, opacity: 1))
        }
        stylist.addStyle(identifier: "@dark/products/list-row/background") {
            $0
                .background(Color(red: 0.07, green: 0.07, blue: 0.07, opacity: 1))
        }
        stylist.addStyle(identifier: "@dark/products/list/background") {
            $0
                .background(Color(red: 0.07, green: 0.07, blue: 0.07, opacity: 1))
        }
        stylist.addStyle(identifier: "@dark/progress-item/background") {
            $0
                .background(Color(red: 0, green: 0.64, blue: 1, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        stylist.addStyle(identifier: "@dark/progress-item[disabled]/background") {
            $0
                .background(Color(red: 0.27, green: 0.27, blue: 0.27, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        stylist.addStyle(identifier: "@dark/pulldown-item/background") {
            $0
                .background(Color(red: 0.18, green: 0.18, blue: 0.18, opacity: 0))
        }
        stylist.addStyle(identifier: "@dark/pulldown-item/divider/background") {
            $0
                .background(Color(red: 0.32, green: 0.32, blue: 0.32, opacity: 1))
        }
        stylist.addStyle(identifier: "@dark/pulldown-item/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2125)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 17))
                .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/pulldown-item[alert]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2125)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 17))
                .foregroundColor(Color(red: 0.97, green: 0, blue: 0, opacity: 1))
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/pulldown-item[disabled]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2125)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 17))
                .foregroundColor(Color(red: 0.4, green: 0.4, blue: 0.4, opacity: 1))
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/pulldown/background") {
            $0
                .background(Color(red: 0.07, green: 0.07, blue: 0.07, opacity: 1))
                .blur(radius: 0)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.2), radius: 20, x: 0, y: 10)
        }
        stylist.addStyle(identifier: "@dark/qr-code/background") {
            $0
                .background(Color(red: 0, green: 0, blue: 0, opacity: 0))
        }
        stylist.addStyle(identifier: "@dark/qr-code/overlay") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 1))
        }
        stylist.addStyle(identifier: "@dark/rating-details/body") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Medium", size: 15))
                .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .multilineTextAlignment(.trailing)
                .frame(alignment: .trailing)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/rating-details/button-tertiary/background") {
            $0
                .background(Color(red: 0.07, green: 0.07, blue: 0.07, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "@dark/rating-details/progress-item[disabled]/background") {
            $0
                .background(Color(red: 0.15, green: 0.14, blue: 0.14, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        stylist.addStyle(identifier: "@dark/rating-details/subtitle") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("AvenirNext-Regular", size: 12))
                .foregroundColor(Color(red: 0.69, green: 0.69, blue: 0.69, opacity: 1))
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "@dark/rating-details/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("AvenirNext-Medium", size: 28))
                .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .lineSpacing(4)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/search/background") {
            $0
                .background(Color(red: 0.19, green: 0.19, blue: 0.19, opacity: 1))
        }
        stylist.addStyle(identifier: "@dark/search/title") {
            $0
                .font(Font.custom("SFProDisplay-Regular", size: 16))
                .foregroundColor(Color(red: 0.71, green: 0.71, blue: 0.71, opacity: 1))
                .lineSpacing(3)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/search[highlighted]/title") {
            $0
                .font(Font.custom("SFProDisplay-Regular", size: 16))
                .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .lineSpacing(3)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/searchbar/background") {
            $0
                .background(Color(red: 0, green: 0, blue: 0, opacity: 1))
        }
        stylist.addStyle(identifier: "@dark/searchbar/divider/background") {
            $0
                .background(Color(red: 0, green: 0, blue: 0, opacity: 1))
        }
        stylist.addStyle(identifier: "@dark/signature/button-tertiary/background") {
            $0
                .background(Color(red: 0.07, green: 0.07, blue: 0.07, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "@dark/signature/line") {
            $0
                .overlay(Rectangle().strokeBorder(Color(red: 0.43, green: 0.43, blue: 0.43, opacity: 1), style: StrokeStyle(lineWidth: 1, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
        }
        stylist.addStyle(identifier: "@dark/signature[disabled]/line") {
            $0
                .overlay(Rectangle().strokeBorder(Color(red: 0.18, green: 0.18, blue: 0.18, opacity: 1), style: StrokeStyle(lineWidth: 1, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
        }
        stylist.addStyle(identifier: "@dark/signature[disabled]/subtitle") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("AvenirNext-Medium", size: 14))
                .foregroundColor(Color(red: 0.45, green: 0.46, blue: 0.47, opacity: 1))
                .lineSpacing(3)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/spinner/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 1))
        }
        stylist.addStyle(identifier: "@dark/stat-item/background") {
            $0
                .background(Color(red: 0.18, green: 0.18, blue: 0.18, opacity: 1))
        }
        stylist.addStyle(identifier: "@dark/stat-item/subtitle") {
            $0
                .font(Font.custom("SFProDisplay-Regular", size: 12))
                .foregroundColor(Color(red: 0.69, green: 0.69, blue: 0.69, opacity: 1))
                .lineSpacing(-2)
                .multilineTextAlignment(.trailing)
                .frame(alignment: .trailing)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/stat-item/title") {
            $0
                .font(Font.custom("SFProDisplay-Medium", size: 13))
                .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .lineSpacing(-3)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/stepper/background") {
            $0
                .background(Color(red: 0.2, green: 0.2, blue: 0.2, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        stylist.addStyle(identifier: "@dark/stepper/line") {
            $0
                .overlay(Rectangle().strokeBorder(Color(red: 0.32, green: 0.32, blue: 0.32, opacity: 1), style: StrokeStyle(lineWidth: 1, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 1))))
        }
        stylist.addStyle(identifier: "@dark/subtitle") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("AvenirNext-Medium", size: 14))
                .foregroundColor(Color(red: 0.65, green: 0.65, blue: 0.65, opacity: 1))
                .lineSpacing(3)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/tabbar/background") {
            $0
                .background(Color(red: 0, green: 0, blue: 0, opacity: 1))
        }
        stylist.addStyle(identifier: "@dark/tabbar/divider/background") {
            $0
                .background(Color(red: 0, green: 0, blue: 0, opacity: 1))
        }
        stylist.addStyle(identifier: "@dark/tabswitch/background") {
            $0
                .background(Color(red: 0.07, green: 0.07, blue: 0.07, opacity: 1))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(Color(red: 0.18, green: 0.18, blue: 0.18, opacity: 1), style: StrokeStyle(lineWidth: 1, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        stylist.addStyle(identifier: "@dark/tag-primary-icon/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 4))
        }
        stylist.addStyle(identifier: "@dark/tag-primary/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 4))
        }
        stylist.addStyle(identifier: "@dark/tag-primary/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Medium", size: 11))
                .foregroundColor(Color(red: 0, green: 0, blue: 0, opacity: 1))
                .lineSpacing(-1)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "@dark/tag-secondary/background") {
            $0
                .background(Color(red: 0.34, green: 0.34, blue: 0.34, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 4))
        }
        stylist.addStyle(identifier: "@dark/tag-secondary/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Medium", size: 11))
                .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .lineSpacing(-1)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "@dark/tag-secondary[add]/background") {
            $0
                .background(Color(red: 0.27, green: 0.7, blue: 0.03, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 4))
        }
        stylist.addStyle(identifier: "@dark/tag-secondary[add]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Medium", size: 11))
                .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .lineSpacing(-1)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "@dark/tag-secondary[alert]/background") {
            $0
                .background(Color(red: 0.24, green: 0.02, blue: 0.02, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 4))
        }
        stylist.addStyle(identifier: "@dark/tag-secondary[alert]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Medium", size: 11))
                .foregroundColor(Color(red: 0.97, green: 0, blue: 0, opacity: 1))
                .lineSpacing(-1)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "@dark/tag-secondary[appointments]/background") {
            $0
                .background(Color(red: 0.07, green: 0.07, blue: 0.07, opacity: 1))
                .overlay(RoundedRectangle(cornerRadius: 4).strokeBorder(Color(red: 1, green: 0.51, blue: 0.51, opacity: 1), style: StrokeStyle(lineWidth: 1, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
                .clipShape(RoundedRectangle(cornerRadius: 4))
        }
        stylist.addStyle(identifier: "@dark/tag-secondary[appointments]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Medium", size: 11))
                .foregroundColor(Color(red: 1, green: 0.51, blue: 0.51, opacity: 1))
                .lineSpacing(-1)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "@dark/tag-secondary[consultation]/background") {
            $0
                .background(Color(red: 0.07, green: 0.07, blue: 0.07, opacity: 1))
                .overlay(RoundedRectangle(cornerRadius: 4).strokeBorder(Color(red: 0.27, green: 0.7, blue: 0.03, opacity: 1), style: StrokeStyle(lineWidth: 1, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
                .clipShape(RoundedRectangle(cornerRadius: 4))
        }
        stylist.addStyle(identifier: "@dark/tag-secondary[consultation]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Medium", size: 11))
                .foregroundColor(Color(red: 0.27, green: 0.7, blue: 0.03, opacity: 1))
                .lineSpacing(-1)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "@dark/tag-secondary[delete]/background") {
            $0
                .background(Color(red: 0.82, green: 0.04, blue: 0.04, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 4))
        }
        stylist.addStyle(identifier: "@dark/tag-secondary[delete]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Medium", size: 11))
                .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .lineSpacing(-1)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "@dark/tag-secondary[important]/background") {
            $0
                .background(Color(red: 0.07, green: 0.07, blue: 0.07, opacity: 1))
                .overlay(RoundedRectangle(cornerRadius: 4).strokeBorder(Color(red: 0.89, green: 0.7, blue: 0.02, opacity: 1), style: StrokeStyle(lineWidth: 1, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
                .clipShape(RoundedRectangle(cornerRadius: 4))
        }
        stylist.addStyle(identifier: "@dark/tag-secondary[important]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Medium", size: 11))
                .foregroundColor(Color(red: 0.89, green: 0.7, blue: 0.02, opacity: 1))
                .lineSpacing(-1)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "@dark/tag-secondary[newsletter]/background") {
            $0
                .background(Color(red: 0.07, green: 0.07, blue: 0.07, opacity: 1))
                .overlay(RoundedRectangle(cornerRadius: 4).strokeBorder(Color(red: 0.75, green: 0.03, blue: 0.78, opacity: 1), style: StrokeStyle(lineWidth: 1, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
                .clipShape(RoundedRectangle(cornerRadius: 4))
        }
        stylist.addStyle(identifier: "@dark/tag-secondary[newsletter]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Medium", size: 11))
                .foregroundColor(Color(red: 0.75, green: 0.03, blue: 0.78, opacity: 1))
                .lineSpacing(-1)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "@dark/tag-secondary[outreaches]/background") {
            $0
                .background(Color(red: 0.07, green: 0.07, blue: 0.07, opacity: 1))
                .overlay(RoundedRectangle(cornerRadius: 4).strokeBorder(Color(red: 0.16, green: 0.37, blue: 0.89, opacity: 1), style: StrokeStyle(lineWidth: 1, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
                .clipShape(RoundedRectangle(cornerRadius: 4))
        }
        stylist.addStyle(identifier: "@dark/tag-secondary[outreaches]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Medium", size: 11))
                .foregroundColor(Color(red: 0.16, green: 0.37, blue: 0.89, opacity: 1))
                .lineSpacing(-1)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "@dark/tag-secondary[transactions]/background") {
            $0
                .background(Color(red: 0.07, green: 0.07, blue: 0.07, opacity: 1))
                .overlay(RoundedRectangle(cornerRadius: 4).strokeBorder(Color(red: 0.82, green: 0.04, blue: 0.04, opacity: 1), style: StrokeStyle(lineWidth: 1, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
                .clipShape(RoundedRectangle(cornerRadius: 4))
        }
        stylist.addStyle(identifier: "@dark/tag-secondary[transactions]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Medium", size: 11))
                .foregroundColor(Color(red: 0.82, green: 0.04, blue: 0.04, opacity: 1))
                .lineSpacing(-1)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "@dark/tag-secondary[update]/background") {
            $0
                .background(Color(red: 0.16, green: 0.37, blue: 0.89, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 4))
        }
        stylist.addStyle(identifier: "@dark/tag-secondary[update]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Medium", size: 11))
                .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .lineSpacing(-1)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "@dark/tag-status/background") {
            $0
                .background(Color(red: 0.07, green: 0.07, blue: 0.07, opacity: 0.95))
                .clipShape(RoundedRectangle(cornerRadius: 4))
        }
        stylist.addStyle(identifier: "@dark/tag-status/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Medium", size: 11))
                .foregroundColor(Color(red: 0.69, green: 0.69, blue: 0.69, opacity: 1))
                .lineSpacing(-1)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "@dark/tag-status[expired]/indicator/background") {
            $0
                .background(Color(red: 0.69, green: 0.69, blue: 0.69, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "@dark/tasks/block[icon-selected]/background") {
            $0
                .background(Color(red: 0.18, green: 0.18, blue: 0.18, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        stylist.addStyle(identifier: "@dark/tasks/block[icon]/background") {
            $0
                .background(Color(red: 0.07, green: 0.07, blue: 0.07, opacity: 1))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(Color(red: 0.18, green: 0.18, blue: 0.18, opacity: 1), style: StrokeStyle(lineWidth: 1, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        stylist.addStyle(identifier: "@dark/tile/info/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("AvenirNext-Regular", size: 14))
                .foregroundColor(Color(red: 0.65, green: 0.65, blue: 0.65, opacity: 1))
                .lineSpacing(3)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/tile/subtitle") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("AvenirNext-Regular", size: 14))
                .foregroundColor(Color(red: 0.65, green: 0.65, blue: 0.65, opacity: 1))
                .lineSpacing(3)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/tile/tag-primary-icon/background") {
            $0
                .background(Color(red: 0, green: 0, blue: 0, opacity: 0.9))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "@dark/tile/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("AvenirNext-Medium", size: 15))
                .foregroundColor(Color(red: 0.74, green: 0.74, blue: 0.74, opacity: 1))
                .lineSpacing(3)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/time-picker/underlay") {
            $0
                .background(Color(red: 0.17, green: 0.17, blue: 0.17, opacity: 1))
        }
        stylist.addStyle(identifier: "@dark/timeline-actions/background") {
            $0
                .background(Color(red: 0.23, green: 0.23, blue: 0.23, opacity: 1))
                .clipShape(RoundedCorners(tl: 0, tr: 0, bl: 6, br: 6))
        }
        stylist.addStyle(identifier: "@dark/timeline-actions/button-tertiary/background") {
            $0
                .background(Color(red: 0.07, green: 0.07, blue: 0.07, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "@dark/timeline-actions/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 13))
                .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .lineSpacing(3)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/timeline-date/background") {
            $0
                .background(Color(red: 0.07, green: 0.07, blue: 0.07, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 4))
        }
        stylist.addStyle(identifier: "@dark/timeline-date/subtitle") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("AvenirNext-Regular", size: 10))
                .foregroundColor(Color(red: 0.69, green: 0.69, blue: 0.69, opacity: 1))
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "@dark/timeline-date/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("AvenirNext-Regular", size: 22))
                .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/timeline-heading/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 0))
        }
        stylist.addStyle(identifier: "@dark/timeline-heading/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("AvenirNext-Medium", size: 12))
                .foregroundColor(Color(red: 0.69, green: 0.69, blue: 0.69, opacity: 1))
                .lineSpacing(5)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "@dark/timeline-icon/background") {
            $0
                .background(Color(red: 0.07, green: 0.07, blue: 0.07, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 4))
        }
        stylist.addStyle(identifier: "@dark/timeline-row/background") {
            $0
                .background(Color(red: 0.18, green: 0.18, blue: 0.18, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        stylist.addStyle(identifier: "@dark/timeline-row/info/subtitle") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 13))
                .foregroundColor(Color(red: 0.65, green: 0.65, blue: 0.65, opacity: 1))
                .lineSpacing(3)
                .multilineTextAlignment(.trailing)
                .frame(alignment: .trailing)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/timeline-row/info/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 13))
                .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .lineSpacing(3)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/timeline-row/line") {
            $0
                .overlay(Rectangle().strokeBorder(Color(red: 0.43, green: 0.43, blue: 0.43, opacity: 1), style: StrokeStyle(lineWidth: 1, lineCap: CGLineCap(rawValue: 1), lineJoin: CGLineJoin(rawValue: 1))))
        }
        stylist.addStyle(identifier: "@dark/timeline-row/subtitle") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 13))
                .foregroundColor(Color(red: 0.65, green: 0.65, blue: 0.65, opacity: 1))
                .lineSpacing(1)
                .multilineTextAlignment(.trailing)
                .frame(alignment: .trailing)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/timeline-row/tag-primary/background") {
            $0
                .background(Color(red: 0.69, green: 0.69, blue: 0.69, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 4))
        }
        stylist.addStyle(identifier: "@dark/timeline-row/tag-status/background") {
            $0
                .background(Color(red: 0.07, green: 0.07, blue: 0.07, opacity: 0.95))
                .clipShape(RoundedRectangle(cornerRadius: 4))
        }
        stylist.addStyle(identifier: "@dark/timeline-row/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("AvenirNext-Medium", size: 17))
                .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .lineSpacing(3)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/timeline-row[future]/background") {
            $0
                .background(Color(red: 0.07, green: 0.07, blue: 0.07, opacity: 1))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(Color(red: 0.43, green: 0.43, blue: 0.43, opacity: 1), style: StrokeStyle(lineWidth: 1, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0), dash: [5, 5])))
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        stylist.addStyle(identifier: "@dark/timeline-row[highlighted]/background") {
            $0
                .background(Color(red: 0, green: 0.15, blue: 0.24, opacity: 1))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(Color(red: 0, green: 0.36, blue: 0.72, opacity: 1), style: StrokeStyle(lineWidth: 1, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        stylist.addStyle(identifier: "@dark/timeline-row[highlighted]/timeline-actions/background") {
            $0
                .background(Color(red: 0, green: 0.2, blue: 0.33, opacity: 1))
                .clipShape(RoundedCorners(tl: 0, tr: 0, bl: 6, br: 6))
        }
        stylist.addStyle(identifier: "@dark/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("AvenirNext-Regular", size: 18))
                .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .lineSpacing(-1)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "@dark/toast/background") {
            $0
                .background(Color(red: 0.07, green: 0.07, blue: 0.07, opacity: 1))
                .overlay(RoundedRectangle(cornerRadius: 25).strokeBorder(Color(red: 0.69, green: 0.69, blue: 0.69, opacity: 1), style: StrokeStyle(lineWidth: 1, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
                .clipShape(RoundedRectangle(cornerRadius: 25))
                .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.2), radius: 20, x: 0, y: 10)
        }
        stylist.addStyle(identifier: "@dark/toast/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.15)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 16))
                .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/toast[fail]/background") {
            $0
                .background(Color(red: 0.16, green: 0.07, blue: 0.07, opacity: 1))
                .overlay(RoundedRectangle(cornerRadius: 25).strokeBorder(Color(red: 0.96, green: 0.03, blue: 0.03, opacity: 1), style: StrokeStyle(lineWidth: 1, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
                .clipShape(RoundedRectangle(cornerRadius: 25))
                .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.2), radius: 20, x: 0, y: 10)
        }
        stylist.addStyle(identifier: "@dark/toast[fail]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.15)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 16))
                .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/toast[success]/background") {
            $0
                .background(Color(red: 0.12, green: 0.15, blue: 0.06, opacity: 1))
                .overlay(RoundedRectangle(cornerRadius: 25).strokeBorder(Color(red: 0.55, green: 0.82, blue: 0.02, opacity: 1), style: StrokeStyle(lineWidth: 1, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
                .clipShape(RoundedRectangle(cornerRadius: 25))
                .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.2), radius: 20, x: 0, y: 10)
        }
        stylist.addStyle(identifier: "@dark/toast[success]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.15)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 16))
                .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/toggle/background") {
            $0
                .background(Color(red: 0.57, green: 0.84, blue: 0.02, opacity: 1))
        }
        stylist.addStyle(identifier: "@dark/toggle[off]/background") {
            $0
                .background(Color(red: 0.22, green: 0.22, blue: 0.22, opacity: 1))
        }
        stylist.addStyle(identifier: "@dark/toolbar/background") {
            $0
                .background(Color(red: 0, green: 0, blue: 0, opacity: 1))
        }
        stylist.addStyle(identifier: "@dark/toolbar/button-icon-left/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Medium", size: 17))
                .foregroundColor(Color(red: 0, green: 0.64, blue: 1, opacity: 1))
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/toolbar/button-icon-right/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Medium", size: 17))
                .foregroundColor(Color(red: 0.69, green: 0.69, blue: 0.69, opacity: 1))
                .multilineTextAlignment(.trailing)
                .frame(alignment: .trailing)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/toolbar/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Medium", size: 14))
                .foregroundColor(Color(red: 0.69, green: 0.69, blue: 0.69, opacity: 1))
                .lineSpacing(-3)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "@dark/toolbar[search]/background") {
            $0
                .background(Color(red: 0.22, green: 0.22, blue: 0.22, opacity: 0))
        }
        stylist.addStyle(identifier: "@dark/toolbar[tabs]/background") {
            $0
                .background(Color(red: 0.22, green: 0.22, blue: 0.22, opacity: 1))
        }
        stylist.addStyle(identifier: "@dark/totals/info/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 15))
                .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.trailing)
                .frame(alignment: .trailing)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/totals/info[label-highlighted]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Semibold", size: 15))
                .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.trailing)
                .frame(alignment: .trailing)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/transaction-details/background") {
            $0
                .background(Color(red: 0.07, green: 0.07, blue: 0.07, opacity: 1))
        }
        stylist.addStyle(identifier: "@dark/transaction-details/body") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2133333333333333)
                }
                .font(Font.custom("AvenirNext-Regular", size: 16))
                .foregroundColor(Color(red: 0.69, green: 0.69, blue: 0.69, opacity: 1))
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/transaction-details/button-tertiary/background") {
            $0
                .background(Color(red: 0.07, green: 0.07, blue: 0.07, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "@dark/transaction-details/divider/background") {
            $0
                .background(Color(red: 0.07, green: 0.07, blue: 0.07, opacity: 1))
        }
        stylist.addStyle(identifier: "@dark/transaction-details/subtitle") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("AvenirNext-Regular", size: 12))
                .foregroundColor(Color(red: 0.69, green: 0.69, blue: 0.69, opacity: 1))
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "@dark/transaction-details/tag-status/background") {
            $0
                .background(Color(red: 0.07, green: 0.07, blue: 0.07, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 4))
        }
        stylist.addStyle(identifier: "@dark/transaction-details/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("AvenirNext-Medium", size: 28))
                .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/tray/background") {
            $0
                .background(Color(red: 0, green: 0, blue: 0, opacity: 1))
        }
        stylist.addStyle(identifier: "@dark/tray/divider/background") {
            $0
                .background(Color(red: 0.18, green: 0.18, blue: 0.18, opacity: 1))
        }
        stylist.addStyle(identifier: "@dark/tray/image/background") {
            $0
                .background(Color(red: 0.2, green: 0.2, blue: 0.2, opacity: 1).overlay(Image("d1dfb56cf342436cb051370564838256ff90c98b", bundle: nil).resizable().aspectRatio(contentMode: .fill)))
                .overlay(RoundedRectangle(cornerRadius: 4).strokeBorder(Color(red: 0, green: 0, blue: 0, opacity: 1), style: StrokeStyle(lineWidth: 2, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
                .clipShape(RoundedRectangle(cornerRadius: 4))
        }
        stylist.addStyle(identifier: "@dark/tray/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("AvenirNext-Medium", size: 15))
                .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .lineSpacing(3)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/widget/background") {
            $0
                .background(Color(red: 0.18, green: 0.18, blue: 0.18, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        stylist.addStyle(identifier: "@dark/widget/button-tertiary/background") {
            $0
                .background(Color(red: 0.18, green: 0.18, blue: 0.18, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "@dark/widget/button-tertiary/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Medium", size: 12))
                .foregroundColor(Color(red: 0, green: 0.64, blue: 1, opacity: 1))
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/widget/divider/background") {
            $0
                .background(Color(red: 0.28, green: 0.28, blue: 0.28, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        stylist.addStyle(identifier: "@dark/widget/info/title") {
            $0
                .styleText { text in
                    text
                        .tracking(-0.2)
                }
                .font(Font.custom("AvenirNext-Medium", size: 14))
                .foregroundColor(Color(red: 0.69, green: 0.69, blue: 0.69, opacity: 1))
                .lineSpacing(3)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/widget/list-row/background") {
            $0
                .background(Color(red: 0.18, green: 0.18, blue: 0.18, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        stylist.addStyle(identifier: "@dark/widget/list-row[task-completed]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                        .strikethrough(true)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 14))
                .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .lineSpacing(3)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/widget/list-row[task]/body") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 13))
                .foregroundColor(Color(red: 0.69, green: 0.69, blue: 0.69, opacity: 1))
                .lineSpacing(4)
                .multilineTextAlignment(.trailing)
                .frame(alignment: .trailing)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/widget/list-row[task]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 14))
                .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .lineSpacing(3)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/widget/progress-item[disabled]/background") {
            $0
                .background(Color(red: 0.07, green: 0.07, blue: 0.07, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        stylist.addStyle(identifier: "@dark/widget/subtitle") {
            $0
                .styleText { text in
                    text
                        .tracking(-0.2)
                }
                .font(Font.custom("AvenirNext-Medium", size: 14))
                .foregroundColor(Color(red: 0.65, green: 0.65, blue: 0.65, opacity: 1))
                .lineSpacing(3)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "@dark/widget/title") {
            $0
                .styleText { text in
                    text
                        .tracking(-0.2)
                }
                .font(Font.custom("AvenirNext-Medium", size: 20))
                .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .lineSpacing(-3)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "accordion/body") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 15))
                .foregroundColor(Color(red: 0.39, green: 0.4, blue: 0.46, opacity: 1))
                .lineSpacing(4)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "accordion/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("AvenirNext-Medium", size: 15))
                .foregroundColor(Color(red: 0.13, green: 0.15, blue: 0.23, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "alert/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.2), radius: 20, x: 0, y: 10)
        }
        stylist.addStyle(identifier: "alert/list-row/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        stylist.addStyle(identifier: "alert/list-row/divider/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        stylist.addStyle(identifier: "alert/list-row/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("AvenirNext-Medium", size: 14))
                .foregroundColor(Color(red: 0.39, green: 0.4, blue: 0.46, opacity: 1))
                .lineSpacing(4)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "alert/subtitle") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("AvenirNext-Medium", size: 14))
                .foregroundColor(Color(red: 0.39, green: 0.4, blue: 0.46, opacity: 1))
                .lineSpacing(4)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "alert/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("AvenirNext-Medium", size: 16))
                .foregroundColor(Color(red: 0.12, green: 0.14, blue: 0.23, opacity: 1))
                .lineSpacing(6)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "assets/accordion/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("AvenirNext-Medium", size: 19))
                .foregroundColor(Color(red: 0.04, green: 0.08, blue: 0.2, opacity: 1))
                .lineSpacing(-2)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "assets/block/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(Color(red: 0.91, green: 0.91, blue: 0.92, opacity: 1), style: StrokeStyle(lineWidth: 1, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        stylist.addStyle(identifier: "attributes/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 1))
        }
        stylist.addStyle(identifier: "attributes/tag-status/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 0.95))
                .clipShape(RoundedRectangle(cornerRadius: 4))
        }
        stylist.addStyle(identifier: "attributes/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 17))
                .foregroundColor(Color(red: 0.12, green: 0.14, blue: 0.23, opacity: 1))
                .lineSpacing(5)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 1))
        }
        stylist.addStyle(identifier: "badge/background") {
            $0
                .background(Color(red: 0.24, green: 0.4, blue: 0.81, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "badge/title") {
            $0
                .styleText { text in
                    text
                        .tracking(-0.4999999999999999)
                }
                .font(Font.custom("AvenirNext-Medium", size: 11))
                .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .lineSpacing(-3)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "banners/background") {
            $0
                .background(Color(red: 0.87, green: 0.92, blue: 1, opacity: 1))
        }
        stylist.addStyle(identifier: "banners/divider/background") {
            $0
                .background(Color(red: 0.87, green: 0.92, blue: 1, opacity: 1))
        }
        stylist.addStyle(identifier: "banners/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.1)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 15))
                .foregroundColor(Color(red: 0.13, green: 0.15, blue: 0.23, opacity: 1))
                .lineSpacing(-1)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "banners[alert]/background") {
            $0
                .background(Color(red: 1, green: 0.92, blue: 0.92, opacity: 1))
        }
        stylist.addStyle(identifier: "banners[alert]/divider[full]/background") {
            $0
                .background(Color(red: 1, green: 0.92, blue: 0.92, opacity: 1))
        }
        stylist.addStyle(identifier: "banners[alert]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.1)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 15))
                .foregroundColor(Color(red: 0.73, green: 0.05, blue: 0.05, opacity: 1))
                .lineSpacing(-1)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "block-stats/background") {
            $0
                .background(Color(red: 0.95, green: 0.96, blue: 0.98, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        stylist.addStyle(identifier: "block-stats/body") {
            $0
                .styleText { text in
                    text
                        .tracking(-0.5)
                }
                .font(Font.custom("AvenirNext-Regular", size: 36))
                .foregroundColor(Color(red: 0.12, green: 0.14, blue: 0.23, opacity: 1))
                .lineSpacing(-8)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "block-stats/subtitle") {
            $0
                .font(Font.custom("SFProDisplay-Medium", size: 13))
                .foregroundColor(Color(red: 0.12, green: 0.14, blue: 0.23, opacity: 1))
                .lineSpacing(-1)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "block-stats/title") {
            $0
                .styleText { text in
                    text
                        .tracking(-0.1)
                }
                .font(Font.custom("AvenirNext-Medium", size: 10))
                .foregroundColor(Color(red: 0.39, green: 0.4, blue: 0.46, opacity: 1))
                .lineSpacing(1)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "block-stats[circle-wide]/body") {
            $0
                .styleText { text in
                    text
                        .tracking(-0.5)
                }
                .font(Font.custom("AvenirNext-Regular", size: 34))
                .foregroundColor(Color(red: 0.12, green: 0.14, blue: 0.23, opacity: 1))
                .lineSpacing(-6)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "block-stats[circle-wide]/subtitle") {
            $0
                .font(Font.custom("SFProDisplay-Medium", size: 15))
                .foregroundColor(Color(red: 0.12, green: 0.14, blue: 0.23, opacity: 1))
                .lineSpacing(1)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "block-stats[circle3-wide]/body") {
            $0
                .font(Font.custom("SFProDisplay-Regular", size: 13))
                .foregroundColor(Color(red: 0.12, green: 0.14, blue: 0.23, opacity: 1))
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "block-stats[circle3-wide]/subtitle") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("AvenirNext-Medium", size: 13))
                .foregroundColor(Color(red: 0.12, green: 0.14, blue: 0.23, opacity: 1))
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "block-stock/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 1))
        }
        stylist.addStyle(identifier: "block-stock[selected]/background") {
            $0
                .background(Color(red: 0.95, green: 0.95, blue: 0.95, opacity: 1))
        }
        stylist.addStyle(identifier: "block/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        stylist.addStyle(identifier: "block/body") {
            $0
                .styleText { text in
                    text
                        .tracking(-0.1)
                }
                .font(Font.custom("AvenirNext-DemiBold", size: 14))
                .foregroundColor(Color(red: 0.39, green: 0.4, blue: 0.46, opacity: 1))
                .lineSpacing(8)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "block/subtitle") {
            $0
                .styleText { text in
                    text
                        .tracking(-0.2)
                }
                .font(Font.custom("SFProDisplay-Medium", size: 10))
                .foregroundColor(Color(red: 0.39, green: 0.4, blue: 0.46, opacity: 1))
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "block/title") {
            $0
                .styleText { text in
                    text
                        .tracking(-0.2)
                }
                .font(Font.custom("AvenirNext-DemiBold", size: 20))
                .foregroundColor(Color(red: 0.13, green: 0.15, blue: 0.23, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "block[10]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(-0.2)
                }
                .font(Font.custom("AvenirNext-DemiBold", size: 20))
                .foregroundColor(Color(red: 0.26, green: 0.73, blue: 0, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "block[1]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(-0.2)
                }
                .font(Font.custom("AvenirNext-DemiBold", size: 20))
                .foregroundColor(Color(red: 0.69, green: 0, blue: 0, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "block[2]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(-0.2)
                }
                .font(Font.custom("AvenirNext-DemiBold", size: 20))
                .foregroundColor(Color(red: 0.77, green: 0.22, blue: 0, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "block[3]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(-0.2)
                }
                .font(Font.custom("AvenirNext-DemiBold", size: 20))
                .foregroundColor(Color(red: 0.82, green: 0.35, blue: 0, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "block[4]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(-0.2)
                }
                .font(Font.custom("AvenirNext-DemiBold", size: 20))
                .foregroundColor(Color(red: 0.87, green: 0.5, blue: 0, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "block[5]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(-0.2)
                }
                .font(Font.custom("AvenirNext-DemiBold", size: 20))
                .foregroundColor(Color(red: 0.88, green: 0.57, blue: 0, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "block[6]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(-0.2)
                }
                .font(Font.custom("AvenirNext-DemiBold", size: 20))
                .foregroundColor(Color(red: 0.88, green: 0.63, blue: 0, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "block[7]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(-0.2)
                }
                .font(Font.custom("AvenirNext-DemiBold", size: 20))
                .foregroundColor(Color(red: 0.89, green: 0.69, blue: 0, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "block[8]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(-0.2)
                }
                .font(Font.custom("AvenirNext-DemiBold", size: 20))
                .foregroundColor(Color(red: 0.79, green: 0.73, blue: 0, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "block[9]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(-0.2)
                }
                .font(Font.custom("AvenirNext-DemiBold", size: 20))
                .foregroundColor(Color(red: 0.58, green: 0.73, blue: 0, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "block[available-hide]/subtitle") {
            $0
                .styleText { text in
                    text
                        .tracking(-0.2)
                }
                .font(Font.custom("SFProDisplay-Medium", size: 10))
                .foregroundColor(Color(red: 0.39, green: 0.4, blue: 0.46, opacity: 1))
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "block[available]/subtitle") {
            $0
                .styleText { text in
                    text
                        .tracking(-0.2)
                }
                .font(Font.custom("SFProDisplay-Medium", size: 10))
                .foregroundColor(Color(red: 0.39, green: 0.4, blue: 0.46, opacity: 1))
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "block[available]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.1333333333333333)
                }
                .font(Font.custom("AvenirNext-Medium", size: 20))
                .foregroundColor(Color(red: 0.42, green: 0.6, blue: 0.04, opacity: 1))
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "block[out-of-stock-hide]/subtitle") {
            $0
                .styleText { text in
                    text
                        .tracking(-0.2)
                }
                .font(Font.custom("SFProDisplay-Medium", size: 10))
                .foregroundColor(Color(red: 0.39, green: 0.4, blue: 0.46, opacity: 1))
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "block[out-of-stock]/subtitle") {
            $0
                .styleText { text in
                    text
                        .tracking(-0.2)
                }
                .font(Font.custom("SFProDisplay-Medium", size: 10))
                .foregroundColor(Color(red: 0.39, green: 0.4, blue: 0.46, opacity: 1))
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "block[out-of-stock]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.1333333333333333)
                }
                .font(Font.custom("AvenirNext-Medium", size: 20))
                .foregroundColor(Color(red: 0.73, green: 0.05, blue: 0.05, opacity: 1))
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "body") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 14))
                .foregroundColor(Color(red: 0.65, green: 0.66, blue: 0.7, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "button-action-row/background") {
            $0
                .background(Color(red: 0.95, green: 0.96, blue: 0.98, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        stylist.addStyle(identifier: "button-action-row/subtitle") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 14))
                .foregroundColor(Color(red: 0.39, green: 0.4, blue: 0.46, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "button-action-row/tag-secondary/background") {
            $0
                .background(Color(red: 0.95, green: 0.95, blue: 0.95, opacity: 1))
                .overlay(RoundedRectangle(cornerRadius: 4).strokeBorder(Color(red: 0.67, green: 0.69, blue: 0.75, opacity: 1), style: StrokeStyle(lineWidth: 1, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
                .clipShape(RoundedRectangle(cornerRadius: 4))
        }
        stylist.addStyle(identifier: "button-action-row/tag-secondary/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("AvenirNext-Medium", size: 10))
                .foregroundColor(Color(red: 0.65, green: 0.66, blue: 0.7, opacity: 1))
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "button-action-row/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.1764705882352941)
                }
                .font(Font.custom("AvenirNext-Medium", size: 15))
                .foregroundColor(Color(red: 0.12, green: 0.14, blue: 0.23, opacity: 1))
                .lineSpacing(3)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "button-alert/background") {
            $0
                .background(Color(red: 1, green: 0.92, blue: 0.92, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        stylist.addStyle(identifier: "button-alert/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("AvenirNext-Medium", size: 14))
                .foregroundColor(Color(red: 0.73, green: 0.05, blue: 0.05, opacity: 1))
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "button-badge/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(Color(red: 0.95, green: 0.96, blue: 0.98, opacity: 1), style: StrokeStyle(lineWidth: 1, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        stylist.addStyle(identifier: "button-badge/subtitle") {
            $0
                .styleText { text in
                    text
                        .tracking(-0.2)
                }
                .font(Font.custom("SFProDisplay-Medium", size: 10))
                .foregroundColor(Color(red: 0.39, green: 0.4, blue: 0.46, opacity: 1))
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "button-badge/title") {
            $0
                .styleText { text in
                    text
                        .tracking(-0.2)
                }
                .font(Font.custom("AvenirNext-DemiBold", size: 20))
                .foregroundColor(Color(red: 0.13, green: 0.15, blue: 0.23, opacity: 1))
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "button-badge[selected]/background") {
            $0
                .background(Color(red: 0.95, green: 0.96, blue: 0.98, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        stylist.addStyle(identifier: "button-badge[selected]/subtitle") {
            $0
                .styleText { text in
                    text
                        .tracking(-0.2)
                }
                .font(Font.custom("SFProDisplay-Medium", size: 10))
                .foregroundColor(Color(red: 0.24, green: 0.4, blue: 0.81, opacity: 1))
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "button-badge[selected]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(-0.2)
                }
                .font(Font.custom("AvenirNext-DemiBold", size: 20))
                .foregroundColor(Color(red: 0.24, green: 0.4, blue: 0.81, opacity: 1))
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "button-filters-avatar/background") {
            $0
                .background(Color(red: 0.91, green: 0.91, blue: 0.92, opacity: 1).overlay(Image("5c953cc19e315c165d7ba22a7547d815284a5ccb", bundle: nil).resizable().aspectRatio(contentMode: .fill)))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "button-filters-avatar/badge/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 0))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "button-filters-avatar/badge/title") {
            $0
                .font(Font.custom("AvenirNext-Medium", size: 12))
                .foregroundColor(Color(red: 0.4, green: 0.42, blue: 0.51, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "button-filters-avatar/overlay") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 0))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "button-filters-avatar/subtitle") {
            $0
                .font(Font.custom("AvenirNext-UltraLight", size: 28))
                .foregroundColor(Color(red: 0.12, green: 0.14, blue: 0.23, opacity: 1))
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "button-filters-avatar/title") {
            $0
                .styleText { text in
                    text
                        .tracking(-0.2)
                }
                .font(Font.custom("AvenirNext-Regular", size: 14))
                .foregroundColor(Color(red: 0.12, green: 0.14, blue: 0.23, opacity: 1))
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "button-filters-avatar[disabled]/background") {
            $0
                .background(Color(red: 0.91, green: 0.91, blue: 0.92, opacity: 1).overlay(Image("5c953cc19e315c165d7ba22a7547d815284a5ccb", bundle: nil).resizable().aspectRatio(contentMode: .fill)))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "button-filters-avatar[disabled]/badge/title") {
            $0
                .font(Font.custom("AvenirNext-Medium", size: 12))
                .foregroundColor(Color(red: 0.65, green: 0.66, blue: 0.69, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "button-filters-avatar[disabled]/overlay") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 0.6))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "button-filters-avatar[disabled]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(-0.2)
                }
                .font(Font.custom("AvenirNext-Regular", size: 14))
                .foregroundColor(Color(red: 0.65, green: 0.66, blue: 0.69, opacity: 1))
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "button-filters-avatar[selected]/badge/title") {
            $0
                .font(Font.custom("AvenirNext-Medium", size: 12))
                .foregroundColor(Color(red: 0.24, green: 0.4, blue: 0.81, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "button-filters-avatar[selected]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(-0.2)
                }
                .font(Font.custom("AvenirNext-Medium", size: 14))
                .foregroundColor(Color(red: 0.24, green: 0.4, blue: 0.81, opacity: 1))
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "button-filters-icon/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .overlay(RoundedRectangle(cornerRadius: 25).strokeBorder(Color(red: 0.91, green: 0.91, blue: 0.92, opacity: 1), style: StrokeStyle(lineWidth: 1, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "button-filters-icon[selected]/background") {
            $0
                .background(Color(red: 0.24, green: 0.4, blue: 0.81, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "button-filters-multi/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .overlay(RoundedRectangle(cornerRadius: 25).strokeBorder(Color(red: 0.91, green: 0.91, blue: 0.92, opacity: 1), style: StrokeStyle(lineWidth: 1, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "button-filters-multi/title") {
            $0
                .font(Font.custom("AvenirNext-Medium", size: 12))
                .foregroundColor(Color(red: 0.12, green: 0.14, blue: 0.23, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "button-filters-multi[disabled]/background") {
            $0
                .background(Color(red: 0.91, green: 0.91, blue: 0.92, opacity: 1))
                .overlay(RoundedRectangle(cornerRadius: 25).strokeBorder(Color(red: 0.91, green: 0.91, blue: 0.92, opacity: 1), style: StrokeStyle(lineWidth: 1, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "button-filters-multi[disabled]/title") {
            $0
                .font(Font.custom("AvenirNext-Medium", size: 12))
                .foregroundColor(Color(red: 0.65, green: 0.66, blue: 0.69, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "button-filters-multi[selected]/background") {
            $0
                .background(Color(red: 0.24, green: 0.4, blue: 0.81, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "button-filters-multi[selected]/title") {
            $0
                .font(Font.custom("AvenirNext-Medium", size: 12))
                .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "button-filters/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .overlay(RoundedRectangle(cornerRadius: 25).strokeBorder(Color(red: 0.91, green: 0.91, blue: 0.92, opacity: 1), style: StrokeStyle(lineWidth: 1, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "button-filters/badge/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 0))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "button-filters/badge/title") {
            $0
                .font(Font.custom("AvenirNext-Medium", size: 12))
                .foregroundColor(Color(red: 0.4, green: 0.42, blue: 0.51, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "button-filters/info/title") {
            $0
                .font(Font.custom("AvenirNext-Medium", size: 12))
                .foregroundColor(Color(red: 0.12, green: 0.14, blue: 0.23, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "button-filters/title") {
            $0
                .font(Font.custom("AvenirNext-Medium", size: 12))
                .foregroundColor(Color(red: 0.12, green: 0.14, blue: 0.23, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "button-filters[disabled]/background") {
            $0
                .background(Color(red: 0.91, green: 0.91, blue: 0.92, opacity: 1))
                .overlay(RoundedRectangle(cornerRadius: 25).strokeBorder(Color(red: 0.91, green: 0.91, blue: 0.92, opacity: 1), style: StrokeStyle(lineWidth: 1, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "button-filters[disabled]/badge/title") {
            $0
                .font(Font.custom("AvenirNext-Medium", size: 12))
                .foregroundColor(Color(red: 0.65, green: 0.66, blue: 0.69, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "button-filters[disabled]/info/title") {
            $0
                .font(Font.custom("AvenirNext-Medium", size: 12))
                .foregroundColor(Color(red: 0.65, green: 0.66, blue: 0.69, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "button-filters[disabled]/title") {
            $0
                .font(Font.custom("AvenirNext-Medium", size: 12))
                .foregroundColor(Color(red: 0.65, green: 0.66, blue: 0.69, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "button-filters[selected]/background") {
            $0
                .background(Color(red: 0.24, green: 0.4, blue: 0.81, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "button-filters[selected]/badge/title") {
            $0
                .font(Font.custom("AvenirNext-Medium", size: 12))
                .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "button-filters[selected]/info/title") {
            $0
                .font(Font.custom("AvenirNext-Medium", size: 12))
                .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "button-filters[selected]/title") {
            $0
                .font(Font.custom("AvenirNext-Medium", size: 12))
                .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "button-icon-center/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 0))
        }
        stylist.addStyle(identifier: "button-icon-center/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Medium", size: 12))
                .foregroundColor(Color(red: 0.24, green: 0.4, blue: 0.81, opacity: 1))
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "button-icon-center[disabled]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Medium", size: 12))
                .foregroundColor(Color(red: 0.65, green: 0.66, blue: 0.7, opacity: 1))
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "button-icon-left/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 0))
        }
        stylist.addStyle(identifier: "button-icon-left/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Medium", size: 17))
                .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "button-icon-right/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 0))
        }
        stylist.addStyle(identifier: "button-icon-right/badge/background") {
            $0
                .background(Color(red: 0.73, green: 0.05, blue: 0.05, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "button-icon-right/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Medium", size: 17))
                .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .multilineTextAlignment(.trailing)
                .frame(alignment: .trailing)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "button-icon-right[disabled]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Medium", size: 17))
                .foregroundColor(Color(red: 0.39, green: 0.4, blue: 0.46, opacity: 1))
                .multilineTextAlignment(.trailing)
                .frame(alignment: .trailing)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "button-primary/background") {
            $0
                .background(Color(red: 0.24, green: 0.4, blue: 0.81, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        stylist.addStyle(identifier: "button-primary/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("AvenirNext-Medium", size: 14))
                .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "button-primary[disabled]/background") {
            $0
                .background(Color(red: 0.97, green: 0.98, blue: 1, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        stylist.addStyle(identifier: "button-primary[disabled]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("AvenirNext-Medium", size: 14))
                .foregroundColor(Color(red: 0.78, green: 0.83, blue: 0.91, opacity: 1))
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "button-primary[highlighted]/background") {
            $0
                .background(Color(red: 0.14, green: 0.21, blue: 0.63, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        stylist.addStyle(identifier: "button-secondary/background") {
            $0
                .background(Color(red: 0.97, green: 0.98, blue: 1, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        stylist.addStyle(identifier: "button-secondary/title") {
            $0
                .font(Font.custom("AvenirNext-Medium", size: 14))
                .foregroundColor(Color(red: 0.24, green: 0.4, blue: 0.81, opacity: 1))
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "button-secondary[disabled]/background") {
            $0
                .background(Color(red: 0.97, green: 0.98, blue: 1, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        stylist.addStyle(identifier: "button-secondary[disabled]/title") {
            $0
                .font(Font.custom("AvenirNext-Medium", size: 14))
                .foregroundColor(Color(red: 0.78, green: 0.83, blue: 0.91, opacity: 1))
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "button-secondary[highlighted]/background") {
            $0
                .background(Color(red: 0.24, green: 0.4, blue: 0.81, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        stylist.addStyle(identifier: "button-secondary[highlighted]/title") {
            $0
                .font(Font.custom("AvenirNext-Medium", size: 14))
                .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "button-swipe/background") {
            $0
                .background(Color(red: 0.24, green: 0.4, blue: 0.81, opacity: 1))
        }
        stylist.addStyle(identifier: "button-swipe[alert]/background") {
            $0
                .background(Color(red: 0.97, green: 0, blue: 0, opacity: 1))
        }
        stylist.addStyle(identifier: "button-tabbar/badge/background") {
            $0
                .background(Color(red: 0.73, green: 0.05, blue: 0.05, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "button-tabbar/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 13))
                .foregroundColor(Color(red: 0.24, green: 0.4, blue: 0.81, opacity: 1))
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "button-tabbar[disabled]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 13))
                .foregroundColor(Color(red: 0.65, green: 0.64, blue: 0.61, opacity: 1))
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "button-tabs/background") {
            $0
                .background(Color(red: 0.96, green: 0.95, blue: 0.95, opacity: 1))
        }
        stylist.addStyle(identifier: "button-tabs/divider/background") {
            $0
                .background(Color(red: 0.91, green: 0.91, blue: 0.92, opacity: 1))
        }
        stylist.addStyle(identifier: "button-tabs/subtitle") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Medium", size: 10))
                .foregroundColor(Color(red: 0.39, green: 0.4, blue: 0.46, opacity: 1))
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "button-tabs/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.1333333333333333)
                }
                .font(Font.custom("AvenirNext-Medium", size: 20))
                .foregroundColor(Color(red: 0.12, green: 0.14, blue: 0.23, opacity: 1))
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "button-tabs[selected]/background") {
            $0
                .background(Color(red: 0.96, green: 0.95, blue: 0.95, opacity: 1))
        }
        stylist.addStyle(identifier: "button-tabs[selected]/divider/background") {
            $0
                .background(Color(red: 0.24, green: 0.4, blue: 0.81, opacity: 1))
        }
        stylist.addStyle(identifier: "button-tabs[selected]/subtitle") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Medium", size: 10))
                .foregroundColor(Color(red: 0.24, green: 0.4, blue: 0.81, opacity: 1))
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "button-tabs[selected]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.1333333333333333)
                }
                .font(Font.custom("AvenirNext-Medium", size: 20))
                .foregroundColor(Color(red: 0.24, green: 0.4, blue: 0.81, opacity: 1))
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "button-tabswitch/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 6))
        }
        stylist.addStyle(identifier: "button-tabswitch/badge/background") {
            $0
                .background(Color(red: 0.73, green: 0.05, blue: 0.05, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "button-tabswitch/title") {
            $0
                .font(Font.custom("AvenirNext-Medium", size: 12))
                .foregroundColor(Color(red: 0.04, green: 0.08, blue: 0.2, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "button-tabswitch[selected]/background") {
            $0
                .background(Color(red: 0.24, green: 0.4, blue: 0.81, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 6))
        }
        stylist.addStyle(identifier: "button-tabswitch[selected]/badge/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "button-tabswitch[selected]/badge/title") {
            $0
                .styleText { text in
                    text
                        .tracking(-0.4545454545454545)
                }
                .font(Font.custom("AvenirNext-Medium", size: 10))
                .foregroundColor(Color(red: 0.04, green: 0.08, blue: 0.2, opacity: 1))
                .lineSpacing(-2)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "button-tabswitch[selected]/title") {
            $0
                .font(Font.custom("AvenirNext-Medium", size: 12))
                .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "button-tertiary-center/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .overlay(RoundedRectangle(cornerRadius: 25).strokeBorder(Color(red: 0.91, green: 0.91, blue: 0.92, opacity: 1), style: StrokeStyle(lineWidth: 1, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "button-tertiary-center/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Medium", size: 12))
                .foregroundColor(Color(red: 0.24, green: 0.4, blue: 0.81, opacity: 1))
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "button-tertiary/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .overlay(RoundedRectangle(cornerRadius: 25).strokeBorder(Color(red: 0.91, green: 0.91, blue: 0.92, opacity: 1), style: StrokeStyle(lineWidth: 1, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "button-tertiary/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Medium", size: 12))
                .foregroundColor(Color(red: 0.24, green: 0.4, blue: 0.81, opacity: 1))
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "button-tertiary[disabled]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Medium", size: 12))
                .foregroundColor(Color(red: 0.78, green: 0.83, blue: 0.91, opacity: 1))
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "button-tertiary[error]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Medium", size: 12))
                .foregroundColor(Color(red: 0.73, green: 0.05, blue: 0.05, opacity: 1))
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "button-tertiary[focused]/background") {
            $0
                .background(Color(red: 0.98, green: 1, blue: 0.95, opacity: 1))
                .overlay(RoundedRectangle(cornerRadius: 25).strokeBorder(Color(red: 0.63, green: 0.71, blue: 0.48, opacity: 1), style: StrokeStyle(lineWidth: 1, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "button-tertiary[focused]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Medium", size: 12))
                .foregroundColor(Color(red: 0.42, green: 0.6, blue: 0.04, opacity: 1))
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "button-tertiary[selected]/background") {
            $0
                .background(Color(red: 0.24, green: 0.4, blue: 0.81, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "button-tertiary[selected]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Medium", size: 12))
                .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "button-toolbar/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 1))
        }
        stylist.addStyle(identifier: "button-toolbar/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("AvenirNext-Medium", size: 14))
                .foregroundColor(Color(red: 0.24, green: 0.4, blue: 0.81, opacity: 1))
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "calendar-day/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "calendar-day/indicator/background") {
            $0
                .background(Color(red: 0.73, green: 0.74, blue: 0.78, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "calendar-day/title") {
            $0
                .font(Font.custom("SFProDisplay-Medium", size: 16))
                .foregroundColor(Color(red: 0.04, green: 0.08, blue: 0.2, opacity: 1))
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "calendar-day[disabled]/title") {
            $0
                .font(Font.custom("SFProDisplay-Medium", size: 16))
                .foregroundColor(Color(red: 0.82, green: 0.84, blue: 0.87, opacity: 1))
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "calendar-day[highlighted]/background") {
            $0
                .background(Color(red: 0.97, green: 0.98, blue: 1, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "calendar-day[highlighted]/indicator/background") {
            $0
                .background(Color(red: 0.24, green: 0.4, blue: 0.81, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "calendar-day[highlighted]/title") {
            $0
                .font(Font.custom("SFProDisplay-Medium", size: 16))
                .foregroundColor(Color(red: 0.24, green: 0.4, blue: 0.81, opacity: 1))
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "calendar-day[selected]/background") {
            $0
                .background(Color(red: 0.24, green: 0.4, blue: 0.81, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "calendar-day[selected]/indicator/background") {
            $0
                .background(Color(red: 0.24, green: 0.4, blue: 0.81, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "calendar-day[selected]/title") {
            $0
                .font(Font.custom("SFProDisplay-Medium", size: 16))
                .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "calendar/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 1))
        }
        stylist.addStyle(identifier: "calendar/button-tertiary/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 0))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "calendar/button-tertiary[highlighted]/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 0))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "calendar/subtitle") {
            $0
                .styleText { text in
                    text
                        .tracking(0.1)
                }
                .font(Font.custom("SFProDisplay-Medium", size: 13))
                .foregroundColor(Color(red: 0.56, green: 0.57, blue: 0.64, opacity: 1))
                .lineSpacing(4)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "calendar/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("AvenirNext-Medium", size: 15))
                .foregroundColor(Color(red: 0.24, green: 0.4, blue: 0.81, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "camera-view/background") {
            $0
                .background(Color(red: 0.95, green: 0.96, blue: 0.98, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        stylist.addStyle(identifier: "camera-view/button-icon-left/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Medium", size: 17))
                .foregroundColor(Color(red: 0.24, green: 0.4, blue: 0.81, opacity: 1))
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "carousel/heading/divider/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 1))
        }
        stylist.addStyle(identifier: "client-row/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("AvenirNext-Medium", size: 17))
                .foregroundColor(Color(red: 0.12, green: 0.14, blue: 0.23, opacity: 1))
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "client-row[highlighted]/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.2), radius: 20, x: 0, y: 10)
        }
        stylist.addStyle(identifier: "clients/button-tertiary-center/background") {
            $0
                .background(Color(red: 0.98, green: 0.94, blue: 0.8, opacity: 1))
                .overlay(RoundedRectangle(cornerRadius: 25).strokeBorder(Color(red: 0.92, green: 0.84, blue: 0.55, opacity: 1), style: StrokeStyle(lineWidth: 1, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "clients/button-tertiary-center/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Medium", size: 12))
                .foregroundColor(Color(red: 0.75, green: 0.62, blue: 0.15, opacity: 1))
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "clients/create/accordion/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 0))
        }
        stylist.addStyle(identifier: "clients/create/heading/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 0))
        }
        stylist.addStyle(identifier: "clients/create/heading/divider/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 0))
        }
        stylist.addStyle(identifier: "clients/create/line") {
            $0
                .overlay(Rectangle().strokeBorder(Color(red: 0.13, green: 0.15, blue: 0.23, opacity: 1), style: StrokeStyle(lineWidth: 3, lineCap: CGLineCap(rawValue: 2), lineJoin: CGLineJoin(rawValue: 0))))
        }
        stylist.addStyle(identifier: "clients/create/message-view/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 0))
        }
        stylist.addStyle(identifier: "clients/create/modal/background") {
            $0
                .background(Color(red: 0.96, green: 0.95, blue: 0.95, opacity: 1))
        }
        stylist.addStyle(identifier: "clients/create/note-instructions/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        stylist.addStyle(identifier: "clients/create/note/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 0))
        }
        stylist.addStyle(identifier: "clients/profile/block/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(Color(red: 0.91, green: 0.91, blue: 0.92, opacity: 1), style: StrokeStyle(lineWidth: 1, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        stylist.addStyle(identifier: "color-item/background") {
            $0
                .background(Color(red: 0.91, green: 0.93, blue: 0.95, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "color/info/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 14))
                .foregroundColor(Color(red: 0.65, green: 0.66, blue: 0.7, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "curations/accordion/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("AvenirNext-Medium", size: 19))
                .foregroundColor(Color(red: 0.04, green: 0.08, blue: 0.2, opacity: 1))
                .lineSpacing(-2)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "curations/block/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(Color(red: 0.91, green: 0.91, blue: 0.92, opacity: 1), style: StrokeStyle(lineWidth: 1, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        stylist.addStyle(identifier: "dashboard/button-filters[selected]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("AvenirNext-Regular", size: 13))
                .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "dashboard/subheading/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("AvenirNext-Regular", size: 15))
                .foregroundColor(Color(red: 0.32, green: 0.34, blue: 0.44, opacity: 1))
                .lineSpacing(4)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "date-picker/underlay") {
            $0
                .background(Color(red: 0.96, green: 0.96, blue: 0.96, opacity: 1))
        }
        stylist.addStyle(identifier: "divider/background") {
            $0
                .background(Color(red: 0.91, green: 0.91, blue: 0.92, opacity: 1))
        }
        stylist.addStyle(identifier: "divider/overlay") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 1))
        }
        stylist.addStyle(identifier: "divider/title") {
            $0
                .styleText { text in
                    text
                        .tracking(1.2)
                }
                .font(Font.custom("SFProDisplay-Medium", size: 11))
                .foregroundColor(Color(red: 0.32, green: 0.34, blue: 0.44, opacity: 1))
                .lineSpacing(-3)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "email-content/body") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("AvenirNext-Medium", size: 14))
                .foregroundColor(Color(red: 0.47, green: 0.48, blue: 0.52, opacity: 1))
                .lineSpacing(3)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "email-content/subtitle") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("AvenirNext-Medium", size: 14))
                .foregroundColor(Color(red: 0.13, green: 0.15, blue: 0.24, opacity: 1))
                .lineSpacing(3)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "email-content/tag-primary/background") {
            $0
                .background(Color(red: 0.91, green: 0.93, blue: 0.95, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 4))
        }
        stylist.addStyle(identifier: "email-content/tag-primary/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("AvenirNext-Medium", size: 12))
                .foregroundColor(Color(red: 0.42, green: 0.44, blue: 0.54, opacity: 1))
                .lineSpacing(-2)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "email-content/tag-primary[highlighted]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("AvenirNext-Medium", size: 12))
                .foregroundColor(Color(red: 0.83, green: 0.04, blue: 0.04, opacity: 1))
                .lineSpacing(-2)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "email-content/tag-secondary/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 0))
                .clipShape(RoundedRectangle(cornerRadius: 4))
        }
        stylist.addStyle(identifier: "email-content/tag-secondary/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                        .strikethrough(true)
                }
                .font(Font.custom("AvenirNext-Medium", size: 12))
                .foregroundColor(Color(red: 0.42, green: 0.44, blue: 0.54, opacity: 1))
                .lineSpacing(-2)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "email-content/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.1882352941176471)
                }
                .font(Font.custom("AvenirNext-Medium", size: 16))
                .foregroundColor(Color(red: 0.13, green: 0.15, blue: 0.24, opacity: 1))
                .lineSpacing(1)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "email-hero/body") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("AvenirNext-Medium", size: 14))
                .foregroundColor(Color(red: 0.47, green: 0.48, blue: 0.52, opacity: 1))
                .lineSpacing(3)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "email-hero/subtitle") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("AvenirNext-Medium", size: 14))
                .foregroundColor(Color(red: 0.13, green: 0.15, blue: 0.24, opacity: 1))
                .lineSpacing(3)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "email-hero/tag-primary/background") {
            $0
                .background(Color(red: 0.91, green: 0.93, blue: 0.95, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 4))
        }
        stylist.addStyle(identifier: "email-hero/tag-primary/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("AvenirNext-Medium", size: 12))
                .foregroundColor(Color(red: 0.42, green: 0.44, blue: 0.54, opacity: 1))
                .lineSpacing(-2)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "email-hero/tag-primary[highlighted]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("AvenirNext-Medium", size: 12))
                .foregroundColor(Color(red: 0.83, green: 0.04, blue: 0.04, opacity: 1))
                .lineSpacing(-2)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "email-hero/tag-secondary/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 0))
                .clipShape(RoundedRectangle(cornerRadius: 4))
        }
        stylist.addStyle(identifier: "email-hero/tag-secondary/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                        .strikethrough(true)
                }
                .font(Font.custom("AvenirNext-Medium", size: 12))
                .foregroundColor(Color(red: 0.42, green: 0.44, blue: 0.54, opacity: 1))
                .lineSpacing(-2)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "email-hero/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("AvenirNext-Medium", size: 17))
                .foregroundColor(Color(red: 0.13, green: 0.15, blue: 0.24, opacity: 1))
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "email/body") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("AvenirNext-Medium", size: 12))
                .foregroundColor(Color(red: 0.47, green: 0.48, blue: 0.52, opacity: 1))
                .lineSpacing(5)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "email/subtitle") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("AvenirNext-Medium", size: 14))
                .foregroundColor(Color(red: 0.39, green: 0.4, blue: 0.46, opacity: 1))
                .lineSpacing(3)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "email/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("AvenirNext-DemiBold", size: 18))
                .foregroundColor(Color(red: 0.12, green: 0.14, blue: 0.23, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "expandable/body") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 16))
                .foregroundColor(Color(red: 0.65, green: 0.66, blue: 0.7, opacity: 1))
                .lineSpacing(3)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "expandable/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 16))
                .foregroundColor(Color(red: 0.24, green: 0.4, blue: 0.81, opacity: 1))
                .lineSpacing(3)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "fab/background") {
            $0
                .background(LinearGradient(gradient: Gradient(stops:[.init(color: Color(red: 1, green: 1, blue: 1, opacity: 0), location: 0),.init(color: Color(red: 1, green: 1, blue: 1, opacity: 1), location: 1)]), startPoint: UnitPoint(x: 0.5, y: 0), endPoint: UnitPoint(x: 0.5, y: 0.55)))
        }
        stylist.addStyle(identifier: "fab/divider/background") {
            $0
                .background(Color(red: 0.95, green: 0.95, blue: 0.95, opacity: 0))
        }
        stylist.addStyle(identifier: "fab/info/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 14))
                .foregroundColor(Color(red: 0.65, green: 0.66, blue: 0.7, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "filters/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 1))
        }
        stylist.addStyle(identifier: "filters/button-filters[selected]/title") {
            $0
                .font(Font.custom("AvenirNext-Medium", size: 12))
                .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "fold/overlay") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 0.75))
        }
        stylist.addStyle(identifier: "form-field-message/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 12))
                .foregroundColor(Color(red: 0.65, green: 0.66, blue: 0.69, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "form-field-title/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("AvenirNext-Regular", size: 14))
                .foregroundColor(Color(red: 0.39, green: 0.4, blue: 0.46, opacity: 1))
                .lineSpacing(3)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "form-field/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 0))
        }
        stylist.addStyle(identifier: "form-field/badge/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 0))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "form-field/badge/title") {
            $0
                .styleText { text in
                    text
                        .tracking(-0.2)
                }
                .font(Font.custom("AvenirNext-Medium", size: 12))
                .foregroundColor(Color(red: 0.4, green: 0.42, blue: 0.51, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "form-field/button-tertiary/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 0))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "form-field/button-tertiary/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Medium", size: 12))
                .foregroundColor(Color(red: 0.24, green: 0.4, blue: 0.81, opacity: 1))
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "form-field/subtitle") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 15))
                .foregroundColor(Color(red: 0.65, green: 0.66, blue: 0.7, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "form-field/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 17))
                .foregroundColor(Color(red: 0.12, green: 0.14, blue: 0.23, opacity: 1))
                .lineSpacing(3)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "form-field[disabled]/badge/title") {
            $0
                .font(Font.custom("AvenirNext-Medium", size: 12))
                .foregroundColor(Color(red: 0.82, green: 0.84, blue: 0.87, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "form-field[disabled]/button-tertiary/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Medium", size: 12))
                .foregroundColor(Color(red: 0.78, green: 0.83, blue: 0.91, opacity: 1))
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "form-field[disabled]/form-field-message/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 12))
                .foregroundColor(Color(red: 0.82, green: 0.84, blue: 0.87, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "form-field[disabled]/form-field-title/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("AvenirNext-Regular", size: 14))
                .foregroundColor(Color(red: 0.82, green: 0.84, blue: 0.87, opacity: 1))
                .lineSpacing(3)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "form-field[disabled]/form-type-button/background") {
            $0
                .background(Color(red: 0.91, green: 0.91, blue: 0.92, opacity: 1))
                .overlay(RoundedRectangle(cornerRadius: 25).strokeBorder(Color(red: 0.91, green: 0.91, blue: 0.92, opacity: 1), style: StrokeStyle(lineWidth: 1, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "form-field[disabled]/form-type-button/info/title") {
            $0
                .font(Font.custom("AvenirNext-Medium", size: 12))
                .foregroundColor(Color(red: 0.65, green: 0.66, blue: 0.69, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "form-field[disabled]/form-type-button/title") {
            $0
                .font(Font.custom("AvenirNext-Medium", size: 12))
                .foregroundColor(Color(red: 0.65, green: 0.66, blue: 0.69, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "form-field[disabled]/form-type-signature/body") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 14))
                .foregroundColor(Color(red: 0.82, green: 0.84, blue: 0.87, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "form-field[disabled]/form-type-signature/line") {
            $0
                .overlay(Rectangle().strokeBorder(Color(red: 0.78, green: 0.83, blue: 0.91, opacity: 1), style: StrokeStyle(lineWidth: 1, lineCap: CGLineCap(rawValue: 2), lineJoin: CGLineJoin(rawValue: 0))))
        }
        stylist.addStyle(identifier: "form-field[disabled]/form-type-signature/subtitle") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("AvenirNext-Medium", size: 14))
                .foregroundColor(Color(red: 0.82, green: 0.84, blue: 0.87, opacity: 1))
                .lineSpacing(3)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "form-field[disabled]/subtitle") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 15))
                .foregroundColor(Color(red: 0.82, green: 0.84, blue: 0.87, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "form-field[disabled]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 17))
                .foregroundColor(Color(red: 0.82, green: 0.84, blue: 0.87, opacity: 1))
                .lineSpacing(3)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "form-field[error]/background") {
            $0
                .background(Color(red: 1, green: 0.98, blue: 0.98, opacity: 1))
        }
        stylist.addStyle(identifier: "form-field[error]/divider/background") {
            $0
                .background(Color(red: 0.73, green: 0.05, blue: 0.05, opacity: 1))
        }
        stylist.addStyle(identifier: "form-field[error]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 17))
                .foregroundColor(Color(red: 0.73, green: 0.05, blue: 0.05, opacity: 1))
                .lineSpacing(3)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "form-field[placeholder]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 17))
                .foregroundColor(Color(red: 0.65, green: 0.66, blue: 0.69, opacity: 1))
                .lineSpacing(3)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "form-field[warning]/background") {
            $0
                .background(Color(red: 1, green: 0.99, blue: 0.97, opacity: 1))
        }
        stylist.addStyle(identifier: "form-field[warning]/divider/background") {
            $0
                .background(Color(red: 0.88, green: 0.57, blue: 0, opacity: 1))
        }
        stylist.addStyle(identifier: "form-field[warning]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 17))
                .foregroundColor(Color(red: 0.88, green: 0.57, blue: 0, opacity: 1))
                .lineSpacing(3)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "form-group/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        stylist.addStyle(identifier: "form-type-button/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .overlay(RoundedRectangle(cornerRadius: 25).strokeBorder(Color(red: 0.91, green: 0.91, blue: 0.92, opacity: 1), style: StrokeStyle(lineWidth: 1.5, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "form-type-button/info/title") {
            $0
                .styleText { text in
                    text
                        .tracking(-0.2)
                }
                .font(Font.custom("AvenirNext-Medium", size: 14))
                .foregroundColor(Color(red: 0.24, green: 0.4, blue: 0.81, opacity: 1))
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "form-type-button/title") {
            $0
                .styleText { text in
                    text
                        .tracking(-0.2)
                }
                .font(Font.custom("AvenirNext-Medium", size: 14))
                .foregroundColor(Color(red: 0.24, green: 0.4, blue: 0.81, opacity: 1))
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "form-type-button[disabled]/background") {
            $0
                .background(Color(red: 0.91, green: 0.91, blue: 0.92, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "form-type-button[disabled]/badge/title") {
            $0
                .styleText { text in
                    text
                        .tracking(-0.2)
                }
                .font(Font.custom("AvenirNext-Medium", size: 12))
                .foregroundColor(Color(red: 0.65, green: 0.66, blue: 0.69, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "form-type-button[disabled]/info/title") {
            $0
                .styleText { text in
                    text
                        .tracking(-0.2)
                }
                .font(Font.custom("AvenirNext-Medium", size: 14))
                .foregroundColor(Color(red: 0.65, green: 0.66, blue: 0.69, opacity: 1))
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "form-type-button[selected]/background") {
            $0
                .background(Color(red: 0.24, green: 0.4, blue: 0.81, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "form-type-button[selected]/badge/title") {
            $0
                .styleText { text in
                    text
                        .tracking(-0.2)
                }
                .font(Font.custom("AvenirNext-Medium", size: 12))
                .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "form-type-button[selected]/info/title") {
            $0
                .styleText { text in
                    text
                        .tracking(-0.2)
                }
                .font(Font.custom("AvenirNext-Medium", size: 14))
                .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "form-type-button[selected]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(-0.2)
                }
                .font(Font.custom("AvenirNext-Medium", size: 14))
                .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "form-type-calendar-week/button-tertiary/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 0))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "form-type-calendar-week/button-tertiary[highlighted]/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 0))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "form-type-calendar-week/subtitle") {
            $0
                .styleText { text in
                    text
                        .tracking(0.1)
                }
                .font(Font.custom("SFProDisplay-Medium", size: 13))
                .foregroundColor(Color(red: 0.56, green: 0.57, blue: 0.64, opacity: 1))
                .lineSpacing(4)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "form-type-calendar-week/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("AvenirNext-Medium", size: 15))
                .foregroundColor(Color(red: 0.24, green: 0.4, blue: 0.81, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "form-type-calendar/button-tertiary/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 0))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "form-type-calendar/button-tertiary[highlighted]/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 0))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "form-type-calendar/subtitle") {
            $0
                .styleText { text in
                    text
                        .tracking(0.1)
                }
                .font(Font.custom("SFProDisplay-Medium", size: 13))
                .foregroundColor(Color(red: 0.56, green: 0.57, blue: 0.64, opacity: 1))
                .lineSpacing(4)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "form-type-calendar/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("AvenirNext-Medium", size: 15))
                .foregroundColor(Color(red: 0.24, green: 0.4, blue: 0.81, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "form-type-client[disabled]/info/subtitle") {
            $0
                .styleText { text in
                    text
                        .tracking(-0.2)
                }
                .font(Font.custom("AvenirNext-Medium", size: 14))
                .foregroundColor(Color(red: 0.65, green: 0.66, blue: 0.69, opacity: 1))
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "form-type-client[disabled]/info/title") {
            $0
                .styleText { text in
                    text
                        .tracking(-0.2)
                }
                .font(Font.custom("AvenirNext-Medium", size: 14))
                .foregroundColor(Color(red: 0.65, green: 0.66, blue: 0.69, opacity: 1))
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "form-type-client[disabled]/subtitle") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 15))
                .foregroundColor(Color(red: 0.82, green: 0.84, blue: 0.87, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "form-type-client[disabled]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 17))
                .foregroundColor(Color(red: 0.82, green: 0.84, blue: 0.87, opacity: 1))
                .lineSpacing(3)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "form-type-image-sm/background") {
            $0
                .background(Color(red: 0.91, green: 0.93, blue: 0.95, opacity: 1).overlay(Image("5c953cc19e315c165d7ba22a7547d815284a5ccb", bundle: nil).resizable().aspectRatio(contentMode: .fill)))
                .clipShape(RoundedRectangle(cornerRadius: 15))
        }
        stylist.addStyle(identifier: "form-type-image-sm/indicator/background") {
            $0
                .background(Color(red: 0.3, green: 0.82, blue: 0, opacity: 1))
                .overlay(RoundedRectangle(cornerRadius: 25).strokeBorder(Color(red: 1, green: 1, blue: 1, opacity: 1), style: StrokeStyle(lineWidth: 2, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "form-type-image-sm/indicator[expired]/background") {
            $0
                .background(Color(red: 0.22, green: 0.22, blue: 0.22, opacity: 1))
                .overlay(RoundedRectangle(cornerRadius: 25).strokeBorder(Color(red: 1, green: 1, blue: 1, opacity: 1), style: StrokeStyle(lineWidth: 2, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "form-type-image-sm/indicator[low-stock]/background") {
            $0
                .background(Color(red: 0.87, green: 0.5, blue: 0, opacity: 1))
                .overlay(RoundedRectangle(cornerRadius: 25).strokeBorder(Color(red: 1, green: 1, blue: 1, opacity: 1), style: StrokeStyle(lineWidth: 2, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "form-type-image-sm/indicator[no-stock]/background") {
            $0
                .background(Color(red: 0.7, green: 0.7, blue: 0.7, opacity: 1))
                .overlay(RoundedRectangle(cornerRadius: 25).strokeBorder(Color(red: 1, green: 1, blue: 1, opacity: 1), style: StrokeStyle(lineWidth: 2, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "form-type-image-sm/indicator[on-demand]/background") {
            $0
                .background(Color(red: 0.99, green: 0.77, blue: 0.12, opacity: 1))
                .overlay(RoundedRectangle(cornerRadius: 25).strokeBorder(Color(red: 1, green: 1, blue: 1, opacity: 1), style: StrokeStyle(lineWidth: 2, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "form-type-image-sm/indicator[out-of-stock]/background") {
            $0
                .background(Color(red: 0.79, green: 0, blue: 0, opacity: 1))
                .overlay(RoundedRectangle(cornerRadius: 25).strokeBorder(Color(red: 1, green: 1, blue: 1, opacity: 1), style: StrokeStyle(lineWidth: 2, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "form-type-image-sm/overlay") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 0))
                .clipShape(RoundedRectangle(cornerRadius: 15))
        }
        stylist.addStyle(identifier: "form-type-image-sm/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 15))
                .foregroundColor(Color(red: 0.13, green: 0.15, blue: 0.23, opacity: 1))
                .lineSpacing(5)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "form-type-image-sm[disabled]/overlay") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 0.6))
                .clipShape(RoundedRectangle(cornerRadius: 15))
        }
        stylist.addStyle(identifier: "form-type-image-sm[disabled]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 15))
                .foregroundColor(Color(red: 0.57, green: 0.57, blue: 0.57, opacity: 1))
                .lineSpacing(5)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "form-type-image-sm[selected]/overlay") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 0))
                .overlay(RoundedRectangle(cornerRadius: 15).strokeBorder(Color(red: 1, green: 1, blue: 1, opacity: 1), style: StrokeStyle(lineWidth: 4, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
                .overlay(RoundedRectangle(cornerRadius: 15).strokeBorder(Color(red: 0.24, green: 0.4, blue: 0.81, opacity: 1), style: StrokeStyle(lineWidth: 2, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
                .clipShape(RoundedRectangle(cornerRadius: 15))
        }
        stylist.addStyle(identifier: "form-type-image/background") {
            $0
                .background(Color(red: 0.91, green: 0.91, blue: 0.92, opacity: 1).overlay(Image("5c953cc19e315c165d7ba22a7547d815284a5ccb", bundle: nil).resizable().aspectRatio(contentMode: .fill)))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "form-type-image/info/title") {
            $0
                .styleText { text in
                    text
                        .tracking(-0.2)
                }
                .font(Font.custom("AvenirNext-Medium", size: 14))
                .foregroundColor(Color(red: 0.12, green: 0.14, blue: 0.23, opacity: 1))
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "form-type-image/overlay") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 0))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "form-type-image/title") {
            $0
                .font(Font.custom("AvenirNext-Regular", size: 28))
                .foregroundColor(Color(red: 0.12, green: 0.14, blue: 0.23, opacity: 1))
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "form-type-image[disabled]/badge/title") {
            $0
                .font(Font.custom("AvenirNext-Medium", size: 12))
                .foregroundColor(Color(red: 0.82, green: 0.84, blue: 0.87, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "form-type-image[disabled]/info/title") {
            $0
                .styleText { text in
                    text
                        .tracking(-0.2)
                }
                .font(Font.custom("AvenirNext-Medium", size: 14))
                .foregroundColor(Color(red: 0.65, green: 0.66, blue: 0.69, opacity: 1))
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "form-type-image[disabled]/overlay") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 0.6))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "form-type-image[selected]/badge/title") {
            $0
                .font(Font.custom("AvenirNext-Medium", size: 12))
                .foregroundColor(Color(red: 0.24, green: 0.4, blue: 0.81, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "form-type-image[selected]/info/title") {
            $0
                .styleText { text in
                    text
                        .tracking(-0.2)
                }
                .font(Font.custom("AvenirNext-Medium", size: 14))
                .foregroundColor(Color(red: 0.24, green: 0.4, blue: 0.81, opacity: 1))
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "form-type-image[selected]/overlay") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 0))
                .overlay(RoundedRectangle(cornerRadius: 25).strokeBorder(Color(red: 1, green: 1, blue: 1, opacity: 1), style: StrokeStyle(lineWidth: 4, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
                .overlay(RoundedRectangle(cornerRadius: 25).strokeBorder(Color(red: 0.24, green: 0.4, blue: 0.81, opacity: 1), style: StrokeStyle(lineWidth: 2, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "form-type-profile-photo/image/background") {
            $0
                .background(Color(red: 0.91, green: 0.93, blue: 0.95, opacity: 1).overlay(Image("5c953cc19e315c165d7ba22a7547d815284a5ccb", bundle: nil).resizable().aspectRatio(contentMode: .fill)))
                .clipShape(RoundedRectangle(cornerRadius: 50))
        }
        stylist.addStyle(identifier: "form-type-profile-photo/title") {
            $0
                .font(Font.custom("AvenirNext-Regular", size: 36))
                .foregroundColor(Color(red: 0.12, green: 0.14, blue: 0.23, opacity: 1))
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "form-type-select-inline[disabled]/badge/title") {
            $0
                .font(Font.custom("AvenirNext-Medium", size: 12))
                .foregroundColor(Color(red: 0.82, green: 0.84, blue: 0.87, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "form-type-select-inline[disabled]/subtitle") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 15))
                .foregroundColor(Color(red: 0.82, green: 0.84, blue: 0.87, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "form-type-select-inline[disabled]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 17))
                .foregroundColor(Color(red: 0.82, green: 0.84, blue: 0.87, opacity: 1))
                .lineSpacing(3)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "form-type-select-stacked[disabled]/badge/title") {
            $0
                .font(Font.custom("AvenirNext-Medium", size: 12))
                .foregroundColor(Color(red: 0.82, green: 0.84, blue: 0.87, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "form-type-select-stacked[disabled]/subtitle") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 15))
                .foregroundColor(Color(red: 0.82, green: 0.84, blue: 0.87, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "form-type-select-stacked[disabled]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 17))
                .foregroundColor(Color(red: 0.82, green: 0.84, blue: 0.87, opacity: 1))
                .lineSpacing(3)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "form-type-select[disabled]/badge/title") {
            $0
                .font(Font.custom("AvenirNext-Medium", size: 12))
                .foregroundColor(Color(red: 0.82, green: 0.84, blue: 0.87, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "form-type-select[disabled]/subtitle") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 15))
                .foregroundColor(Color(red: 0.82, green: 0.84, blue: 0.87, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "form-type-select[disabled]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 17))
                .foregroundColor(Color(red: 0.82, green: 0.84, blue: 0.87, opacity: 1))
                .lineSpacing(3)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "form-type-signature/button-tertiary/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "form-type-signature/line") {
            $0
                .overlay(Rectangle().strokeBorder(Color(red: 0.56, green: 0.57, blue: 0.64, opacity: 1), style: StrokeStyle(lineWidth: 1, lineCap: CGLineCap(rawValue: 2), lineJoin: CGLineJoin(rawValue: 0))))
        }
        stylist.addStyle(identifier: "fullscreen/background") {
            $0
                .background(Image("f05d87b1d1ab0c7cac15909deb2df866c168cca5", bundle: nil).resizable().aspectRatio(contentMode: .fill))
        }
        stylist.addStyle(identifier: "graph-item/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "graph-item[accent]/background") {
            $0
                .background(Color(red: 0.33, green: 0.54, blue: 0.87, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "graph-item[eight]/background") {
            $0
                .background(Color(red: 0.25, green: 0.8, blue: 0.85, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "graph-item[five]/background") {
            $0
                .background(Color(red: 0.88, green: 0.11, blue: 0.12, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "graph-item[four]/background") {
            $0
                .background(Color(red: 0.06, green: 0.63, blue: 0.37, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "graph-item[nine]/background") {
            $0
                .background(Color(red: 0.26, green: 0.38, blue: 0.21, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "graph-item[one]/background") {
            $0
                .background(Color(red: 0.33, green: 0.54, blue: 0.87, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "graph-item[seven]/background") {
            $0
                .background(Color(red: 0.47, green: 0.33, blue: 0.65, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "graph-item[six]/background") {
            $0
                .background(Color(red: 1, green: 0.73, blue: 0.85, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "graph-item[ten]/background") {
            $0
                .background(Color(red: 0.74, green: 0.97, blue: 0.57, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "graph-item[three]/background") {
            $0
                .background(Color(red: 0.96, green: 0.59, blue: 0.15, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "graph-item[two]/background") {
            $0
                .background(Color(red: 0.92, green: 0.76, blue: 0.49, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "graph/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 5))
        }
        stylist.addStyle(identifier: "heading/subtitle") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 14))
                .foregroundColor(Color(red: 0.65, green: 0.66, blue: 0.69, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "heading/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("AvenirNext-Medium", size: 19))
                .foregroundColor(Color(red: 0.04, green: 0.08, blue: 0.2, opacity: 1))
                .lineSpacing(-2)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "heading[error]/divider/background") {
            $0
                .background(Color(red: 0.73, green: 0.05, blue: 0.05, opacity: 1))
        }
        stylist.addStyle(identifier: "heading[error]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("AvenirNext-Medium", size: 19))
                .foregroundColor(Color(red: 0.73, green: 0.05, blue: 0.05, opacity: 1))
                .lineSpacing(-2)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "heading[feature]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("AvenirNext-Medium", size: 22))
                .foregroundColor(Color(red: 0.04, green: 0.08, blue: 0.2, opacity: 1))
                .lineSpacing(-3)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "home-indicator/background") {
            $0
                .background(Color(red: 0, green: 0, blue: 0, opacity: 1))
        }
        stylist.addStyle(identifier: "homepage/note/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("AvenirNext-DemiBold", size: 24))
                .foregroundColor(Color(red: 0.12, green: 0.14, blue: 0.23, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "image/background") {
            $0
                .background(Color(red: 0.9, green: 0.93, blue: 0.95, opacity: 1).overlay(Image("d1dfb56cf342436cb051370564838256ff90c98b", bundle: nil).resizable().aspectRatio(contentMode: .fill)))
                .clipShape(RoundedRectangle(cornerRadius: 10))
        }
        stylist.addStyle(identifier: "image/line") {
            $0
                .overlay(Rectangle().strokeBorder(Color(red: 0.95, green: 0.96, blue: 0.98, opacity: 1), style: StrokeStyle(lineWidth: 3, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
        }
        stylist.addStyle(identifier: "image/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 18))
                .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .lineSpacing(6)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "image[highlighted]/background") {
            $0
                .background(Color(red: 0.91, green: 0.93, blue: 0.95, opacity: 1).overlay(Image("d1dfb56cf342436cb051370564838256ff90c98b", bundle: nil).resizable().aspectRatio(contentMode: .fill)))
                .overlay(RoundedRectangle(cornerRadius: 10).strokeBorder(Color(red: 1, green: 1, blue: 1, opacity: 1), style: StrokeStyle(lineWidth: 4, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
                .overlay(RoundedRectangle(cornerRadius: 10).strokeBorder(Color(red: 0.24, green: 0.4, blue: 0.81, opacity: 1), style: StrokeStyle(lineWidth: 2, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
                .clipShape(RoundedRectangle(cornerRadius: 10))
        }
        stylist.addStyle(identifier: "image[icon-highlighted]/background") {
            $0
                .background(Color(red: 0.91, green: 0.93, blue: 0.95, opacity: 1).overlay(Image("d1dfb56cf342436cb051370564838256ff90c98b", bundle: nil).resizable().aspectRatio(contentMode: .fill)))
                .overlay(RoundedRectangle(cornerRadius: 10).strokeBorder(Color(red: 1, green: 1, blue: 1, opacity: 1), style: StrokeStyle(lineWidth: 4, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
                .overlay(RoundedRectangle(cornerRadius: 10).strokeBorder(Color(red: 0.24, green: 0.4, blue: 0.81, opacity: 1), style: StrokeStyle(lineWidth: 2, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
                .clipShape(RoundedRectangle(cornerRadius: 10))
        }
        stylist.addStyle(identifier: "image[loading]/background") {
            $0
                .background(Color(red: 0.91, green: 0.93, blue: 0.95, opacity: 1).overlay(Image("60b9ab26b14d4cd565c01b852ee291e6e10367ac", bundle: nil).resizable().aspectRatio(contentMode: .fill)))
                .clipShape(RoundedRectangle(cornerRadius: 10))
        }
        stylist.addStyle(identifier: "indicator/background") {
            $0
                .background(Color(red: 0.42, green: 0.6, blue: 0.04, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "indicator[low-stock]/background") {
            $0
                .background(Color(red: 0.87, green: 0.5, blue: 0, opacity: 1))
                .overlay(RoundedRectangle(cornerRadius: 25).strokeBorder(Color(red: 1, green: 1, blue: 1, opacity: 1), style: StrokeStyle(lineWidth: 2, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "indicator[no-stock]/background") {
            $0
                .background(Color(red: 0.7, green: 0.7, blue: 0.7, opacity: 1))
                .overlay(RoundedRectangle(cornerRadius: 25).strokeBorder(Color(red: 1, green: 1, blue: 1, opacity: 1), style: StrokeStyle(lineWidth: 2, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "indicator[out-of-stock]/background") {
            $0
                .background(Color(red: 0.79, green: 0, blue: 0, opacity: 1))
                .overlay(RoundedRectangle(cornerRadius: 25).strokeBorder(Color(red: 1, green: 1, blue: 1, opacity: 1), style: StrokeStyle(lineWidth: 2, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "info/background") {
            $0
                .background(Color(red: 0.95, green: 0.95, blue: 0.95, opacity: 0))
        }
        stylist.addStyle(identifier: "info/subtitle") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 15))
                .foregroundColor(Color(red: 0.39, green: 0.4, blue: 0.46, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "info/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 15))
                .foregroundColor(Color(red: 0.12, green: 0.14, blue: 0.23, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "info[label-error]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 15))
                .foregroundColor(Color(red: 0.73, green: 0.05, blue: 0.05, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "info[label-highlighted]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Semibold", size: 15))
                .foregroundColor(Color(red: 0.12, green: 0.14, blue: 0.23, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "input/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 1))
        }
        stylist.addStyle(identifier: "input/badge/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 0))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "input/badge/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 15))
                .foregroundColor(Color(red: 0.4, green: 0.42, blue: 0.51, opacity: 1))
                .lineSpacing(7)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "input/body") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 15))
                .foregroundColor(Color(red: 0.65, green: 0.66, blue: 0.7, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "input/button-tertiary/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "input/carousel/background") {
            $0
                .background(Color(red: 0.9, green: 0.93, blue: 0.95, opacity: 1).overlay(Image("d1dfb56cf342436cb051370564838256ff90c98b", bundle: nil).resizable().aspectRatio(contentMode: .fill)))
                .overlay(RoundedRectangle(cornerRadius: 15).strokeBorder(Color(red: 1, green: 1, blue: 1, opacity: 1), style: StrokeStyle(lineWidth: 1, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
                .clipShape(RoundedRectangle(cornerRadius: 15))
        }
        stylist.addStyle(identifier: "input/carousel/indicator/background") {
            $0
                .background(Color(red: 0.3, green: 0.82, blue: 0, opacity: 1))
                .overlay(RoundedRectangle(cornerRadius: 25).strokeBorder(Color(red: 1, green: 1, blue: 1, opacity: 1), style: StrokeStyle(lineWidth: 2, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "input/carousel/overlay") {
            $0
                .overlay(RoundedRectangle(cornerRadius: 15).strokeBorder(Color(red: 1, green: 1, blue: 1, opacity: 1), style: StrokeStyle(lineWidth: 2, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
                .clipShape(RoundedRectangle(cornerRadius: 15))
        }
        stylist.addStyle(identifier: "input/carousel[disabled]/overlay") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 0.900197))
                .overlay(RoundedRectangle(cornerRadius: 15).strokeBorder(Color(red: 1, green: 1, blue: 1, opacity: 1), style: StrokeStyle(lineWidth: 2, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
                .clipShape(RoundedRectangle(cornerRadius: 15))
        }
        stylist.addStyle(identifier: "input/carousel[disabled]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 17))
                .foregroundColor(Color(red: 0.56, green: 0.56, blue: 0.56, opacity: 1))
                .lineSpacing(5)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "input/carousel[selected]/overlay") {
            $0
                .overlay(RoundedRectangle(cornerRadius: 15).strokeBorder(Color(red: 1, green: 1, blue: 1, opacity: 1), style: StrokeStyle(lineWidth: 4, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
                .overlay(RoundedRectangle(cornerRadius: 15).strokeBorder(Color(red: 0.24, green: 0.4, blue: 0.81, opacity: 1), style: StrokeStyle(lineWidth: 2, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
                .clipShape(RoundedRectangle(cornerRadius: 15))
        }
        stylist.addStyle(identifier: "input/subtitle") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("AvenirNext-Regular", size: 14))
                .foregroundColor(Color(red: 0.39, green: 0.4, blue: 0.46, opacity: 1))
                .lineSpacing(3)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "input/tag-status/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 0.95))
                .clipShape(RoundedRectangle(cornerRadius: 4))
        }
        stylist.addStyle(identifier: "input/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 17))
                .foregroundColor(Color(red: 0.12, green: 0.14, blue: 0.23, opacity: 1))
                .lineSpacing(5)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "input[blurred]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 17))
                .foregroundColor(Color(red: 0.65, green: 0.66, blue: 0.7, opacity: 1))
                .lineSpacing(5)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "input[carousel]/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 0))
        }
        stylist.addStyle(identifier: "input[cta]/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 0))
        }
        stylist.addStyle(identifier: "input[cta]/button-tertiary/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 0))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "input[date-time-blurred]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 17))
                .foregroundColor(Color(red: 0.65, green: 0.66, blue: 0.7, opacity: 1))
                .lineSpacing(5)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "input[disabled]/subtitle") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("AvenirNext-Regular", size: 14))
                .foregroundColor(Color(red: 0.82, green: 0.84, blue: 0.87, opacity: 1))
                .lineSpacing(3)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "input[disabled]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 17))
                .foregroundColor(Color(red: 0.82, green: 0.84, blue: 0.87, opacity: 1))
                .lineSpacing(5)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "input[error]/body") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 12))
                .foregroundColor(Color(red: 0.65, green: 0.66, blue: 0.69, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "input[error]/divider/background") {
            $0
                .background(Color(red: 0.73, green: 0.05, blue: 0.05, opacity: 1))
        }
        stylist.addStyle(identifier: "input[error]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 17))
                .foregroundColor(Color(red: 0.73, green: 0.05, blue: 0.05, opacity: 1))
                .lineSpacing(5)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "input[radio-box-disabled]/badge/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 15))
                .foregroundColor(Color(red: 0.65, green: 0.66, blue: 0.69, opacity: 1))
                .lineSpacing(7)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "input[radio-box-disabled]/subtitle") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 15))
                .foregroundColor(Color(red: 0.82, green: 0.84, blue: 0.87, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.trailing)
                .frame(alignment: .trailing)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "input[radio-box-disabled]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 17))
                .foregroundColor(Color(red: 0.82, green: 0.84, blue: 0.87, opacity: 1))
                .lineSpacing(5)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "input[radio-box-preview-disabled]/badge/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 15))
                .foregroundColor(Color(red: 0.65, green: 0.66, blue: 0.69, opacity: 1))
                .lineSpacing(7)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "input[radio-box-preview-disabled]/subtitle") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 15))
                .foregroundColor(Color(red: 0.82, green: 0.84, blue: 0.87, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.trailing)
                .frame(alignment: .trailing)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "input[radio-box-preview-disabled]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 17))
                .foregroundColor(Color(red: 0.82, green: 0.84, blue: 0.87, opacity: 1))
                .lineSpacing(5)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "input[radio-box]/body") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 15))
                .foregroundColor(Color(red: 0.65, green: 0.66, blue: 0.7, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.trailing)
                .frame(alignment: .trailing)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "input[tag-disabled]/subtitle") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("AvenirNext-Regular", size: 14))
                .foregroundColor(Color(red: 0.82, green: 0.84, blue: 0.87, opacity: 1))
                .lineSpacing(3)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "input[tag-disabled]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 17))
                .foregroundColor(Color(red: 0.82, green: 0.84, blue: 0.87, opacity: 1))
                .lineSpacing(5)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "input[warning]/body") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 12))
                .foregroundColor(Color(red: 0.65, green: 0.66, blue: 0.69, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "input[warning]/divider/background") {
            $0
                .background(Color(red: 0.88, green: 0.57, blue: 0, opacity: 1))
        }
        stylist.addStyle(identifier: "input[warning]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 17))
                .foregroundColor(Color(red: 0.88, green: 0.57, blue: 0, opacity: 1))
                .lineSpacing(5)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "line") {
            $0
                .overlay(Rectangle().strokeBorder(Color(red: 0.56, green: 0.57, blue: 0.64, opacity: 1), style: StrokeStyle(lineWidth: 1, lineCap: CGLineCap(rawValue: 2), lineJoin: CGLineJoin(rawValue: 0))))
        }
        stylist.addStyle(identifier: "list-group/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        stylist.addStyle(identifier: "list-row/body") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 16))
                .foregroundColor(Color(red: 0.65, green: 0.66, blue: 0.7, opacity: 1))
                .lineSpacing(1)
                .multilineTextAlignment(.trailing)
                .frame(alignment: .trailing)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "list-row/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 18))
                .foregroundColor(Color(red: 0.39, green: 0.4, blue: 0.46, opacity: 1))
                .lineSpacing(-1)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "list-row[double-edit]/body") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 16))
                .foregroundColor(Color(red: 0.65, green: 0.66, blue: 0.7, opacity: 1))
                .lineSpacing(1)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "list-row[highlighted]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 18))
                .foregroundColor(Color(red: 0.73, green: 0.05, blue: 0.05, opacity: 1))
                .lineSpacing(-1)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "list-row[stacked]/body") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 16))
                .foregroundColor(Color(red: 0.65, green: 0.66, blue: 0.7, opacity: 1))
                .lineSpacing(1)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "list-row[task-completed]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                        .strikethrough(true)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 18))
                .foregroundColor(Color(red: 0.65, green: 0.66, blue: 0.69, opacity: 1))
                .lineSpacing(-1)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "list-row[task]/body") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 16))
                .foregroundColor(Color(red: 0.65, green: 0.66, blue: 0.7, opacity: 1))
                .lineSpacing(1)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "list/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 0))
        }
        stylist.addStyle(identifier: "login/background") {
            $0
                .background(Image("f05d87b1d1ab0c7cac15909deb2df866c168cca5", bundle: nil).resizable().aspectRatio(contentMode: .fill))
        }
        stylist.addStyle(identifier: "login/status-bar/background") {
            $0
                .background(Color(red: 0, green: 0, blue: 0, opacity: 1))
        }
        stylist.addStyle(identifier: "login/subtitle") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("AvenirNext-Regular", size: 14))
                .foregroundColor(Color(red: 0.11, green: 0.12, blue: 0.16, opacity: 1))
                .lineSpacing(3)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "login/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("AvenirNext-Regular", size: 18))
                .foregroundColor(Color(red: 0.04, green: 0.08, blue: 0.2, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "login[keycloak]/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 1))
        }
        stylist.addStyle(identifier: "login[keycloak]/overlay") {
            $0
                .background(Image("f05d87b1d1ab0c7cac15909deb2df866c168cca5", bundle: nil).resizable().aspectRatio(contentMode: .fill))
        }
        stylist.addStyle(identifier: "message-view/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 0))
        }
        stylist.addStyle(identifier: "message-view/subtitle") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 15))
                .foregroundColor(Color(red: 0.39, green: 0.4, blue: 0.46, opacity: 1))
                .lineSpacing(3)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "message-view/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("AvenirNext-Medium", size: 16))
                .foregroundColor(Color(red: 0.12, green: 0.14, blue: 0.23, opacity: 1))
                .lineSpacing(6)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "modal/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 1))
        }
        stylist.addStyle(identifier: "modal/button-icon-left/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Medium", size: 17))
                .foregroundColor(Color(red: 0.24, green: 0.4, blue: 0.81, opacity: 1))
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "modal/heading/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 1))
        }
        stylist.addStyle(identifier: "modal/navbar/background") {
            $0
                .background(Color(red: 0.96, green: 0.95, blue: 0.95, opacity: 1))
        }
        stylist.addStyle(identifier: "modal/navbar/button-icon-left/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Medium", size: 17))
                .foregroundColor(Color(red: 0.24, green: 0.4, blue: 0.81, opacity: 1))
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "modal/navbar/button-icon-right/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Medium", size: 17))
                .foregroundColor(Color(red: 0.24, green: 0.4, blue: 0.81, opacity: 1))
                .multilineTextAlignment(.trailing)
                .frame(alignment: .trailing)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "modal/navbar/button-icon-right[disabled]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Medium", size: 17))
                .foregroundColor(Color(red: 0.65, green: 0.66, blue: 0.7, opacity: 1))
                .multilineTextAlignment(.trailing)
                .frame(alignment: .trailing)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "modal/navbar/divider/background") {
            $0
                .background(Color(red: 0.96, green: 0.95, blue: 0.95, opacity: 1))
        }
        stylist.addStyle(identifier: "modal/navbar/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("AvenirNext-Medium", size: 18))
                .foregroundColor(Color(red: 0.12, green: 0.14, blue: 0.23, opacity: 1))
                .lineSpacing(4)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "modal/search/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 1))
        }
        stylist.addStyle(identifier: "modal/search[highlighted]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("AvenirNext-Regular", size: 16))
                .foregroundColor(Color(red: 0.12, green: 0.14, blue: 0.23, opacity: 1))
                .lineSpacing(3)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "modal/searchbar/background") {
            $0
                .background(Color(red: 0.96, green: 0.95, blue: 0.95, opacity: 1))
        }
        stylist.addStyle(identifier: "modal/searchbar/divider/background") {
            $0
                .background(Color(red: 0.96, green: 0.95, blue: 0.95, opacity: 1))
        }
        stylist.addStyle(identifier: "modal/searchbar/search/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 1))
        }
        stylist.addStyle(identifier: "modal/subtitle") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("AvenirNext-Medium", size: 14))
                .foregroundColor(Color(red: 0.39, green: 0.4, blue: 0.46, opacity: 1))
                .lineSpacing(4)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "modal/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("AvenirNext-Medium", size: 16))
                .foregroundColor(Color(red: 0.12, green: 0.14, blue: 0.23, opacity: 1))
                .lineSpacing(6)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "modal[tray]/background") {
            $0
                .background(Color(red: 0.98, green: 0.95, blue: 0.93, opacity: 1))
        }
        stylist.addStyle(identifier: "modal[tray]/navbar/background") {
            $0
                .background(Color(red: 0.98, green: 0.95, blue: 0.93, opacity: 1))
        }
        stylist.addStyle(identifier: "modal[tray]/navbar/divider/background") {
            $0
                .background(Color(red: 0.98, green: 0.95, blue: 0.93, opacity: 1))
        }
        stylist.addStyle(identifier: "modal[tray]/navbar/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("AvenirNext-Medium", size: 18))
                .foregroundColor(Color(red: 0.13, green: 0.15, blue: 0.23, opacity: 1))
                .lineSpacing(4)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "navbar-list/background") {
            $0
                .background(Color(red: 0, green: 0.16, blue: 0.33, opacity: 1))
        }
        stylist.addStyle(identifier: "navbar-list/body") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("AvenirNext-Regular", size: 14))
                .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .lineSpacing(3)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 1), radius: 15, x: 0, y: 0)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "navbar-list/divider/background") {
            $0
                .background(Color(red: 0, green: 0.16, blue: 0.33, opacity: 1))
        }
        stylist.addStyle(identifier: "navbar-list/overlay") {
            $0
                .background(Color(red: 0, green: 0, blue: 0, opacity: 0.50098).overlay(LinearGradient(gradient: Gradient(stops:[.init(color: Color(red: 0, green: 0, blue: 0, opacity: 0.5), location: 0),.init(color: Color(red: 0, green: 0, blue: 0, opacity: 0), location: 1)]), startPoint: UnitPoint(x: 0.5, y: 0), endPoint: UnitPoint(x: 0.5, y: 0.5))))
        }
        stylist.addStyle(identifier: "navbar-list/subtitle") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 16))
                .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .lineSpacing(4)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 1), radius: 15, x: 0, y: 0)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "navbar-list/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("AvenirNext-Medium", size: 18))
                .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .lineSpacing(4)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 1), radius: 15, x: 0, y: 0)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "navbar-profile/background") {
            $0
                .background(Color(red: 0, green: 0.16, blue: 0.33, opacity: 1))
        }
        stylist.addStyle(identifier: "navbar-profile/block/background") {
            $0
                .background(Color(red: 0, green: 0.16, blue: 0.33, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        stylist.addStyle(identifier: "navbar-profile/block/subtitle") {
            $0
                .styleText { text in
                    text
                        .tracking(-0.1)
                }
                .font(Font.custom("SFProDisplay-Medium", size: 10))
                .foregroundColor(Color(red: 0.71, green: 0.73, blue: 0.85, opacity: 1))
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "navbar-profile/block/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.1)
                }
                .font(Font.custom("AvenirNext-Medium", size: 15))
                .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "navbar-profile/body") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("AvenirNext-Medium", size: 18))
                .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .lineSpacing(4)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "navbar-profile/button-tertiary/background") {
            $0
                .background(Color(red: 0, green: 0.16, blue: 0.33, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "navbar-profile/button-tertiary/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Medium", size: 15))
                .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .lineSpacing(5)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "navbar-profile/divider/background") {
            $0
                .background(Color(red: 0, green: 0.16, blue: 0.33, opacity: 1))
        }
        stylist.addStyle(identifier: "navbar-profile/info/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("AvenirNext-Medium", size: 16))
                .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .lineSpacing(4)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "navbar-profile/spinner/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 1))
        }
        stylist.addStyle(identifier: "navbar-profile/subtitle") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2571428571428571)
                }
                .font(Font.custom("AvenirNext-Medium", size: 18))
                .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .lineSpacing(4)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "navbar-profile/tag-primary-icon/background") {
            $0
                .background(Color(red: 0.93, green: 0.92, blue: 0.91, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 4))
        }
        stylist.addStyle(identifier: "navbar-profile/tag-primary/background") {
            $0
                .background(Color(red: 0.93, green: 0.92, blue: 0.91, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 4))
        }
        stylist.addStyle(identifier: "navbar-profile/tag-primary/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Medium", size: 11))
                .foregroundColor(Color(red: 0.04, green: 0.08, blue: 0.2, opacity: 1))
                .lineSpacing(-1)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "navbar-profile/tag-secondary/background") {
            $0
                .background(Color(red: 0.56, green: 0.58, blue: 0.64, opacity: 0))
                .overlay(RoundedRectangle(cornerRadius: 4).strokeBorder(Color(red: 0.93, green: 0.92, blue: 0.91, opacity: 1), style: StrokeStyle(lineWidth: 1, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
                .clipShape(RoundedRectangle(cornerRadius: 4))
        }
        stylist.addStyle(identifier: "navbar-profile/tag-secondary/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Medium", size: 11))
                .foregroundColor(Color(red: 0.93, green: 0.92, blue: 0.91, opacity: 1))
                .lineSpacing(-1)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "navbar-profile/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("AvenirNext-Medium", size: 18))
                .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .lineSpacing(4)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "navbar/background") {
            $0
                .background(Color(red: 0, green: 0.16, blue: 0.33, opacity: 1))
        }
        stylist.addStyle(identifier: "navbar/button-icon-right[disabled]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Medium", size: 17))
                .foregroundColor(Color(red: 0.35, green: 0.45, blue: 0.56, opacity: 1))
                .multilineTextAlignment(.trailing)
                .frame(alignment: .trailing)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "navbar/divider/background") {
            $0
                .background(Color(red: 0, green: 0.16, blue: 0.33, opacity: 1))
        }
        stylist.addStyle(identifier: "navbar/overlay") {
            $0
                .background(Color(red: 0, green: 0, blue: 0, opacity: 0.40098).overlay(LinearGradient(gradient: Gradient(stops:[.init(color: Color(red: 0, green: 0, blue: 0, opacity: 0.5), location: 0),.init(color: Color(red: 0, green: 0, blue: 0, opacity: 0), location: 1)]), startPoint: UnitPoint(x: 0.5, y: 0), endPoint: UnitPoint(x: 0.5, y: 0.5))))
        }
        stylist.addStyle(identifier: "navbar/subtitle") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 13))
                .foregroundColor(Color(red: 0.56, green: 0.57, blue: 0.64, opacity: 1))
                .lineSpacing(4)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "navbar/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("AvenirNext-Medium", size: 18))
                .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .lineSpacing(4)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "navbar[image-search]/search/title") {
            $0
                .font(Font.custom("SFProDisplay-Regular", size: 16))
                .foregroundColor(Color(red: 0.81, green: 0.81, blue: 0.81, opacity: 1))
                .lineSpacing(3)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "navbar[image-search]/searchbar/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 0))
        }
        stylist.addStyle(identifier: "navbar[image-search]/searchbar/search/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 0.15))
        }
        stylist.addStyle(identifier: "navbar[image]/search/title") {
            $0
                .font(Font.custom("SFProDisplay-Regular", size: 16))
                .foregroundColor(Color(red: 0.81, green: 0.81, blue: 0.81, opacity: 1))
                .lineSpacing(3)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "navbar[image]/searchbar/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 0))
        }
        stylist.addStyle(identifier: "navbar[image]/searchbar/search/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 0.15))
        }
        stylist.addStyle(identifier: "note-info/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 0))
        }
        stylist.addStyle(identifier: "note-instructions/background") {
            $0
                .background(Color(red: 0.95, green: 0.96, blue: 0.98, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        stylist.addStyle(identifier: "note-instructions/body") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 14))
                .foregroundColor(Color(red: 0.39, green: 0.4, blue: 0.46, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "note-instructions/subtitle") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("AvenirNext-Medium", size: 14))
                .foregroundColor(Color(red: 0.39, green: 0.4, blue: 0.46, opacity: 1))
                .lineSpacing(8)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "note-instructions/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("AvenirNext-Medium", size: 16))
                .foregroundColor(Color(red: 0.12, green: 0.14, blue: 0.23, opacity: 1))
                .lineSpacing(6)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "note-instructions[alert]/background") {
            $0
                .background(Color(red: 1, green: 0.92, blue: 0.92, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        stylist.addStyle(identifier: "note-instructions[alert]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("AvenirNext-Medium", size: 16))
                .foregroundColor(Color(red: 0.73, green: 0.05, blue: 0.05, opacity: 1))
                .lineSpacing(6)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "note/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 0))
        }
        stylist.addStyle(identifier: "note/body") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 15))
                .foregroundColor(Color(red: 0.39, green: 0.4, blue: 0.46, opacity: 1))
                .lineSpacing(4)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "note/subtitle") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Medium", size: 15))
                .foregroundColor(Color(red: 0.03, green: 0.08, blue: 0.22, opacity: 1))
                .multilineTextAlignment(.trailing)
                .frame(alignment: .trailing)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "note/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("AvenirNext-Medium", size: 15))
                .foregroundColor(Color(red: 0.12, green: 0.14, blue: 0.23, opacity: 1))
                .lineSpacing(4)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "note[alert]/body") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 15))
                .foregroundColor(Color(red: 0.73, green: 0.05, blue: 0.05, opacity: 1))
                .lineSpacing(4)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "note[alert]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("AvenirNext-Medium", size: 15))
                .foregroundColor(Color(red: 0.73, green: 0.05, blue: 0.05, opacity: 1))
                .lineSpacing(4)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "note[status]/background") {
            $0
                .background(Color(red: 0.95, green: 0.96, blue: 0.98, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        stylist.addStyle(identifier: "notification/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.2), radius: 20, x: 0, y: 10)
        }
        stylist.addStyle(identifier: "notification/body") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 12))
                .foregroundColor(Color(red: 0.65, green: 0.66, blue: 0.69, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.trailing)
                .frame(alignment: .trailing)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "notification/info[label]/subtitle") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 13))
                .foregroundColor(Color(red: 0.65, green: 0.66, blue: 0.69, opacity: 1))
                .lineSpacing(1)
                .multilineTextAlignment(.trailing)
                .frame(alignment: .trailing)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "notification/info[label]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 13))
                .foregroundColor(Color(red: 0.45, green: 0.46, blue: 0.48, opacity: 1))
                .lineSpacing(1)
                .multilineTextAlignment(.trailing)
                .frame(alignment: .trailing)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "notification/subtitle") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 13))
                .foregroundColor(Color(red: 0.65, green: 0.66, blue: 0.69, opacity: 1))
                .lineSpacing(1)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "notification/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 15))
                .foregroundColor(Color(red: 0.12, green: 0.14, blue: 0.23, opacity: 1))
                .lineSpacing(3)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "notification/underlay") {
            $0
                .background(Color(red: 0.24, green: 0.4, blue: 0.81, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        stylist.addStyle(identifier: "notification[read]/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(Color(red: 0.91, green: 0.91, blue: 0.92, opacity: 1), style: StrokeStyle(lineWidth: 1, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        stylist.addStyle(identifier: "notification[swipe]/background") {
            $0
                .background(Color(red: 0.95, green: 0.96, blue: 0.98, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        stylist.addStyle(identifier: "notification[unread]/background") {
            $0
                .background(Color(red: 0.95, green: 0.96, blue: 0.98, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        stylist.addStyle(identifier: "overlay") {
            $0
                .background(Color(red: 0, green: 0, blue: 0, opacity: 0.35))
        }
        stylist.addStyle(identifier: "permissions/status-bar/background") {
            $0
                .background(Color(red: 0, green: 0, blue: 0, opacity: 1))
        }
        stylist.addStyle(identifier: "product/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 0))
        }
        stylist.addStyle(identifier: "product/body") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 15))
                .foregroundColor(Color(red: 0.39, green: 0.4, blue: 0.46, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "product/subtitle") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("AvenirNext-Medium", size: 10))
                .foregroundColor(Color(red: 0.65, green: 0.66, blue: 0.7, opacity: 1))
                .lineSpacing(1)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "product/tag-primary/background") {
            $0
                .background(Color(red: 0.91, green: 0.93, blue: 0.95, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 4))
        }
        stylist.addStyle(identifier: "product/tag-primary/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("AvenirNext-Medium", size: 12))
                .foregroundColor(Color(red: 0.42, green: 0.44, blue: 0.54, opacity: 1))
                .lineSpacing(-2)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "product/tag-primary[highlighted]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("AvenirNext-Medium", size: 12))
                .foregroundColor(Color(red: 0.83, green: 0.04, blue: 0.04, opacity: 1))
                .lineSpacing(-2)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "product/tag-secondary/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 0))
                .clipShape(RoundedRectangle(cornerRadius: 4))
        }
        stylist.addStyle(identifier: "product/tag-secondary/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                        .strikethrough(true)
                }
                .font(Font.custom("AvenirNext-Medium", size: 12))
                .foregroundColor(Color(red: 0.42, green: 0.44, blue: 0.54, opacity: 1))
                .lineSpacing(-2)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "product/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("AvenirNext-Medium", size: 17))
                .foregroundColor(Color(red: 0.12, green: 0.14, blue: 0.23, opacity: 1))
                .lineSpacing(3)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "product[group-image]/background") {
            $0
                .background(Color(red: 0.95, green: 0.96, blue: 0.98, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        stylist.addStyle(identifier: "product[group-image]/button-tertiary/background") {
            $0
                .background(Color(red: 0.95, green: 0.96, blue: 0.98, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "product[group-swipe]/background") {
            $0
                .background(Color(red: 0.95, green: 0.96, blue: 0.98, opacity: 1))
        }
        stylist.addStyle(identifier: "product[group-swipe]/button-tertiary/background") {
            $0
                .background(Color(red: 0.95, green: 0.96, blue: 0.98, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "product[group]/background") {
            $0
                .background(Color(red: 0.95, green: 0.96, blue: 0.98, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        stylist.addStyle(identifier: "product[group]/button-tertiary/background") {
            $0
                .background(Color(red: 0.95, green: 0.96, blue: 0.98, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "product[info]/button-tertiary/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "product[info]/button-tertiary/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("AvenirNext-Medium", size: 10))
                .foregroundColor(Color(red: 0.65, green: 0.66, blue: 0.7, opacity: 1))
                .lineSpacing(1)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "product[info]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2666666666666667)
                }
                .font(Font.custom("AvenirNext-Medium", size: 24))
                .foregroundColor(Color(red: 0.12, green: 0.14, blue: 0.23, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "product[row-swipe]/background") {
            $0
                .background(Color(red: 0.95, green: 0.96, blue: 0.98, opacity: 1))
        }
        stylist.addStyle(identifier: "product[row-swipe]/divider/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 0))
        }
        stylist.addStyle(identifier: "product[row]/background") {
            $0
                .background(Color(red: 0.95, green: 0.96, blue: 0.98, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        stylist.addStyle(identifier: "product[row]/divider/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 0))
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        stylist.addStyle(identifier: "product[row]/tag-primary[highlighted]/background") {
            $0
                .background(Color(red: 1, green: 0.93, blue: 0.93, opacity: 1))
                .overlay(RoundedRectangle(cornerRadius: 4).strokeBorder(Color(red: 0.92, green: 0.81, blue: 0.81, opacity: 1), style: StrokeStyle(lineWidth: 1, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
                .clipShape(RoundedRectangle(cornerRadius: 4))
        }
        stylist.addStyle(identifier: "products/button-filters[selected]/title") {
            $0
                .font(Font.custom("AvenirNext-Medium", size: 12))
                .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "products/subtitle") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("AvenirNext-Medium", size: 10))
                .foregroundColor(Color(red: 0.56, green: 0.57, blue: 0.64, opacity: 1))
                .lineSpacing(1)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "products/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("AvenirNext-Medium", size: 18))
                .foregroundColor(Color(red: 0.32, green: 0.34, blue: 0.44, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "progress-item/background") {
            $0
                .background(Color(red: 0.24, green: 0.4, blue: 0.81, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        stylist.addStyle(identifier: "progress-item[10]/background") {
            $0
                .background(Color(red: 0.26, green: 0.73, blue: 0, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        stylist.addStyle(identifier: "progress-item[1]/background") {
            $0
                .background(Color(red: 0.69, green: 0, blue: 0, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        stylist.addStyle(identifier: "progress-item[2]/background") {
            $0
                .background(Color(red: 0.77, green: 0.22, blue: 0, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        stylist.addStyle(identifier: "progress-item[3]/background") {
            $0
                .background(Color(red: 0.82, green: 0.35, blue: 0, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        stylist.addStyle(identifier: "progress-item[4]/background") {
            $0
                .background(Color(red: 0.87, green: 0.5, blue: 0, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        stylist.addStyle(identifier: "progress-item[5]/background") {
            $0
                .background(Color(red: 0.88, green: 0.57, blue: 0, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        stylist.addStyle(identifier: "progress-item[6]/background") {
            $0
                .background(Color(red: 0.88, green: 0.63, blue: 0, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        stylist.addStyle(identifier: "progress-item[7]/background") {
            $0
                .background(Color(red: 0.89, green: 0.69, blue: 0, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        stylist.addStyle(identifier: "progress-item[8]/background") {
            $0
                .background(Color(red: 0.79, green: 0.73, blue: 0, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        stylist.addStyle(identifier: "progress-item[9]/background") {
            $0
                .background(Color(red: 0.58, green: 0.73, blue: 0, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        stylist.addStyle(identifier: "progress-item[disabled]/background") {
            $0
                .background(Color(red: 0.95, green: 0.96, blue: 0.98, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        stylist.addStyle(identifier: "pulldown-item/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 0))
        }
        stylist.addStyle(identifier: "pulldown-item/divider/background") {
            $0
                .background(Color(red: 0.91, green: 0.91, blue: 0.91, opacity: 1))
        }
        stylist.addStyle(identifier: "pulldown-item/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2125)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 17))
                .foregroundColor(Color(red: 0.12, green: 0.14, blue: 0.23, opacity: 1))
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "pulldown-item[alert]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2125)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 17))
                .foregroundColor(Color(red: 0.73, green: 0.05, blue: 0.05, opacity: 1))
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "pulldown-item[disabled]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2125)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 17))
                .foregroundColor(Color(red: 0.65, green: 0.67, blue: 0.74, opacity: 1))
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "pulldown/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.2), radius: 20, x: 0, y: 10)
        }
        stylist.addStyle(identifier: "qr-code/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 1))
        }
        stylist.addStyle(identifier: "qr-code/overlay") {
            $0
                .background(Color(red: 0.13, green: 0.15, blue: 0.23, opacity: 1))
        }
        stylist.addStyle(identifier: "rating-details/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 0))
        }
        stylist.addStyle(identifier: "rating-details/body") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Medium", size: 15))
                .foregroundColor(Color(red: 0.03, green: 0.08, blue: 0.22, opacity: 1))
                .multilineTextAlignment(.trailing)
                .frame(alignment: .trailing)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "rating-details/button-tertiary/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 0))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "rating-details/subtitle") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("AvenirNext-Regular", size: 12))
                .foregroundColor(Color(red: 0.56, green: 0.57, blue: 0.64, opacity: 1))
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "rating-details/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("AvenirNext-Medium", size: 28))
                .foregroundColor(Color(red: 0.03, green: 0.08, blue: 0.22, opacity: 1))
                .lineSpacing(4)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "search/background") {
            $0
                .background(Color(red: 0.15, green: 0.28, blue: 0.43, opacity: 1))
        }
        stylist.addStyle(identifier: "search/title") {
            $0
                .font(Font.custom("SFProDisplay-Regular", size: 16))
                .foregroundColor(Color(red: 0.49, green: 0.57, blue: 0.66, opacity: 1))
                .lineSpacing(3)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "search[highlighted]/title") {
            $0
                .font(Font.custom("SFProDisplay-Regular", size: 16))
                .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .lineSpacing(3)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "searchbar/background") {
            $0
                .background(Color(red: 0, green: 0.16, blue: 0.33, opacity: 1))
        }
        stylist.addStyle(identifier: "searchbar/divider/background") {
            $0
                .background(Color(red: 0, green: 0.16, blue: 0.33, opacity: 1))
        }
        stylist.addStyle(identifier: "signature/button-tertiary/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "signature/line") {
            $0
                .overlay(Rectangle().strokeBorder(Color(red: 0.56, green: 0.57, blue: 0.64, opacity: 1), style: StrokeStyle(lineWidth: 1, lineCap: CGLineCap(rawValue: 2), lineJoin: CGLineJoin(rawValue: 0))))
        }
        stylist.addStyle(identifier: "signature[disabled]/line") {
            $0
                .overlay(Rectangle().strokeBorder(Color(red: 0.78, green: 0.83, blue: 0.91, opacity: 1), style: StrokeStyle(lineWidth: 1, lineCap: CGLineCap(rawValue: 2), lineJoin: CGLineJoin(rawValue: 0))))
        }
        stylist.addStyle(identifier: "signature[disabled]/subtitle") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("AvenirNext-Medium", size: 14))
                .foregroundColor(Color(red: 0.82, green: 0.84, blue: 0.87, opacity: 1))
                .lineSpacing(3)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "spinner/background") {
            $0
                .background(Color(red: 0, green: 0, blue: 0, opacity: 1))
        }
        stylist.addStyle(identifier: "stat-item/background") {
            $0
                .background(Color(red: 0.95, green: 0.96, blue: 0.98, opacity: 1))
        }
        stylist.addStyle(identifier: "stat-item/subtitle") {
            $0
                .font(Font.custom("SFProDisplay-Regular", size: 12))
                .foregroundColor(Color(red: 0.32, green: 0.34, blue: 0.44, opacity: 1))
                .lineSpacing(-2)
                .multilineTextAlignment(.trailing)
                .frame(alignment: .trailing)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "stat-item/title") {
            $0
                .font(Font.custom("SFProDisplay-Medium", size: 13))
                .foregroundColor(Color(red: 0.09, green: 0.18, blue: 0.31, opacity: 1))
                .lineSpacing(-3)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "status-bar/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 1))
        }
        stylist.addStyle(identifier: "stepper/background") {
            $0
                .background(Color(red: 0.97, green: 0.98, blue: 1, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        stylist.addStyle(identifier: "stepper/line") {
            $0
                .overlay(Rectangle().strokeBorder(Color(red: 0.78, green: 0.83, blue: 0.91, opacity: 1), style: StrokeStyle(lineWidth: 1, lineCap: CGLineCap(rawValue: 1), lineJoin: CGLineJoin(rawValue: 1))))
        }
        stylist.addStyle(identifier: "subheading/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 1))
        }
        stylist.addStyle(identifier: "subheading/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("AvenirNext-Medium", size: 15))
                .foregroundColor(Color(red: 0.56, green: 0.58, blue: 0.64, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "subheading[error]/divider/background") {
            $0
                .background(Color(red: 0.73, green: 0.05, blue: 0.05, opacity: 1))
        }
        stylist.addStyle(identifier: "subheading[error]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("AvenirNext-Medium", size: 15))
                .foregroundColor(Color(red: 0.73, green: 0.05, blue: 0.05, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "subtitle") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("AvenirNext-Medium", size: 14))
                .foregroundColor(Color(red: 0.39, green: 0.4, blue: 0.46, opacity: 1))
                .lineSpacing(3)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "tabbar/background") {
            $0
                .background(Color(red: 0.98, green: 0.95, blue: 0.94, opacity: 1))
        }
        stylist.addStyle(identifier: "tabbar/divider/background") {
            $0
                .background(Color(red: 0.98, green: 0.95, blue: 0.94, opacity: 1))
        }
        stylist.addStyle(identifier: "tablet/product[info]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.3111111111111112)
                }
                .font(Font.custom("AvenirNext-Medium", size: 28))
                .foregroundColor(Color(red: 0.12, green: 0.14, blue: 0.23, opacity: 1))
                .lineSpacing(-2)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "tabswitch/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(Color(red: 0.91, green: 0.91, blue: 0.92, opacity: 1), style: StrokeStyle(lineWidth: 1, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        stylist.addStyle(identifier: "tag-primary-icon/background") {
            $0
                .background(Color(red: 0.12, green: 0.14, blue: 0.23, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 4))
        }
        stylist.addStyle(identifier: "tag-primary/background") {
            $0
                .background(Color(red: 0.12, green: 0.14, blue: 0.23, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 4))
        }
        stylist.addStyle(identifier: "tag-primary/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Medium", size: 11))
                .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .lineSpacing(-1)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "tag-primary[highlighted]/background") {
            $0
                .background(Color(red: 1, green: 0.93, blue: 0.93, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 4))
        }
        stylist.addStyle(identifier: "tag-primary[highlighted]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Medium", size: 11))
                .foregroundColor(Color(red: 0.82, green: 0.04, blue: 0.04, opacity: 1))
                .lineSpacing(-1)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "tag-secondary/background") {
            $0
                .background(Color(red: 0.91, green: 0.93, blue: 0.95, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 4))
        }
        stylist.addStyle(identifier: "tag-secondary/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Medium", size: 11))
                .foregroundColor(Color(red: 0.32, green: 0.34, blue: 0.44, opacity: 1))
                .lineSpacing(-1)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "tag-secondary[add]/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .overlay(RoundedRectangle(cornerRadius: 4).strokeBorder(Color(red: 0.27, green: 0.7, blue: 0.03, opacity: 1), style: StrokeStyle(lineWidth: 1, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
                .clipShape(RoundedRectangle(cornerRadius: 4))
        }
        stylist.addStyle(identifier: "tag-secondary[add]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Medium", size: 11))
                .foregroundColor(Color(red: 0.27, green: 0.7, blue: 0.03, opacity: 1))
                .lineSpacing(-1)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "tag-secondary[alert]/background") {
            $0
                .background(Color(red: 1, green: 0.93, blue: 0.93, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 4))
        }
        stylist.addStyle(identifier: "tag-secondary[alert]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Medium", size: 11))
                .foregroundColor(Color(red: 0.82, green: 0.04, blue: 0.04, opacity: 1))
                .lineSpacing(-1)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "tag-secondary[appointments]/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .overlay(RoundedRectangle(cornerRadius: 4).strokeBorder(Color(red: 1, green: 0.51, blue: 0.51, opacity: 1), style: StrokeStyle(lineWidth: 1, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
                .clipShape(RoundedRectangle(cornerRadius: 4))
        }
        stylist.addStyle(identifier: "tag-secondary[appointments]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Medium", size: 11))
                .foregroundColor(Color(red: 0.91, green: 0.27, blue: 0.27, opacity: 1))
                .lineSpacing(-1)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "tag-secondary[consultation]/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .overlay(RoundedRectangle(cornerRadius: 4).strokeBorder(Color(red: 0.27, green: 0.7, blue: 0.03, opacity: 1), style: StrokeStyle(lineWidth: 1, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
                .clipShape(RoundedRectangle(cornerRadius: 4))
        }
        stylist.addStyle(identifier: "tag-secondary[consultation]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Medium", size: 11))
                .foregroundColor(Color(red: 0.27, green: 0.7, blue: 0.03, opacity: 1))
                .lineSpacing(-1)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "tag-secondary[delete]/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .overlay(RoundedRectangle(cornerRadius: 4).strokeBorder(Color(red: 0.82, green: 0.04, blue: 0.04, opacity: 1), style: StrokeStyle(lineWidth: 1, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
                .clipShape(RoundedRectangle(cornerRadius: 4))
        }
        stylist.addStyle(identifier: "tag-secondary[delete]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Medium", size: 11))
                .foregroundColor(Color(red: 0.82, green: 0.04, blue: 0.04, opacity: 1))
                .lineSpacing(-1)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "tag-secondary[important]/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .overlay(RoundedRectangle(cornerRadius: 4).strokeBorder(Color(red: 0.89, green: 0.7, blue: 0.02, opacity: 1), style: StrokeStyle(lineWidth: 1, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
                .clipShape(RoundedRectangle(cornerRadius: 4))
        }
        stylist.addStyle(identifier: "tag-secondary[important]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Medium", size: 11))
                .foregroundColor(Color(red: 0.77, green: 0.6, blue: 0, opacity: 1))
                .lineSpacing(-1)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "tag-secondary[newsletter]/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .overlay(RoundedRectangle(cornerRadius: 4).strokeBorder(Color(red: 0.75, green: 0.03, blue: 0.78, opacity: 1), style: StrokeStyle(lineWidth: 1, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
                .clipShape(RoundedRectangle(cornerRadius: 4))
        }
        stylist.addStyle(identifier: "tag-secondary[newsletter]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Medium", size: 11))
                .foregroundColor(Color(red: 0.75, green: 0.03, blue: 0.78, opacity: 1))
                .lineSpacing(-1)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "tag-secondary[outreaches]/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .overlay(RoundedRectangle(cornerRadius: 4).strokeBorder(Color(red: 0.16, green: 0.37, blue: 0.89, opacity: 1), style: StrokeStyle(lineWidth: 1, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
                .clipShape(RoundedRectangle(cornerRadius: 4))
        }
        stylist.addStyle(identifier: "tag-secondary[outreaches]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Medium", size: 11))
                .foregroundColor(Color(red: 0.16, green: 0.37, blue: 0.89, opacity: 1))
                .lineSpacing(-1)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "tag-secondary[transactions]/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .overlay(RoundedRectangle(cornerRadius: 4).strokeBorder(Color(red: 0.82, green: 0.04, blue: 0.04, opacity: 1), style: StrokeStyle(lineWidth: 1, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
                .clipShape(RoundedRectangle(cornerRadius: 4))
        }
        stylist.addStyle(identifier: "tag-secondary[transactions]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Medium", size: 11))
                .foregroundColor(Color(red: 0.82, green: 0.04, blue: 0.04, opacity: 1))
                .lineSpacing(-1)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "tag-secondary[update]/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .overlay(RoundedRectangle(cornerRadius: 4).strokeBorder(Color(red: 0.16, green: 0.37, blue: 0.89, opacity: 1), style: StrokeStyle(lineWidth: 1, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
                .clipShape(RoundedRectangle(cornerRadius: 4))
        }
        stylist.addStyle(identifier: "tag-secondary[update]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Medium", size: 11))
                .foregroundColor(Color(red: 0.16, green: 0.37, blue: 0.89, opacity: 1))
                .lineSpacing(-1)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "tag-status/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 0.95))
                .clipShape(RoundedRectangle(cornerRadius: 4))
        }
        stylist.addStyle(identifier: "tag-status/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Medium", size: 11))
                .foregroundColor(Color(red: 0, green: 0, blue: 0, opacity: 1))
                .lineSpacing(-1)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "tag-status[10]/indicator/background") {
            $0
                .background(Color(red: 0.26, green: 0.73, blue: 0, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "tag-status[1]/indicator/background") {
            $0
                .background(Color(red: 0.69, green: 0, blue: 0, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "tag-status[2]/indicator/background") {
            $0
                .background(Color(red: 0.77, green: 0.22, blue: 0, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "tag-status[3]/indicator/background") {
            $0
                .background(Color(red: 0.82, green: 0.35, blue: 0, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "tag-status[4]/indicator/background") {
            $0
                .background(Color(red: 0.87, green: 0.5, blue: 0, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "tag-status[5]/indicator/background") {
            $0
                .background(Color(red: 0.88, green: 0.57, blue: 0, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "tag-status[6]/indicator/background") {
            $0
                .background(Color(red: 0.88, green: 0.63, blue: 0, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "tag-status[7]/indicator/background") {
            $0
                .background(Color(red: 0.89, green: 0.69, blue: 0, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "tag-status[8]/indicator/background") {
            $0
                .background(Color(red: 0.79, green: 0.73, blue: 0, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "tag-status[9]/indicator/background") {
            $0
                .background(Color(red: 0.58, green: 0.73, blue: 0, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "tag-status[expired]/indicator/background") {
            $0
                .background(Color(red: 0.22, green: 0.22, blue: 0.22, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "tag-status[on-demand]/indicator/background") {
            $0
                .background(Color(red: 0.99, green: 0.77, blue: 0.12, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "tag-status[out-of-stock]/indicator/background") {
            $0
                .background(Color(red: 0.79, green: 0, blue: 0, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "tasks/block[icon-selected]/background") {
            $0
                .background(Color(red: 0.95, green: 0.96, blue: 0.98, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        stylist.addStyle(identifier: "tasks/block[icon]/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(Color(red: 0.95, green: 0.96, blue: 0.98, opacity: 1), style: StrokeStyle(lineWidth: 1, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        stylist.addStyle(identifier: "tile/info/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("AvenirNext-Regular", size: 14))
                .foregroundColor(Color(red: 0.39, green: 0.4, blue: 0.46, opacity: 1))
                .lineSpacing(3)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "tile/subtitle") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("AvenirNext-Regular", size: 14))
                .foregroundColor(Color(red: 0.39, green: 0.4, blue: 0.46, opacity: 1))
                .lineSpacing(3)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "tile/tag-primary-icon/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "tile/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("AvenirNext-Medium", size: 15))
                .foregroundColor(Color(red: 0.12, green: 0.14, blue: 0.23, opacity: 1))
                .lineSpacing(3)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "time-picker/underlay") {
            $0
                .background(Color(red: 0.96, green: 0.96, blue: 0.96, opacity: 1))
        }
        stylist.addStyle(identifier: "timeline-actions/background") {
            $0
                .background(Color(red: 0.91, green: 0.93, blue: 0.95, opacity: 1))
                .clipShape(RoundedCorners(tl: 0, tr: 0, bl: 6, br: 6))
        }
        stylist.addStyle(identifier: "timeline-actions/button-tertiary/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "timeline-actions/button-tertiary/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Medium", size: 12))
                .foregroundColor(Color(red: 0.42, green: 0.6, blue: 0.04, opacity: 1))
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "timeline-actions/button-tertiary[error]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Medium", size: 12))
                .foregroundColor(Color(red: 0.73, green: 0.05, blue: 0.05, opacity: 1))
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "timeline-actions/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 13))
                .foregroundColor(Color(red: 0.13, green: 0.15, blue: 0.23, opacity: 1))
                .lineSpacing(3)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "timeline-date/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 4))
        }
        stylist.addStyle(identifier: "timeline-date/subtitle") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("AvenirNext-Regular", size: 10))
                .foregroundColor(Color(red: 0.39, green: 0.4, blue: 0.46, opacity: 1))
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "timeline-date/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("AvenirNext-Regular", size: 22))
                .foregroundColor(Color(red: 0.12, green: 0.14, blue: 0.23, opacity: 1))
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "timeline-heading/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("AvenirNext-Medium", size: 12))
                .foregroundColor(Color(red: 0.32, green: 0.34, blue: 0.44, opacity: 1))
                .lineSpacing(5)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "timeline-icon/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 4))
        }
        stylist.addStyle(identifier: "timeline-row/background") {
            $0
                .background(Color(red: 0.95, green: 0.96, blue: 0.98, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        stylist.addStyle(identifier: "timeline-row/info/subtitle") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 13))
                .foregroundColor(Color(red: 0.65, green: 0.66, blue: 0.69, opacity: 1))
                .lineSpacing(3)
                .multilineTextAlignment(.trailing)
                .frame(alignment: .trailing)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "timeline-row/info/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 13))
                .foregroundColor(Color(red: 0.13, green: 0.15, blue: 0.23, opacity: 1))
                .lineSpacing(3)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "timeline-row/line") {
            $0
                .overlay(Rectangle().strokeBorder(Color(red: 0.91, green: 0.91, blue: 0.92, opacity: 1), style: StrokeStyle(lineWidth: 1, lineCap: CGLineCap(rawValue: 1), lineJoin: CGLineJoin(rawValue: 1))))
        }
        stylist.addStyle(identifier: "timeline-row/subtitle") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 13))
                .foregroundColor(Color(red: 0.65, green: 0.66, blue: 0.69, opacity: 1))
                .lineSpacing(1)
                .multilineTextAlignment(.trailing)
                .frame(alignment: .trailing)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "timeline-row/tag-status/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 4))
        }
        stylist.addStyle(identifier: "timeline-row/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("AvenirNext-Medium", size: 17))
                .foregroundColor(Color(red: 0.12, green: 0.14, blue: 0.23, opacity: 1))
                .lineSpacing(3)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "timeline-row[future]/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(Color(red: 0.91, green: 0.91, blue: 0.92, opacity: 1), style: StrokeStyle(lineWidth: 1, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 1), dash: [5, 5])))
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        stylist.addStyle(identifier: "timeline-row[highlighted]/background") {
            $0
                .background(Color(red: 0.85, green: 0.92, blue: 1, opacity: 1))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(Color(red: 0.45, green: 0.72, blue: 0.98, opacity: 1), style: StrokeStyle(lineWidth: 1, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 1))))
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        stylist.addStyle(identifier: "timeline-row[highlighted]/timeline-actions/background") {
            $0
                .background(Color(red: 0.74, green: 0.84, blue: 0.95, opacity: 1))
                .clipShape(RoundedCorners(tl: 0, tr: 0, bl: 6, br: 6))
        }
        stylist.addStyle(identifier: "title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("AvenirNext-Regular", size: 18))
                .foregroundColor(Color(red: 0.12, green: 0.14, blue: 0.23, opacity: 1))
                .lineSpacing(-1)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "toast/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .overlay(RoundedRectangle(cornerRadius: 25).strokeBorder(Color(red: 0.56, green: 0.58, blue: 0.64, opacity: 1), style: StrokeStyle(lineWidth: 1, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
                .clipShape(RoundedRectangle(cornerRadius: 25))
                .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.2), radius: 20, x: 0, y: 10)
        }
        stylist.addStyle(identifier: "toast/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.15)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 16))
                .foregroundColor(Color(red: 0.32, green: 0.34, blue: 0.44, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "toast[fail]/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .overlay(RoundedRectangle(cornerRadius: 25).strokeBorder(Color(red: 0.73, green: 0.05, blue: 0.05, opacity: 1), style: StrokeStyle(lineWidth: 1, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
                .clipShape(RoundedRectangle(cornerRadius: 25))
                .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.2), radius: 20, x: 0, y: 10)
        }
        stylist.addStyle(identifier: "toast[fail]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.15)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 16))
                .foregroundColor(Color(red: 0.73, green: 0.05, blue: 0.05, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "toast[success]/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .overlay(RoundedRectangle(cornerRadius: 25).strokeBorder(Color(red: 0.42, green: 0.6, blue: 0.04, opacity: 1), style: StrokeStyle(lineWidth: 1, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
                .clipShape(RoundedRectangle(cornerRadius: 25))
                .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.2), radius: 20, x: 0, y: 10)
        }
        stylist.addStyle(identifier: "toast[success]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.15)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 16))
                .foregroundColor(Color(red: 0.42, green: 0.6, blue: 0.04, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "toggle/background") {
            $0
                .background(Color(red: 0.42, green: 0.62, blue: 0.03, opacity: 1))
        }
        stylist.addStyle(identifier: "toggle[off]/background") {
            $0
                .background(Color(red: 0.94, green: 0.94, blue: 0.93, opacity: 1))
        }
        stylist.addStyle(identifier: "toolbar/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 1))
        }
        stylist.addStyle(identifier: "toolbar/button-icon-left/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Medium", size: 17))
                .foregroundColor(Color(red: 0.24, green: 0.4, blue: 0.81, opacity: 1))
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "toolbar/button-icon-right/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Medium", size: 17))
                .foregroundColor(Color(red: 0.65, green: 0.66, blue: 0.7, opacity: 1))
                .multilineTextAlignment(.trailing)
                .frame(alignment: .trailing)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "toolbar/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Medium", size: 14))
                .foregroundColor(Color(red: 0.39, green: 0.4, blue: 0.46, opacity: 1))
                .lineSpacing(-3)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "toolbar[search]/background") {
            $0
                .background(Color(red: 0.96, green: 0.95, blue: 0.95, opacity: 0))
        }
        stylist.addStyle(identifier: "toolbar[tabs]/background") {
            $0
                .background(Color(red: 0.96, green: 0.95, blue: 0.95, opacity: 1))
        }
        stylist.addStyle(identifier: "totals/info/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 15))
                .foregroundColor(Color(red: 0.32, green: 0.34, blue: 0.44, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.trailing)
                .frame(alignment: .trailing)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "totals/info[label-highlighted]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Semibold", size: 15))
                .foregroundColor(Color(red: 0.32, green: 0.34, blue: 0.44, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.trailing)
                .frame(alignment: .trailing)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "transaction-details/body") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2133333333333333)
                }
                .font(Font.custom("AvenirNext-Regular", size: 16))
                .foregroundColor(Color(red: 0.32, green: 0.34, blue: 0.44, opacity: 1))
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "transaction-details/button-tertiary/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "transaction-details/divider/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 1))
        }
        stylist.addStyle(identifier: "transaction-details/subtitle") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("AvenirNext-Regular", size: 12))
                .foregroundColor(Color(red: 0.56, green: 0.57, blue: 0.64, opacity: 1))
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "transaction-details/tag-status/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 0.95))
                .overlay(RoundedRectangle(cornerRadius: 4).strokeBorder(Color(red: 0.91, green: 0.91, blue: 0.92, opacity: 1), style: StrokeStyle(lineWidth: 1, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
                .clipShape(RoundedRectangle(cornerRadius: 4))
        }
        stylist.addStyle(identifier: "transaction-details/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("AvenirNext-Medium", size: 28))
                .foregroundColor(Color(red: 0.03, green: 0.08, blue: 0.22, opacity: 1))
                .lineSpacing(4)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "tray/background") {
            $0
                .background(Color(red: 0.98, green: 0.95, blue: 0.93, opacity: 1))
        }
        stylist.addStyle(identifier: "tray/divider/background") {
            $0
                .background(Color(red: 0.92, green: 0.89, blue: 0.87, opacity: 1))
        }
        stylist.addStyle(identifier: "tray/image/background") {
            $0
                .background(Color(red: 0.9, green: 0.93, blue: 0.95, opacity: 1).overlay(Image("d1dfb56cf342436cb051370564838256ff90c98b", bundle: nil).resizable().aspectRatio(contentMode: .fill)))
                .overlay(RoundedRectangle(cornerRadius: 4).strokeBorder(Color(red: 0.98, green: 0.95, blue: 0.93, opacity: 1), style: StrokeStyle(lineWidth: 2, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
                .clipShape(RoundedRectangle(cornerRadius: 4))
        }
        stylist.addStyle(identifier: "tray/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("AvenirNext-Medium", size: 15))
                .foregroundColor(Color(red: 0.12, green: 0.14, blue: 0.23, opacity: 1))
                .lineSpacing(3)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "underlay") {
            $0
                .background(Color(red: 0.97, green: 0, blue: 0, opacity: 1))
        }
        stylist.addStyle(identifier: "widget/background") {
            $0
                .background(Color(red: 0.95, green: 0.96, blue: 0.98, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        stylist.addStyle(identifier: "widget/button-tertiary/background") {
            $0
                .background(Color(red: 0.95, green: 0.96, blue: 0.98, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "widget/button-tertiary/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Medium", size: 12))
                .foregroundColor(Color(red: 0.24, green: 0.4, blue: 0.81, opacity: 1))
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "widget/info/title") {
            $0
                .styleText { text in
                    text
                        .tracking(-0.2)
                }
                .font(Font.custom("AvenirNext-Medium", size: 14))
                .foregroundColor(Color(red: 0.39, green: 0.4, blue: 0.46, opacity: 1))
                .lineSpacing(3)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "widget/list-row/background") {
            $0
                .background(Color(red: 0.95, green: 0.96, blue: 0.98, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        stylist.addStyle(identifier: "widget/list-row[task-completed]/body") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 13))
                .foregroundColor(Color(red: 0.65, green: 0.66, blue: 0.7, opacity: 1))
                .lineSpacing(1)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "widget/list-row[task-completed]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                        .strikethrough(true)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 14))
                .foregroundColor(Color(red: 0.65, green: 0.66, blue: 0.69, opacity: 1))
                .lineSpacing(1)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "widget/list-row[task]/body") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 13))
                .foregroundColor(Color(red: 0.65, green: 0.66, blue: 0.7, opacity: 1))
                .lineSpacing(1)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "widget/list-row[task]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("SFProDisplay-Regular", size: 14))
                .foregroundColor(Color(red: 0.39, green: 0.4, blue: 0.46, opacity: 1))
                .lineSpacing(1)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "widget/progress-item[disabled]/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        stylist.addStyle(identifier: "widget/subtitle") {
            $0
                .styleText { text in
                    text
                        .tracking(-0.2)
                }
                .font(Font.custom("AvenirNext-Medium", size: 14))
                .foregroundColor(Color(red: 0.39, green: 0.4, blue: 0.46, opacity: 1))
                .lineSpacing(3)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "widget/title") {
            $0
                .styleText { text in
                    text
                        .tracking(-0.2)
                }
                .font(Font.custom("AvenirNext-Medium", size: 20))
                .foregroundColor(Color(red: 0.12, green: 0.14, blue: 0.23, opacity: 1))
                .lineSpacing(-3)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        return stylist
    }
}

extension UIKitStyleContainer {
    static func create(with stylist: Stylist) -> UIKitStyleContainer {
        let container = UIKitStyleContainer(stylist: stylist)
                container.addProperty(identifier: "@dark/accordion/body") {
                    return [
                            .textColor(UIColor(red: 0.6941176470588235, green: 0.6941176470588235, blue: 0.6941176470588235, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 15)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/accordion/title") {
                    return [
                            .textColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 15)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/alert/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.1764705882352941, green: 0.1764705882352941, blue: 0.1764705882352941, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/alert/list-row/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.1764705882352941, green: 0.1764705882352941, blue: 0.1764705882352941, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/alert/list-row/divider/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.1764705882352941, green: 0.1764705882352941, blue: 0.1764705882352941, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/alert/list-row/title") {
                    return [
                            .textColor(UIColor(red: 0.6941176470588235, green: 0.6941176470588235, blue: 0.6941176470588235, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 14)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/alert/subtitle") {
                    return [
                            .textColor(UIColor(red: 0.6941176470588235, green: 0.6941176470588235, blue: 0.6941176470588235, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 14)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/alert/title") {
                    return [
                            .textColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 16)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/assets/block/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.07058823529411765, green: 0.07058823529411765, blue: 0.07058823529411765, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/attributes/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.07058823529411765, green: 0.07058823529411765, blue: 0.07058823529411765, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/attributes/tag-status/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.07058823529411765, green: 0.07058823529411765, blue: 0.07058823529411765, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/attributes/title") {
                    return [
                            .textColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 17)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.07058823529411765, green: 0.07058823529411765, blue: 0.07058823529411765, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/badge/background") {
                    return [
                            .backgroundColor(UIColor(red: 0, green: 0.6431372549019607, blue: 1, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/banners/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.05098039215686273, green: 0.2117647058823529, blue: 0.3019607843137255, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/banners/divider/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.05098039215686273, green: 0.2117647058823529, blue: 0.3019607843137255, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/banners/title") {
                    return [
                            .textColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 15)!),
                            .textCase(.none),
                            .kerning(0.1)
                    ]
                }
                container.addProperty(identifier: "@dark/banners[alert]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.2431372549019608, green: 0.0196078431372549, blue: 0.0196078431372549, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/banners[alert]/divider[full]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.2431372549019608, green: 0.0196078431372549, blue: 0.0196078431372549, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/banners[alert]/title") {
                    return [
                            .textColor(UIColor(red: 0.9686274509803922, green: 0, blue: 0, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 15)!),
                            .textCase(.none),
                            .kerning(0.1)
                    ]
                }
                container.addProperty(identifier: "@dark/block-stats/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.1764705882352941, green: 0.1764705882352941, blue: 0.1764705882352941, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/block-stats/body") {
                    return [
                            .textColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Regular", size: 36)!),
                            .textCase(.none),
                            .kerning(-0.5)
                    ]
                }
                container.addProperty(identifier: "@dark/block-stats/subtitle") {
                    return [
                            .textColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Medium", size: 13)!),
                            .textCase(.none)
                    ]
                }
                container.addProperty(identifier: "@dark/block-stats/title") {
                    return [
                            .textColor(UIColor(red: 0.6941176470588235, green: 0.6941176470588235, blue: 0.6941176470588235, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 10)!),
                            .textCase(.uppercase),
                            .kerning(-0.1)
                    ]
                }
                container.addProperty(identifier: "@dark/block-stats[circle-wide]/body") {
                    return [
                            .textColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Regular", size: 34)!),
                            .textCase(.none),
                            .kerning(-0.5)
                    ]
                }
                container.addProperty(identifier: "@dark/block-stats[circle-wide]/subtitle") {
                    return [
                            .textColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Medium", size: 15)!),
                            .textCase(.none)
                    ]
                }
                container.addProperty(identifier: "@dark/block-stats[circle3-wide]/body") {
                    return [
                            .textColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 13)!),
                            .textCase(.none)
                    ]
                }
                container.addProperty(identifier: "@dark/block-stats[circle3-wide]/subtitle") {
                    return [
                            .textColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 13)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/block/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.07058823529411765, green: 0.07058823529411765, blue: 0.07058823529411765, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/block/body") {
                    return [
                            .textColor(UIColor(red: 0.6941176470588235, green: 0.6941176470588235, blue: 0.6941176470588235, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-DemiBold", size: 14)!),
                            .textCase(.none),
                            .kerning(-0.1)
                    ]
                }
                container.addProperty(identifier: "@dark/block/subtitle") {
                    return [
                            .textColor(UIColor(red: 0.6941176470588235, green: 0.6941176470588235, blue: 0.6941176470588235, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Medium", size: 10)!),
                            .textCase(.uppercase),
                            .kerning(-0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/block/title") {
                    return [
                            .textColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-DemiBold", size: 20)!),
                            .textCase(.none),
                            .kerning(-0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/block[available-hide]/subtitle") {
                    return [
                            .textColor(UIColor(red: 0.6941176470588235, green: 0.6941176470588235, blue: 0.6941176470588235, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Medium", size: 10)!),
                            .textCase(.uppercase),
                            .kerning(-0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/block[available]/subtitle") {
                    return [
                            .textColor(UIColor(red: 0.6941176470588235, green: 0.6941176470588235, blue: 0.6941176470588235, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Medium", size: 10)!),
                            .textCase(.uppercase),
                            .kerning(-0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/block[available]/title") {
                    return [
                            .textColor(UIColor(red: 0.5529411764705883, green: 0.8196078431372549, blue: 0.01568627450980392, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 20)!),
                            .textCase(.none),
                            .kerning(0.1333333333333333)
                    ]
                }
                container.addProperty(identifier: "@dark/block[out-of-stock-hide]/subtitle") {
                    return [
                            .textColor(UIColor(red: 0.6941176470588235, green: 0.6941176470588235, blue: 0.6941176470588235, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Medium", size: 10)!),
                            .textCase(.uppercase),
                            .kerning(-0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/block[out-of-stock]/subtitle") {
                    return [
                            .textColor(UIColor(red: 0.6941176470588235, green: 0.6941176470588235, blue: 0.6941176470588235, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Medium", size: 10)!),
                            .textCase(.uppercase),
                            .kerning(-0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/block[out-of-stock]/title") {
                    return [
                            .textColor(UIColor(red: 0.9568627450980391, green: 0.02745098039215686, blue: 0.02745098039215686, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 20)!),
                            .textCase(.none),
                            .kerning(0.1333333333333333)
                    ]
                }
                container.addProperty(identifier: "@dark/body") {
                    return [
                            .textColor(UIColor(red: 0.6470588235294118, green: 0.6470588235294118, blue: 0.6470588235294118, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 14)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/button-action-row/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.1764705882352941, green: 0.1764705882352941, blue: 0.1764705882352941, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/button-action-row/subtitle") {
                    return [
                            .textColor(UIColor(red: 0.6941176470588235, green: 0.6941176470588235, blue: 0.6941176470588235, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 14)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/button-action-row/tag-secondary/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.1764705882352941, green: 0.1764705882352941, blue: 0.1764705882352941, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/button-action-row/tag-secondary/title") {
                    return [
                            .textColor(UIColor(red: 0, green: 0.6431372549019607, blue: 1, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 10)!),
                            .textCase(.uppercase),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/button-action-row/title") {
                    return [
                            .textColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 15)!),
                            .textCase(.none),
                            .kerning(0.1764705882352941)
                    ]
                }
                container.addProperty(identifier: "@dark/button-alert/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.2434612771739131, green: 0.02089461875745625, blue: 0.02089461875745625, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/button-alert/title") {
                    return [
                            .textColor(UIColor(red: 0.9686274509803922, green: 0, blue: 0, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 14)!),
                            .textCase(.uppercase),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/button-badge/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.07058823529411765, green: 0.07058823529411765, blue: 0.07058823529411765, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/button-badge/subtitle") {
                    return [
                            .textColor(UIColor(red: 0.6941176470588235, green: 0.6941176470588235, blue: 0.6941176470588235, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Medium", size: 10)!),
                            .textCase(.uppercase),
                            .kerning(-0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/button-badge/title") {
                    return [
                            .textColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-DemiBold", size: 20)!),
                            .textCase(.none),
                            .kerning(-0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/button-badge[selected]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.1764705882352941, green: 0.1764705882352941, blue: 0.1764705882352941, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/button-badge[selected]/subtitle") {
                    return [
                            .textColor(UIColor(red: 0, green: 0.6431372549019607, blue: 1, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Medium", size: 10)!),
                            .textCase(.uppercase),
                            .kerning(-0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/button-badge[selected]/title") {
                    return [
                            .textColor(UIColor(red: 0, green: 0.6431372549019607, blue: 1, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-DemiBold", size: 20)!),
                            .textCase(.none),
                            .kerning(-0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/button-filters-avatar/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.1764705882352941, green: 0.1764705882352941, blue: 0.1764705882352941, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/button-filters-avatar/badge/background") {
                    return [
                            .backgroundColor(UIColor(red: 0, green: 0, blue: 0, alpha: 0))
                    ]
                }
                container.addProperty(identifier: "@dark/button-filters-avatar/badge/title") {
                    return [
                            .textColor(UIColor(red: 0.622848731884058, green: 0.622848731884058, blue: 0.622848731884058, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 14)!),
                            .textCase(.none),
                            .kerning(-0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/button-filters-avatar/overlay") {
                    return [
                            .backgroundColor(UIColor(red: 0, green: 0, blue: 0, alpha: 0))
                    ]
                }
                container.addProperty(identifier: "@dark/button-filters-avatar/subtitle") {
                    return [
                            .textColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-UltraLight", size: 28)!),
                            .textCase(.none)
                    ]
                }
                container.addProperty(identifier: "@dark/button-filters-avatar/title") {
                    return [
                            .textColor(UIColor(red: 0.6941176470588235, green: 0.6941176470588235, blue: 0.6941176470588235, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 14)!),
                            .textCase(.none),
                            .kerning(-0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/button-filters-avatar[disabled]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.1764705882352941, green: 0.1764705882352941, blue: 0.1764705882352941, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/button-filters-avatar[disabled]/badge/title") {
                    return [
                            .textColor(UIColor(red: 0.4274509803921568, green: 0.4274509803921568, blue: 0.4274509803921568, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 14)!),
                            .textCase(.none),
                            .kerning(-0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/button-filters-avatar[disabled]/overlay") {
                    return [
                            .backgroundColor(UIColor(red: 0, green: 0, blue: 0, alpha: 0.4))
                    ]
                }
                container.addProperty(identifier: "@dark/button-filters-avatar[disabled]/title") {
                    return [
                            .textColor(UIColor(red: 0.4274509803921568, green: 0.4274509803921568, blue: 0.4274509803921568, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 14)!),
                            .textCase(.none),
                            .kerning(-0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/button-filters-avatar[selected]/badge/title") {
                    return [
                            .textColor(UIColor(red: 0, green: 0.6431372549019607, blue: 1, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 14)!),
                            .textCase(.none),
                            .kerning(-0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/button-filters-avatar[selected]/title") {
                    return [
                            .textColor(UIColor(red: 0, green: 0.6431372549019607, blue: 1, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 14)!),
                            .textCase(.none),
                            .kerning(-0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/button-filters-icon/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.07058823529411765, green: 0.07058823529411765, blue: 0.07058823529411765, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/button-filters-icon[selected]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0, green: 0.6431372549019607, blue: 1, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/button-filters-multi/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.07058823529411765, green: 0.07058823529411765, blue: 0.07058823529411765, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/button-filters-multi/title") {
                    return [
                            .textColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 12)!),
                            .textCase(.none)
                    ]
                }
                container.addProperty(identifier: "@dark/button-filters-multi[disabled]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.07058823529411765, green: 0.07058823529411765, blue: 0.07058823529411765, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/button-filters-multi[disabled]/title") {
                    return [
                            .textColor(UIColor(red: 0.4274509803921568, green: 0.4274509803921568, blue: 0.4274509803921568, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 12)!),
                            .textCase(.none)
                    ]
                }
                container.addProperty(identifier: "@dark/button-filters-multi[selected]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0, green: 0.6431372549019607, blue: 1, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/button-filters/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.07058823529411765, green: 0.07058823529411765, blue: 0.07058823529411765, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/button-filters/badge/background") {
                    return [
                            .backgroundColor(UIColor(red: 0, green: 0, blue: 0, alpha: 0))
                    ]
                }
                container.addProperty(identifier: "@dark/button-filters/badge/title") {
                    return [
                            .textColor(UIColor(red: 0.6704879981884058, green: 0.6704879981884058, blue: 0.6704879981884058, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 12)!),
                            .textCase(.none)
                    ]
                }
                container.addProperty(identifier: "@dark/button-filters/info/title") {
                    return [
                            .textColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 12)!),
                            .textCase(.none)
                    ]
                }
                container.addProperty(identifier: "@dark/button-filters/title") {
                    return [
                            .textColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 12)!),
                            .textCase(.none)
                    ]
                }
                container.addProperty(identifier: "@dark/button-filters[disabled]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.1843137254901961, green: 0.1843137254901961, blue: 0.1843137254901961, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/button-filters[disabled]/badge/title") {
                    return [
                            .textColor(UIColor(red: 0.4274509803921568, green: 0.4274509803921568, blue: 0.4274509803921568, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 12)!),
                            .textCase(.none)
                    ]
                }
                container.addProperty(identifier: "@dark/button-filters[disabled]/info/title") {
                    return [
                            .textColor(UIColor(red: 0.4274509803921568, green: 0.4274509803921568, blue: 0.4274509803921568, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 12)!),
                            .textCase(.none)
                    ]
                }
                container.addProperty(identifier: "@dark/button-filters[disabled]/title") {
                    return [
                            .textColor(UIColor(red: 0.4274509803921568, green: 0.4274509803921568, blue: 0.4274509803921568, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 12)!),
                            .textCase(.none)
                    ]
                }
                container.addProperty(identifier: "@dark/button-filters[selected]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0, green: 0.6431372549019607, blue: 1, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/button-filters[selected]/badge/title") {
                    return [
                            .textColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 12)!),
                            .textCase(.none)
                    ]
                }
                container.addProperty(identifier: "@dark/button-filters[selected]/info/title") {
                    return [
                            .textColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 12)!),
                            .textCase(.none)
                    ]
                }
                container.addProperty(identifier: "@dark/button-filters[selected]/title") {
                    return [
                            .textColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 12)!),
                            .textCase(.none)
                    ]
                }
                container.addProperty(identifier: "@dark/button-icon-center/title") {
                    return [
                            .textColor(UIColor(red: 0, green: 0.6431372549019607, blue: 1, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Medium", size: 12)!),
                            .textCase(.uppercase),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/button-icon-center[disabled]/title") {
                    return [
                            .textColor(UIColor(red: 0.4, green: 0.4, blue: 0.4, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Medium", size: 12)!),
                            .textCase(.uppercase),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/button-icon-left/title") {
                    return [
                            .textColor(UIColor(red: 0, green: 0.6431372549019607, blue: 1, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Medium", size: 17)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/button-icon-right/title") {
                    return [
                            .textColor(UIColor(red: 0, green: 0.6431372549019607, blue: 1, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Medium", size: 17)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/button-icon-right[disabled]/title") {
                    return [
                            .textColor(UIColor(red: 0.4262907608695652, green: 0.4262907608695652, blue: 0.4262907608695652, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Medium", size: 17)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/button-icon-right[highlighted]/title") {
                    return [
                            .textColor(UIColor(red: 0, green: 0.6431372549019607, blue: 1, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Medium", size: 17)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/button-primary/background") {
                    return [
                            .backgroundColor(UIColor(red: 0, green: 0.6431372549019607, blue: 1, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/button-primary[disabled]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.07058823529411765, green: 0.07058823529411765, blue: 0.07058823529411765, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/button-primary[disabled]/title") {
                    return [
                            .textColor(UIColor(red: 0.4, green: 0.4, blue: 0.4, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 14)!),
                            .textCase(.uppercase),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/button-primary[highlighted]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.1842100475819636, green: 0.2926845576689321, blue: 0.448143115942029, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/button-secondary/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.1764705882352941, green: 0.1764705882352941, blue: 0.1764705882352941, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/button-secondary/title") {
                    return [
                            .textColor(UIColor(red: 0, green: 0.6431372549019607, blue: 1, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 14)!),
                            .textCase(.uppercase),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/button-secondary[disabled]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.07058823529411765, green: 0.07058823529411765, blue: 0.07058823529411765, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/button-secondary[disabled]/title") {
                    return [
                            .textColor(UIColor(red: 0.3999660326086957, green: 0.3999660326086957, blue: 0.3999660326086957, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 14)!),
                            .textCase(.uppercase),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/button-secondary[highlighted]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0, green: 0.6431372549019607, blue: 1, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/button-secondary[highlighted]/title") {
                    return [
                            .textColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 14)!),
                            .textCase(.uppercase),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/button-swipe/background") {
                    return [
                            .backgroundColor(UIColor(red: 0, green: 0.6431372549019607, blue: 1, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/button-swipe[alert]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.9686274509803922, green: 0, blue: 0, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/button-tabbar/title") {
                    return [
                            .textColor(UIColor(red: 0.1294117647058823, green: 0.6078431372549019, blue: 1, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 13)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/button-tabbar[disabled]/title") {
                    return [
                            .textColor(UIColor(red: 0.8196078431372549, green: 0.8196078431372549, blue: 0.8196078431372549, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 13)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/button-tabs/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.2196078431372549, green: 0.2196078431372549, blue: 0.2196078431372549, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/button-tabs/divider/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.1843137254901961, green: 0.1843137254901961, blue: 0.1843137254901961, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/button-tabs/subtitle") {
                    return [
                            .textColor(UIColor(red: 0.6941176470588235, green: 0.6941176470588235, blue: 0.6941176470588235, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Medium", size: 10)!),
                            .textCase(.uppercase),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/button-tabs/title") {
                    return [
                            .textColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 20)!),
                            .textCase(.none),
                            .kerning(0.1333333333333333)
                    ]
                }
                container.addProperty(identifier: "@dark/button-tabs[selected]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.2196078431372549, green: 0.2196078431372549, blue: 0.2196078431372549, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/button-tabs[selected]/divider/background") {
                    return [
                            .backgroundColor(UIColor(red: 0, green: 0.6431372549019607, blue: 1, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/button-tabs[selected]/subtitle") {
                    return [
                            .textColor(UIColor(red: 0, green: 0.6431372549019607, blue: 1, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Medium", size: 10)!),
                            .textCase(.uppercase),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/button-tabs[selected]/title") {
                    return [
                            .textColor(UIColor(red: 0, green: 0.6431372549019607, blue: 1, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 20)!),
                            .textCase(.none),
                            .kerning(0.1333333333333333)
                    ]
                }
                container.addProperty(identifier: "@dark/button-tabswitch/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.07058823529411765, green: 0.07058823529411765, blue: 0.07058823529411765, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/button-tabswitch/title") {
                    return [
                            .textColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 12)!),
                            .textCase(.none)
                    ]
                }
                container.addProperty(identifier: "@dark/button-tabswitch[selected]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0, green: 0.6431372549019607, blue: 1, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/button-tabswitch[selected]/title") {
                    return [
                            .textColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 12)!),
                            .textCase(.none)
                    ]
                }
                container.addProperty(identifier: "@dark/button-tertiary/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.0714730525362319, green: 0.0714730525362319, blue: 0.0714730525362319, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/button-tertiary/title") {
                    return [
                            .textColor(UIColor(red: 0, green: 0.6431372549019607, blue: 1, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Medium", size: 12)!),
                            .textCase(.uppercase),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/button-tertiary[disabled]/title") {
                    return [
                            .textColor(UIColor(red: 0.4, green: 0.4, blue: 0.4, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Medium", size: 12)!),
                            .textCase(.uppercase),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/button-tertiary[error]/title") {
                    return [
                            .textColor(UIColor(red: 0.9686274509803922, green: 0, blue: 0, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Medium", size: 12)!),
                            .textCase(.uppercase),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/button-tertiary[highlighted]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.1647984601449275, green: 0.1647984601449275, blue: 0.1647984601449275, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/button-tertiary[highlighted]/title") {
                    return [
                            .textColor(UIColor(red: 0.5692814628859073, green: 0.841400588768116, blue: 0.02504321112149005, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Medium", size: 12)!),
                            .textCase(.uppercase),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/button-toolbar/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.07058823529411765, green: 0.07058823529411765, blue: 0.07058823529411765, alpha: 0))
                    ]
                }
                container.addProperty(identifier: "@dark/button-toolbar/title") {
                    return [
                            .textColor(UIColor(red: 0, green: 0.6431372549019607, blue: 1, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 14)!),
                            .textCase(.uppercase),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/calendar-day/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.07058823529411765, green: 0.07058823529411765, blue: 0.07058823529411765, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/calendar-day/indicator/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.4569746376811594, green: 0.4534132309202678, blue: 0.4534132309202678, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/calendar-day/title") {
                    return [
                            .textColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Medium", size: 16)!),
                            .textCase(.uppercase),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/calendar-day[disabled]/title") {
                    return [
                            .textColor(UIColor(red: 0.4431372549019608, green: 0.4431372549019608, blue: 0.4431372549019608, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Medium", size: 16)!),
                            .textCase(.uppercase),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/calendar-day[highlighted]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0, green: 0.2633498508098892, blue: 0.409476902173913, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/calendar-day[highlighted]/indicator/background") {
                    return [
                            .backgroundColor(UIColor(red: 0, green: 0.6431372549019607, blue: 1, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/calendar-day[highlighted]/title") {
                    return [
                            .textColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Medium", size: 16)!),
                            .textCase(.uppercase),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/calendar-day[selected]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0, green: 0.6431372549019607, blue: 1, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/calendar-day[selected]/indicator/background") {
                    return [
                            .backgroundColor(UIColor(red: 0, green: 0.6431372549019607, blue: 1, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/calendar-day[selected]/title") {
                    return [
                            .textColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Medium", size: 16)!),
                            .textCase(.uppercase),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/calendar/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.07058823529411765, green: 0.07058823529411765, blue: 0.07058823529411765, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/calendar/subtitle") {
                    return [
                            .textColor(UIColor(red: 0.6941176470588235, green: 0.6941176470588235, blue: 0.6941176470588235, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Medium", size: 13)!),
                            .textCase(.uppercase),
                            .kerning(0.1)
                    ]
                }
                container.addProperty(identifier: "@dark/calendar/title") {
                    return [
                            .textColor(UIColor(red: 0, green: 0.6431372549019607, blue: 1, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 15)!),
                            .textCase(.uppercase),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/camera-view/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.1764705882352941, green: 0.1764705882352941, blue: 0.1764705882352941, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/camera-view/button-icon-left/title") {
                    return [
                            .textColor(UIColor(red: 0, green: 0.6431372549019607, blue: 1, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Medium", size: 17)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/carousel/heading/divider/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.07058823529411765, green: 0.07058823529411765, blue: 0.07058823529411765, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/client-row/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.05882352941176471, green: 0.05882352941176471, blue: 0.05882352941176471, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/client-row/divider/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.2196078431372549, green: 0.2196078431372549, blue: 0.2196078431372549, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/client-row/title") {
                    return [
                            .textColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 18)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/client-row[highlighted]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.1764705882352941, green: 0.1764705882352941, blue: 0.1764705882352941, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/clients/button-tertiary-center/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.1841598731884058, green: 0.1442345998802377, blue: 0.00676913863148694, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/clients/button-tertiary-center/title") {
                    return [
                            .textColor(UIColor(red: 0.9529411764705882, green: 0.796078431372549, blue: 0.2509803921568627, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Medium", size: 12)!),
                            .textCase(.uppercase),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/clients/create/modal/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.2196078431372549, green: 0.2196078431372549, blue: 0.2196078431372549, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/clients/create/modal/heading/background") {
                    return [
                            .backgroundColor(UIColor(red: 0, green: 0, blue: 0, alpha: 0))
                    ]
                }
                container.addProperty(identifier: "@dark/clients/create/note-instructions/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.07058823529411765, green: 0.07058823529411765, blue: 0.07058823529411765, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/clients/profile/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.07058823529411765, green: 0.07058823529411765, blue: 0.07058823529411765, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/clients/profile/block/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.07058823529411765, green: 0.07058823529411765, blue: 0.07058823529411765, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/clients/profile/color-item/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.203921568627451, green: 0.203921568627451, blue: 0.203921568627451, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/curations/block/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.07058823529411765, green: 0.07058823529411765, blue: 0.07058823529411765, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/date-picker/underlay") {
                    return [
                            .backgroundColor(UIColor(red: 0.1662420742753623, green: 0.1662420742753623, blue: 0.1662420742753623, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/divider/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.1843137254901961, green: 0.1843137254901961, blue: 0.1843137254901961, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/divider/overlay") {
                    return [
                            .backgroundColor(UIColor(red: 0.07058823529411765, green: 0.07058823529411765, blue: 0.07058823529411765, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/divider/title") {
                    return [
                            .textColor(UIColor(red: 0.6941176470588235, green: 0.6941176470588235, blue: 0.6941176470588235, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Medium", size: 11)!),
                            .textCase(.uppercase),
                            .kerning(1.2)
                    ]
                }
                container.addProperty(identifier: "@dark/email/title") {
                    return [
                            .textColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-DemiBold", size: 18)!),
                            .textCase(.uppercase),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/expandable/body") {
                    return [
                            .textColor(UIColor(red: 0.6941176470588235, green: 0.6941176470588235, blue: 0.6941176470588235, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 16)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/expandable/title") {
                    return [
                            .textColor(UIColor(red: 0, green: 0.6431372549019607, blue: 1, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 16)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/fab/divider/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.07058823529411765, green: 0.07058823529411765, blue: 0.07058823529411765, alpha: 0))
                    ]
                }
                container.addProperty(identifier: "@dark/fab/info/title") {
                    return [
                            .textColor(UIColor(red: 0.6470588235294118, green: 0.6470588235294118, blue: 0.6470588235294118, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 14)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/filters/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.07058823529411765, green: 0.07058823529411765, blue: 0.07058823529411765, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/fold/overlay") {
                    return [
                            .backgroundColor(UIColor(red: 0, green: 0, blue: 0, alpha: 0.5))
                    ]
                }
                container.addProperty(identifier: "@dark/form-field-message/title") {
                    return [
                            .textColor(UIColor(red: 0.7562273550724637, green: 0.7562273550724637, blue: 0.7562273550724637, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 12)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/form-field-title/title") {
                    return [
                            .textColor(UIColor(red: 0.7568627450980392, green: 0.7568627450980392, blue: 0.7568627450980392, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Regular", size: 14)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/form-field/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0))
                    ]
                }
                container.addProperty(identifier: "@dark/form-field/badge/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0))
                    ]
                }
                container.addProperty(identifier: "@dark/form-field/badge/title") {
                    return [
                            .textColor(UIColor(red: 0.6509803921568628, green: 0.6588235294117647, blue: 0.6941176470588235, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 12)!),
                            .textCase(.none)
                    ]
                }
                container.addProperty(identifier: "@dark/form-field/button-tertiary/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0))
                    ]
                }
                container.addProperty(identifier: "@dark/form-field/button-tertiary/title") {
                    return [
                            .textColor(UIColor(red: 0, green: 0.6431372549019607, blue: 1, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Medium", size: 12)!),
                            .textCase(.uppercase),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/form-field/subtitle") {
                    return [
                            .textColor(UIColor(red: 0.6510528922080994, green: 0.6585400104522705, blue: 0.6951061487197876, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 15)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/form-field/title") {
                    return [
                            .textColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 17)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/form-field[disabled]/badge/title") {
                    return [
                            .textColor(UIColor(red: 0.4431372549019608, green: 0.4431372549019608, blue: 0.4431372549019608, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 12)!),
                            .textCase(.none)
                    ]
                }
                container.addProperty(identifier: "@dark/form-field[disabled]/button-tertiary/title") {
                    return [
                            .textColor(UIColor(red: 0.4431372549019608, green: 0.4431372549019608, blue: 0.4431372549019608, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Medium", size: 12)!),
                            .textCase(.uppercase),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/form-field[disabled]/form-field-message/title") {
                    return [
                            .textColor(UIColor(red: 0.4431372549019608, green: 0.4431372549019608, blue: 0.4431372549019608, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 12)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/form-field[disabled]/form-field-title/title") {
                    return [
                            .textColor(UIColor(red: 0.4431372549019608, green: 0.4431372549019608, blue: 0.4431372549019608, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Regular", size: 14)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/form-field[disabled]/form-type-button/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.9137254901960784, green: 0.9137254901960784, blue: 0.9215686274509803, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/form-field[disabled]/form-type-button/info/title") {
                    return [
                            .textColor(UIColor(red: 0.6509803921568628, green: 0.6588235294117647, blue: 0.6941176470588235, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 12)!),
                            .textCase(.none)
                    ]
                }
                container.addProperty(identifier: "@dark/form-field[disabled]/form-type-button/title") {
                    return [
                            .textColor(UIColor(red: 0.6509803921568628, green: 0.6588235294117647, blue: 0.6941176470588235, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 12)!),
                            .textCase(.none)
                    ]
                }
                container.addProperty(identifier: "@dark/form-field[disabled]/form-type-signature/body") {
                    return [
                            .textColor(UIColor(red: 0.4431372549019608, green: 0.4431372549019608, blue: 0.4431372549019608, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 14)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/form-field[disabled]/form-type-signature/subtitle") {
                    return [
                            .textColor(UIColor(red: 0.4431372549019608, green: 0.4431372549019608, blue: 0.4431372549019608, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 14)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/form-field[disabled]/subtitle") {
                    return [
                            .textColor(UIColor(red: 0.4431372549019608, green: 0.4431372549019608, blue: 0.4431372549019608, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 15)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/form-field[disabled]/title") {
                    return [
                            .textColor(UIColor(red: 0.4431372549019608, green: 0.4431372549019608, blue: 0.4431372549019608, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 17)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/form-field[error]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.2431372549019608, green: 0.0196078431372549, blue: 0.0196078431372549, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/form-field[error]/divider/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.9686274509803922, green: 0, blue: 0, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/form-field[error]/title") {
                    return [
                            .textColor(UIColor(red: 0.9686274509803922, green: 0, blue: 0, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 17)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/form-field[placeholder]/title") {
                    return [
                            .textColor(UIColor(red: 0.6509803921568628, green: 0.6588235294117647, blue: 0.6941176470588235, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 17)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/form-field[warning]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.2784476902173913, green: 0.1798434553112108, blue: 0, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/form-field[warning]/divider/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.8784313725490196, green: 0.5686274509803921, blue: 0, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/form-field[warning]/title") {
                    return [
                            .textColor(UIColor(red: 0.8784313725490196, green: 0.5686274509803921, blue: 0, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 17)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/form-group/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.07058823529411765, green: 0.07058823529411765, blue: 0.07058823529411765, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/form-type-button/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.07058823529411765, green: 0.07058823529411765, blue: 0.07058823529411765, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/form-type-button/info/title") {
                    return [
                            .textColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 14)!),
                            .textCase(.none),
                            .kerning(-0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/form-type-button/title") {
                    return [
                            .textColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 14)!),
                            .textCase(.none),
                            .kerning(-0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/form-type-button[disabled]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.1998414855072464, green: 0.1998414855072464, blue: 0.1998414855072464, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/form-type-button[disabled]/badge/title") {
                    return [
                            .textColor(UIColor(red: 0.6824048913043478, green: 0.6824048913043478, blue: 0.6824048913043478, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 14)!),
                            .textCase(.none),
                            .kerning(-0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/form-type-button[disabled]/info/title") {
                    return [
                            .textColor(UIColor(red: 0.6824048913043478, green: 0.6824048913043478, blue: 0.6824048913043478, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 14)!),
                            .textCase(.none),
                            .kerning(-0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/form-type-button[selected]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0, green: 0.6431372549019607, blue: 1, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/form-type-button[selected]/badge/title") {
                    return [
                            .textColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 14)!),
                            .textCase(.none),
                            .kerning(-0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/form-type-button[selected]/info/title") {
                    return [
                            .textColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 14)!),
                            .textCase(.none),
                            .kerning(-0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/form-type-button[selected]/title") {
                    return [
                            .textColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 14)!),
                            .textCase(.none),
                            .kerning(-0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/form-type-calendar-week/button-tertiary/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0))
                    ]
                }
                container.addProperty(identifier: "@dark/form-type-calendar-week/button-tertiary[highlighted]/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0))
                    ]
                }
                container.addProperty(identifier: "@dark/form-type-calendar-week/subtitle") {
                    return [
                            .textColor(UIColor(red: 0.5637555248790429, green: 0.5747846262623333, blue: 0.6351902173913043, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Medium", size: 13)!),
                            .textCase(.uppercase),
                            .kerning(0.1)
                    ]
                }
                container.addProperty(identifier: "@dark/form-type-calendar-week/title") {
                    return [
                            .textColor(UIColor(red: 0, green: 0.6431372549019607, blue: 1, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 15)!),
                            .textCase(.uppercase),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/form-type-calendar/button-tertiary/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0))
                    ]
                }
                container.addProperty(identifier: "@dark/form-type-calendar/button-tertiary[highlighted]/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0))
                    ]
                }
                container.addProperty(identifier: "@dark/form-type-calendar/subtitle") {
                    return [
                            .textColor(UIColor(red: 0.5637555248790429, green: 0.5747846262623333, blue: 0.6351902173913043, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Medium", size: 13)!),
                            .textCase(.uppercase),
                            .kerning(0.1)
                    ]
                }
                container.addProperty(identifier: "@dark/form-type-calendar/title") {
                    return [
                            .textColor(UIColor(red: 0, green: 0.6431372549019607, blue: 1, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 15)!),
                            .textCase(.uppercase),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/form-type-client[disabled]/info/subtitle") {
                    return [
                            .textColor(UIColor(red: 0.6509803921568628, green: 0.6588235294117647, blue: 0.6941176470588235, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 14)!),
                            .textCase(.none),
                            .kerning(-0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/form-type-client[disabled]/info/title") {
                    return [
                            .textColor(UIColor(red: 0.6509803921568628, green: 0.6588235294117647, blue: 0.6941176470588235, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 14)!),
                            .textCase(.none),
                            .kerning(-0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/form-type-client[disabled]/subtitle") {
                    return [
                            .textColor(UIColor(red: 0.8196078431372549, green: 0.8352941176470589, blue: 0.8705882352941177, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 15)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/form-type-client[disabled]/title") {
                    return [
                            .textColor(UIColor(red: 0.8196078431372549, green: 0.8352941176470589, blue: 0.8705882352941177, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 17)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/form-type-image-sm/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.203921568627451, green: 0.203921568627451, blue: 0.203921568627451, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/form-type-image-sm/indicator/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.2965771113699103, green: 0.816802536231884, blue: 0, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/form-type-image-sm/indicator[expired]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.2172780797101449, green: 0.2172780797101449, blue: 0.2172780797101449, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/form-type-image-sm/indicator[low-stock]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.8705882352941177, green: 0.4980392156862745, blue: 0, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/form-type-image-sm/indicator[no-stock]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.6976902173913043, green: 0.6976902173913043, blue: 0.6976902173913043, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/form-type-image-sm/indicator[on-demand]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.9940557065217391, green: 0.7661099119382088, blue: 0.123916014330511, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/form-type-image-sm/indicator[out-of-stock]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.7932518115942029, green: 0, blue: 0, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/form-type-image-sm/overlay") {
                    return [
                            .backgroundColor(UIColor(red: 0.07058823529411765, green: 0.07058823529411765, blue: 0.07058823529411765, alpha: 0))
                    ]
                }
                container.addProperty(identifier: "@dark/form-type-image-sm/title") {
                    return [
                            .textColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 15)!),
                            .textCase(.uppercase),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/form-type-image-sm[disabled]/overlay") {
                    return [
                            .backgroundColor(UIColor(red: 0.07058823529411765, green: 0.07058823529411765, blue: 0.07058823529411765, alpha: 0.6))
                    ]
                }
                container.addProperty(identifier: "@dark/form-type-image-sm[disabled]/title") {
                    return [
                            .textColor(UIColor(red: 0.5657552083333334, green: 0.5657552083333334, blue: 0.5657552083333334, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 15)!),
                            .textCase(.uppercase),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/form-type-image-sm[selected]/overlay") {
                    return [
                            .backgroundColor(UIColor(red: 0.07058823529411765, green: 0.07058823529411765, blue: 0.07058823529411765, alpha: 0))
                    ]
                }
                container.addProperty(identifier: "@dark/form-type-image/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.203921568627451, green: 0.203921568627451, blue: 0.203921568627451, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/form-type-image/info/title") {
                    return [
                            .textColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 14)!),
                            .textCase(.none),
                            .kerning(-0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/form-type-image/overlay") {
                    return [
                            .backgroundColor(UIColor(red: 0.07058823529411765, green: 0.07058823529411765, blue: 0.07058823529411765, alpha: 0))
                    ]
                }
                container.addProperty(identifier: "@dark/form-type-image/subtitle") {
                    return [
                            .textColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Regular", size: 28)!),
                            .textCase(.none)
                    ]
                }
                container.addProperty(identifier: "@dark/form-type-image[disabled]/badge/title") {
                    return [
                            .textColor(UIColor(red: 0.4656080163043478, green: 0.4656080163043478, blue: 0.4656080163043478, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 12)!),
                            .textCase(.none)
                    ]
                }
                container.addProperty(identifier: "@dark/form-type-image[disabled]/info/title") {
                    return [
                            .textColor(UIColor(red: 0.4656080163043478, green: 0.4656080163043478, blue: 0.4656080163043478, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 14)!),
                            .textCase(.none),
                            .kerning(-0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/form-type-image[disabled]/overlay") {
                    return [
                            .backgroundColor(UIColor(red: 0.07058823529411765, green: 0.07058823529411765, blue: 0.07058823529411765, alpha: 0.6))
                    ]
                }
                container.addProperty(identifier: "@dark/form-type-image[selected]/badge/title") {
                    return [
                            .textColor(UIColor(red: 0, green: 0.6431372549019607, blue: 1, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 12)!),
                            .textCase(.none)
                    ]
                }
                container.addProperty(identifier: "@dark/form-type-image[selected]/info/title") {
                    return [
                            .textColor(UIColor(red: 0, green: 0.6431372549019607, blue: 1, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 14)!),
                            .textCase(.none),
                            .kerning(-0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/form-type-image[selected]/overlay") {
                    return [
                            .backgroundColor(UIColor(red: 0.07058823529411765, green: 0.07058823529411765, blue: 0.07058823529411765, alpha: 0))
                    ]
                }
                container.addProperty(identifier: "@dark/form-type-profile-photo/image/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.07058823529411765, green: 0.07058823529411765, blue: 0.07058823529411765, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/form-type-select-inline[disabled]/badge/title") {
                    return [
                            .textColor(UIColor(red: 0.8196078431372549, green: 0.8352941176470589, blue: 0.8705882352941177, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 12)!),
                            .textCase(.none)
                    ]
                }
                container.addProperty(identifier: "@dark/form-type-select-inline[disabled]/subtitle") {
                    return [
                            .textColor(UIColor(red: 0.8196078431372549, green: 0.8352941176470589, blue: 0.8705882352941177, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 15)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/form-type-select-inline[disabled]/title") {
                    return [
                            .textColor(UIColor(red: 0.8196078431372549, green: 0.8352941176470589, blue: 0.8705882352941177, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 17)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/form-type-select-stacked[disabled]/badge/title") {
                    return [
                            .textColor(UIColor(red: 0.8196078431372549, green: 0.8352941176470589, blue: 0.8705882352941177, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 12)!),
                            .textCase(.none)
                    ]
                }
                container.addProperty(identifier: "@dark/form-type-select-stacked[disabled]/subtitle") {
                    return [
                            .textColor(UIColor(red: 0.8196078431372549, green: 0.8352941176470589, blue: 0.8705882352941177, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 15)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/form-type-select-stacked[disabled]/title") {
                    return [
                            .textColor(UIColor(red: 0.8196078431372549, green: 0.8352941176470589, blue: 0.8705882352941177, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 17)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/form-type-select[disabled]/badge/title") {
                    return [
                            .textColor(UIColor(red: 0.8196078431372549, green: 0.8352941176470589, blue: 0.8705882352941177, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 12)!),
                            .textCase(.none)
                    ]
                }
                container.addProperty(identifier: "@dark/form-type-select[disabled]/subtitle") {
                    return [
                            .textColor(UIColor(red: 0.8196078431372549, green: 0.8352941176470589, blue: 0.8705882352941177, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 15)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/form-type-select[disabled]/title") {
                    return [
                            .textColor(UIColor(red: 0.8196078431372549, green: 0.8352941176470589, blue: 0.8705882352941177, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 17)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/form-type-signature/button-tertiary/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.07058823529411765, green: 0.07058823529411765, blue: 0.07058823529411765, alpha: 0))
                    ]
                }
                container.addProperty(identifier: "@dark/graph-item/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.2837692481884058, green: 0.2837692481884058, blue: 0.2837692481884058, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/heading/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.1568627450980392, green: 0.1568627450980392, blue: 0.1568627450980392, alpha: 0))
                    ]
                }
                container.addProperty(identifier: "@dark/heading/title") {
                    return [
                            .textColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 19)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/heading[feature]/title") {
                    return [
                            .textColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 22)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/home-indicator/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/homepage/note/title") {
                    return [
                            .textColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-DemiBold", size: 24)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/image/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.203921568627451, green: 0.203921568627451, blue: 0.203921568627451, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/image/title") {
                    return [
                            .textColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 18)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/image[highlighted]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.203921568627451, green: 0.203921568627451, blue: 0.203921568627451, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/image[icon-highlighted]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.203921568627451, green: 0.203921568627451, blue: 0.203921568627451, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/image[loading]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.2019644474637681, green: 0.2019644474637681, blue: 0.2019644474637681, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/indicator/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.5529411764705883, green: 0.8196078431372549, blue: 0.01568627450980392, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/indicator[low-stock]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.8705882352941177, green: 0.4980392156862745, blue: 0, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/indicator[no-stock]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.6980392156862745, green: 0.6980392156862745, blue: 0.6980392156862745, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/indicator[out-of-stock]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.792156862745098, green: 0, blue: 0, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/info/subtitle") {
                    return [
                            .textColor(UIColor(red: 0.6941176470588235, green: 0.6941176470588235, blue: 0.6941176470588235, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 15)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/info/title") {
                    return [
                            .textColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 15)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/info[label-error]/title") {
                    return [
                            .textColor(UIColor(red: 0.9686274509803922, green: 0, blue: 0, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 15)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/info[label-highlighted]/title") {
                    return [
                            .textColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Semibold", size: 15)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/input/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.1568627450980392, green: 0.1568627450980392, blue: 0.1568627450980392, alpha: 0))
                    ]
                }
                container.addProperty(identifier: "@dark/input/badge/background") {
                    return [
                            .backgroundColor(UIColor(red: 0, green: 0, blue: 0, alpha: 0))
                    ]
                }
                container.addProperty(identifier: "@dark/input/badge/title") {
                    return [
                            .textColor(UIColor(red: 0.8390511775362319, green: 0.8390511775362319, blue: 0.8390511775362319, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 15)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/input/body") {
                    return [
                            .textColor(UIColor(red: 0.6941176470588235, green: 0.6941176470588235, blue: 0.6941176470588235, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 15)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/input/button-tertiary/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.07058823529411765, green: 0.07058823529411765, blue: 0.07058823529411765, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/input/carousel/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.203921568627451, green: 0.203921568627451, blue: 0.203921568627451, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/input/carousel/indicator/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.2980392156862746, green: 0.8156862745098039, blue: 0, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/input/carousel[disabled]/overlay") {
                    return [
                            .backgroundColor(UIColor(red: 0.07058823529411765, green: 0.07058823529411765, blue: 0.07058823529411765, alpha: 0.8001969999999999))
                    ]
                }
                container.addProperty(identifier: "@dark/input/divider/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.2196078431372549, green: 0.2196078431372549, blue: 0.2196078431372549, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/input/subtitle") {
                    return [
                            .textColor(UIColor(red: 0.6941176470588235, green: 0.6941176470588235, blue: 0.6941176470588235, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Regular", size: 14)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/input/tag-status/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.07058823529411765, green: 0.07058823529411765, blue: 0.07058823529411765, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/input/title") {
                    return [
                            .textColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 17)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/input[blurred]/title") {
                    return [
                            .textColor(UIColor(red: 0.4274509803921568, green: 0.4274509803921568, blue: 0.4274509803921568, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 17)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/input[date-time-blurred]/title") {
                    return [
                            .textColor(UIColor(red: 0.4274509803921568, green: 0.4274509803921568, blue: 0.4274509803921568, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 17)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/input[disabled]/subtitle") {
                    return [
                            .textColor(UIColor(red: 0.4509803921568628, green: 0.4588235294117647, blue: 0.4745098039215686, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Regular", size: 14)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/input[disabled]/title") {
                    return [
                            .textColor(UIColor(red: 0.4509803921568628, green: 0.4588235294117647, blue: 0.4745098039215686, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 17)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/input[error]/body") {
                    return [
                            .textColor(UIColor(red: 0.6941176470588235, green: 0.6941176470588235, blue: 0.6941176470588235, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 12)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/input[error]/divider/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.9686274509803922, green: 0, blue: 0, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/input[error]/title") {
                    return [
                            .textColor(UIColor(red: 0.9686274509803922, green: 0, blue: 0, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 17)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/input[radio-box-disabled]/badge/title") {
                    return [
                            .textColor(UIColor(red: 0.4274509803921568, green: 0.4274509803921568, blue: 0.4274509803921568, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 15)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/input[radio-box-disabled]/subtitle") {
                    return [
                            .textColor(UIColor(red: 0.4274509803921568, green: 0.4274509803921568, blue: 0.4274509803921568, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 15)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/input[radio-box-disabled]/title") {
                    return [
                            .textColor(UIColor(red: 0.4274509803921568, green: 0.4274509803921568, blue: 0.4274509803921568, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 17)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/input[radio-box-preview-disabled]/badge/title") {
                    return [
                            .textColor(UIColor(red: 0.4274509803921568, green: 0.4274509803921568, blue: 0.4274509803921568, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 15)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/input[radio-box-preview-disabled]/subtitle") {
                    return [
                            .textColor(UIColor(red: 0.4274509803921568, green: 0.4274509803921568, blue: 0.4274509803921568, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 15)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/input[radio-box-preview-disabled]/title") {
                    return [
                            .textColor(UIColor(red: 0.4274509803921568, green: 0.4274509803921568, blue: 0.4274509803921568, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 17)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/input[radio-box]/body") {
                    return [
                            .textColor(UIColor(red: 0.6941176470588235, green: 0.6941176470588235, blue: 0.6941176470588235, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 15)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/input[warning]/divider/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 0.6473214285714286, blue: 0, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/list-row/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.2196078431372549, green: 0.2196078431372549, blue: 0.2196078431372549, alpha: 0))
                    ]
                }
                container.addProperty(identifier: "@dark/list-row/body") {
                    return [
                            .textColor(UIColor(red: 0.5490196078431373, green: 0.5490196078431373, blue: 0.5490196078431373, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 16)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/list-row/divider/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.1568627450980392, green: 0.1568627450980392, blue: 0.1568627450980392, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/list-row/title") {
                    return [
                            .textColor(UIColor(red: 0.7372549019607844, green: 0.7372549019607844, blue: 0.7372549019607844, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 18)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/list-row[double-edit]/body") {
                    return [
                            .textColor(UIColor(red: 0.5490196078431373, green: 0.5490196078431373, blue: 0.5490196078431373, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 16)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/list-row[highlighted]/title") {
                    return [
                            .textColor(UIColor(red: 0.9921568627450981, green: 0, blue: 0, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 18)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/list-row[stacked]/body") {
                    return [
                            .textColor(UIColor(red: 0.5490196078431373, green: 0.5490196078431373, blue: 0.5490196078431373, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 16)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/list-row[task-completed]/body") {
                    return [
                            .textColor(UIColor(red: 0.4431372549019608, green: 0.4431372549019608, blue: 0.4431372549019608, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 16)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/list-row[task-completed]/title") {
                    return [
                            .textColor(UIColor(red: 0.4431372549019608, green: 0.4431372549019608, blue: 0.4431372549019608, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 18)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/list-row[task]/title") {
                    return [
                            .textColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 18)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/list/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.2196078431372549, green: 0.2196078431372549, blue: 0.2196078431372549, alpha: 0))
                    ]
                }
                container.addProperty(identifier: "@dark/list/divider/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.1568627450980392, green: 0.1568627450980392, blue: 0.1568627450980392, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/login/status-bar/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/login/subtitle") {
                    return [
                            .textColor(UIColor(red: 0.6941176470588235, green: 0.6941176470588235, blue: 0.6941176470588235, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Regular", size: 14)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/login/title") {
                    return [
                            .textColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Regular", size: 18)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/login[keycloak]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.07058823529411765, green: 0.07058823529411765, blue: 0.07058823529411765, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/message-view/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.07058823529411765, green: 0.07058823529411765, blue: 0.07058823529411765, alpha: 0))
                    ]
                }
                container.addProperty(identifier: "@dark/message-view/subtitle") {
                    return [
                            .textColor(UIColor(red: 0.6941176470588235, green: 0.6941176470588235, blue: 0.6941176470588235, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 15)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/message-view/title") {
                    return [
                            .textColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 16)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/modal/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.06042201071977615, green: 0.06042201071977615, blue: 0.06042201071977615, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/modal/button-icon-left/title") {
                    return [
                            .textColor(UIColor(red: 0, green: 0.6431372549019607, blue: 1, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Medium", size: 17)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/modal/button-icon-right/title") {
                    return [
                            .textColor(UIColor(red: 0, green: 0.6431372549019607, blue: 1, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Medium", size: 17)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/modal/heading/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.05882352941176471, green: 0.05882352941176471, blue: 0.05882352941176471, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/modal/navbar/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.2184103260869565, green: 0.2184103260869565, blue: 0.2184103260869565, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/modal/navbar/button-icon-left/title") {
                    return [
                            .textColor(UIColor(red: 0, green: 0.6431372549019607, blue: 1, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Medium", size: 17)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/modal/navbar/button-icon-right/title") {
                    return [
                            .textColor(UIColor(red: 0, green: 0.6431372549019607, blue: 1, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Medium", size: 17)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/modal/navbar/button-icon-right[disabled]/title") {
                    return [
                            .textColor(UIColor(red: 0.4274509803921568, green: 0.4274509803921568, blue: 0.4274509803921568, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Medium", size: 17)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/modal/navbar/divider/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.2196078431372549, green: 0.2196078431372549, blue: 0.2196078431372549, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/modal/navbar/title") {
                    return [
                            .textColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 18)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/modal/search[highlighted]/title") {
                    return [
                            .textColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Regular", size: 16)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/modal/searchbar/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.2196078431372549, green: 0.2196078431372549, blue: 0.2196078431372549, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/modal/searchbar/divider/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.2196078431372549, green: 0.2196078431372549, blue: 0.2196078431372549, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/modal/searchbar/search/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.1383605072463768, green: 0.1383605072463768, blue: 0.1383605072463768, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/modal/subtitle") {
                    return [
                            .textColor(UIColor(red: 0.6941176470588235, green: 0.6941176470588235, blue: 0.6941176470588235, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 14)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/modal/title") {
                    return [
                            .textColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 16)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/modal[tray]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.2184103260869565, green: 0.2184103260869565, blue: 0.2184103260869565, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/modal[tray]/navbar/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.2184103260869565, green: 0.2184103260869565, blue: 0.2184103260869565, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/modal[tray]/navbar/divider/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.2196078431372549, green: 0.2196078431372549, blue: 0.2196078431372549, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/modal[tray]/navbar/title") {
                    return [
                            .textColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 18)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/navbar-profile/background") {
                    return [
                            .backgroundColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/navbar-profile/block/background") {
                    return [
                            .backgroundColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/navbar-profile/block/subtitle") {
                    return [
                            .textColor(UIColor(red: 0.6941176470588235, green: 0.6941176470588235, blue: 0.6941176470588235, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Medium", size: 10)!),
                            .textCase(.uppercase),
                            .kerning(-0.1)
                    ]
                }
                container.addProperty(identifier: "@dark/navbar-profile/button-tertiary/background") {
                    return [
                            .backgroundColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/navbar-profile/divider/background") {
                    return [
                            .backgroundColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/navbar-profile/info/title") {
                    return [
                            .textColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 16)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/navbar/background") {
                    return [
                            .backgroundColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/navbar/button-icon-right[disabled]/title") {
                    return [
                            .textColor(UIColor(red: 0.4262907608695652, green: 0.4262907608695652, blue: 0.4262907608695652, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Medium", size: 17)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/navbar/divider/background") {
                    return [
                            .backgroundColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/navbar/overlay") {
                    return [
                            .backgroundColor(UIColor(red: 0, green: 0, blue: 0, alpha: 0.60098))
                    ]
                }
                container.addProperty(identifier: "@dark/navbar[image-search]/searchbar/search/background") {
                    return [
                            .backgroundColor(UIColor(red: 0, green: 0, blue: 0, alpha: 0.25))
                    ]
                }
                container.addProperty(identifier: "@dark/navbar[image]/searchbar/search/background") {
                    return [
                            .backgroundColor(UIColor(red: 0, green: 0, blue: 0, alpha: 0.25))
                    ]
                }
                container.addProperty(identifier: "@dark/note-instructions/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.1764705882352941, green: 0.1764705882352941, blue: 0.1764705882352941, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/note-instructions/body") {
                    return [
                            .textColor(UIColor(red: 0.6941176470588235, green: 0.6941176470588235, blue: 0.6941176470588235, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 14)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/note-instructions/subtitle") {
                    return [
                            .textColor(UIColor(red: 0.6941176470588235, green: 0.6941176470588235, blue: 0.6941176470588235, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 14)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/note-instructions/title") {
                    return [
                            .textColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 16)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/note-instructions[alert]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.2431372549019608, green: 0.0196078431372549, blue: 0.0196078431372549, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/note-instructions[alert]/title") {
                    return [
                            .textColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 16)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/note/body") {
                    return [
                            .textColor(UIColor(red: 0.6941176470588235, green: 0.6941176470588235, blue: 0.6941176470588235, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 15)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/note/progress-item[disabled]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.1450980392156863, green: 0.1450980392156863, blue: 0.1450980392156863, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/note/subtitle") {
                    return [
                            .textColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Medium", size: 15)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/note/title") {
                    return [
                            .textColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 15)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/note[alert]/body") {
                    return [
                            .textColor(UIColor(red: 0.9568627450980391, green: 0.02745098039215686, blue: 0.02745098039215686, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 15)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/note[alert]/title") {
                    return [
                            .textColor(UIColor(red: 0.9568627450980391, green: 0.02745098039215686, blue: 0.02745098039215686, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 14)!),
                            .textCase(.uppercase),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/note[status]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.1764705882352941, green: 0.1764705882352941, blue: 0.1764705882352941, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/notification/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.07058823529411765, green: 0.07058823529411765, blue: 0.07058823529411765, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/notification/body") {
                    return [
                            .textColor(UIColor(red: 0.6941176470588235, green: 0.6941176470588235, blue: 0.6941176470588235, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 12)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/notification/info[label]/subtitle") {
                    return [
                            .textColor(UIColor(red: 0.6941176470588235, green: 0.6941176470588235, blue: 0.6941176470588235, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 13)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/notification/info[label]/title") {
                    return [
                            .textColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 13)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/notification/subtitle") {
                    return [
                            .textColor(UIColor(red: 0.6941176470588235, green: 0.6941176470588235, blue: 0.6941176470588235, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 13)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/notification/title") {
                    return [
                            .textColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 15)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/notification/underlay") {
                    return [
                            .backgroundColor(UIColor(red: 0, green: 0.6431372549019607, blue: 1, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/notification[read]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.07058823529411765, green: 0.07058823529411765, blue: 0.07058823529411765, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/notification[swipe]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.1764705882352941, green: 0.1764705882352941, blue: 0.1764705882352941, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/notification[unread]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.1764705882352941, green: 0.1764705882352941, blue: 0.1764705882352941, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/overlay") {
                    return [
                            .backgroundColor(UIColor(red: 0, green: 0, blue: 0, alpha: 0.3))
                    ]
                }
                container.addProperty(identifier: "@dark/product/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.07058823529411765, green: 0.07058823529411765, blue: 0.07058823529411765, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/product/body") {
                    return [
                            .textColor(UIColor(red: 0.6941176470588235, green: 0.6941176470588235, blue: 0.6941176470588235, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 15)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/product/subtitle") {
                    return [
                            .textColor(UIColor(red: 0.6941176470588235, green: 0.6941176470588235, blue: 0.6941176470588235, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 10)!),
                            .textCase(.uppercase),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/product/tag-primary/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.1764705882352941, green: 0.1764705882352941, blue: 0.1764705882352941, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/product/tag-primary/title") {
                    return [
                            .textColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 12)!),
                            .textCase(.uppercase),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/product/tag-primary[highlighted]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.3668478260869565, green: 0.08912556750397668, blue: 0.08912556750397668, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/product/tag-primary[highlighted]/title") {
                    return [
                            .textColor(UIColor(red: 0.9686274509803922, green: 0, blue: 0, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 12)!),
                            .textCase(.uppercase),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/product/tag-secondary/background") {
                    return [
                            .backgroundColor(UIColor(red: 0, green: 0, blue: 0, alpha: 0))
                    ]
                }
                container.addProperty(identifier: "@dark/product/tag-secondary/title") {
                    return [
                            .textColor(UIColor(red: 0.6941176470588235, green: 0.6941176470588235, blue: 0.6941176470588235, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 12)!),
                            .textCase(.uppercase),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/product/title") {
                    return [
                            .textColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 17)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/product[group-swipe]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.1764705882352941, green: 0.1764705882352941, blue: 0.1764705882352941, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/product[group-swipe]/button-tertiary/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.1764705882352941, green: 0.1764705882352941, blue: 0.1764705882352941, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/product[group]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.1764705882352941, green: 0.1764705882352941, blue: 0.1764705882352941, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/product[group]/button-tertiary/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.1764705882352941, green: 0.1764705882352941, blue: 0.1764705882352941, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/product[info]/button-tertiary/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.07058823529411765, green: 0.07058823529411765, blue: 0.07058823529411765, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/product[info]/button-tertiary/title") {
                    return [
                            .textColor(UIColor(red: 0.6941176470588235, green: 0.6941176470588235, blue: 0.6941176470588235, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 10)!),
                            .textCase(.uppercase),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/product[info]/title") {
                    return [
                            .textColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 24)!),
                            .textCase(.none),
                            .kerning(0.2666666666666667)
                    ]
                }
                container.addProperty(identifier: "@dark/product[item]/title") {
                    return [
                            .textColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 15)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/product[row-swipe]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.1759227807971014, green: 0.1759227807971014, blue: 0.1759227807971014, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/product[row]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.1759227807971014, green: 0.1759227807971014, blue: 0.1759227807971014, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/product[row]/tag-primary/background") {
                    return [
                            .backgroundColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/product[row]/tag-primary[highlighted]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.4005604619565217, green: 0.04581104978397569, blue: 0.04581104978397569, alpha: 1)),
                            .backgroundColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/products/client-row/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.07058823529411765, green: 0.07058823529411765, blue: 0.07058823529411765, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/products/list-row/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.07058823529411765, green: 0.07058823529411765, blue: 0.07058823529411765, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/products/list/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.07058823529411765, green: 0.07058823529411765, blue: 0.07058823529411765, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/progress-item/background") {
                    return [
                            .backgroundColor(UIColor(red: 0, green: 0.6431372549019607, blue: 1, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/progress-item[disabled]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.2745098039215687, green: 0.2745098039215687, blue: 0.2745098039215687, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/pulldown-item/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.1764705882352941, green: 0.1764705882352941, blue: 0.1764705882352941, alpha: 0))
                    ]
                }
                container.addProperty(identifier: "@dark/pulldown-item/divider/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.3230015851449275, green: 0.3230015851449275, blue: 0.3230015851449275, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/pulldown-item/title") {
                    return [
                            .textColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 17)!),
                            .textCase(.none),
                            .kerning(0.2125)
                    ]
                }
                container.addProperty(identifier: "@dark/pulldown-item[alert]/title") {
                    return [
                            .textColor(UIColor(red: 0.9686274509803922, green: 0, blue: 0, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 17)!),
                            .textCase(.none),
                            .kerning(0.2125)
                    ]
                }
                container.addProperty(identifier: "@dark/pulldown-item[disabled]/title") {
                    return [
                            .textColor(UIColor(red: 0.4, green: 0.4, blue: 0.4, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 17)!),
                            .textCase(.none),
                            .kerning(0.2125)
                    ]
                }
                container.addProperty(identifier: "@dark/pulldown/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.07058823529411765, green: 0.07058823529411765, blue: 0.07058823529411765, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/qr-code/background") {
                    return [
                            .backgroundColor(UIColor(red: 0, green: 0, blue: 0, alpha: 0))
                    ]
                }
                container.addProperty(identifier: "@dark/qr-code/overlay") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/rating-details/body") {
                    return [
                            .textColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Medium", size: 15)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/rating-details/button-tertiary/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.07058823529411765, green: 0.07058823529411765, blue: 0.07058823529411765, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/rating-details/progress-item[disabled]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.1459182518115942, green: 0.1439052027584007, blue: 0.1439052027584007, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/rating-details/subtitle") {
                    return [
                            .textColor(UIColor(red: 0.6941176470588235, green: 0.6941176470588235, blue: 0.6941176470588235, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Regular", size: 12)!),
                            .textCase(.uppercase),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/rating-details/title") {
                    return [
                            .textColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 28)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/search/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.192156862745098, green: 0.192156862745098, blue: 0.192156862745098, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/search/title") {
                    return [
                            .textColor(UIColor(red: 0.7058823529411764, green: 0.7058823529411764, blue: 0.7058823529411764, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 16)!),
                            .textCase(.none)
                    ]
                }
                container.addProperty(identifier: "@dark/search[highlighted]/title") {
                    return [
                            .textColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 16)!),
                            .textCase(.none)
                    ]
                }
                container.addProperty(identifier: "@dark/searchbar/background") {
                    return [
                            .backgroundColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/searchbar/divider/background") {
                    return [
                            .backgroundColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/signature/button-tertiary/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.07058823529411765, green: 0.07058823529411765, blue: 0.07058823529411765, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/signature[disabled]/subtitle") {
                    return [
                            .textColor(UIColor(red: 0.4509803921568628, green: 0.4588235294117647, blue: 0.4745098039215686, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 14)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/spinner/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/stat-item/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.1764705882352941, green: 0.1764705882352941, blue: 0.1764705882352941, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/stat-item/subtitle") {
                    return [
                            .textColor(UIColor(red: 0.6941176470588235, green: 0.6941176470588235, blue: 0.6941176470588235, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 12)!),
                            .textCase(.none)
                    ]
                }
                container.addProperty(identifier: "@dark/stat-item/title") {
                    return [
                            .textColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Medium", size: 13)!),
                            .textCase(.none)
                    ]
                }
                container.addProperty(identifier: "@dark/stepper/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.203921568627451, green: 0.203921568627451, blue: 0.203921568627451, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/subtitle") {
                    return [
                            .textColor(UIColor(red: 0.6463994565217391, green: 0.6463994565217391, blue: 0.6463994565217391, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 14)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/tabbar/background") {
                    return [
                            .backgroundColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/tabbar/divider/background") {
                    return [
                            .backgroundColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/tabswitch/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.07058823529411765, green: 0.07058823529411765, blue: 0.07058823529411765, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/tag-primary-icon/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/tag-primary/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/tag-primary/title") {
                    return [
                            .textColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Medium", size: 11)!),
                            .textCase(.uppercase),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/tag-secondary/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.3393342391304348, green: 0.3393342391304348, blue: 0.3393342391304348, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/tag-secondary/title") {
                    return [
                            .textColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Medium", size: 11)!),
                            .textCase(.uppercase),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/tag-secondary[add]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.2729257804227005, green: 0.6959918478260869, blue: 0.03436261120830849, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/tag-secondary[add]/title") {
                    return [
                            .textColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Medium", size: 11)!),
                            .textCase(.uppercase),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/tag-secondary[alert]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.2431372549019608, green: 0.0196078431372549, blue: 0.0196078431372549, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/tag-secondary[alert]/title") {
                    return [
                            .textColor(UIColor(red: 0.9686274509803922, green: 0, blue: 0, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Medium", size: 11)!),
                            .textCase(.uppercase),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/tag-secondary[appointments]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.07058823529411765, green: 0.07058823529411765, blue: 0.07058823529411765, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/tag-secondary[appointments]/title") {
                    return [
                            .textColor(UIColor(red: 1, green: 0.5086865011415524, blue: 0.5086865011415524, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Medium", size: 11)!),
                            .textCase(.uppercase),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/tag-secondary[consultation]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.07058823529411765, green: 0.07058823529411765, blue: 0.07058823529411765, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/tag-secondary[consultation]/title") {
                    return [
                            .textColor(UIColor(red: 0.2729257804227005, green: 0.6959918478260869, blue: 0.03436261120830849, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Medium", size: 11)!),
                            .textCase(.uppercase),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/tag-secondary[delete]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.8169157608695652, green: 0.0360635435957508, blue: 0.0360635435957508, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/tag-secondary[delete]/title") {
                    return [
                            .textColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Medium", size: 11)!),
                            .textCase(.uppercase),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/tag-secondary[important]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.07058823529411765, green: 0.07058823529411765, blue: 0.07058823529411765, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/tag-secondary[important]/title") {
                    return [
                            .textColor(UIColor(red: 0.8937103713768116, green: 0.6972346082244861, blue: 0.02075504608184591, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Medium", size: 11)!),
                            .textCase(.uppercase),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/tag-secondary[newsletter]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.07058823529411765, green: 0.07058823529411765, blue: 0.07058823529411765, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/tag-secondary[newsletter]/title") {
                    return [
                            .textColor(UIColor(red: 0.7487076436673799, green: 0.03147800029779631, blue: 0.782608695652174, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Medium", size: 11)!),
                            .textCase(.uppercase),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/tag-secondary[outreaches]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.07058823529411765, green: 0.07058823529411765, blue: 0.07058823529411765, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/tag-secondary[outreaches]/title") {
                    return [
                            .textColor(UIColor(red: 0.1586224422993804, green: 0.371509796754635, blue: 0.8871716485507246, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Medium", size: 11)!),
                            .textCase(.uppercase),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/tag-secondary[transactions]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.07058823529411765, green: 0.07058823529411765, blue: 0.07058823529411765, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/tag-secondary[transactions]/title") {
                    return [
                            .textColor(UIColor(red: 0.8169157608695652, green: 0.03606354359575079, blue: 0.03606354359575079, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Medium", size: 11)!),
                            .textCase(.uppercase),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/tag-secondary[update]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.1586224422993804, green: 0.371509796754635, blue: 0.8871716485507246, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/tag-secondary[update]/title") {
                    return [
                            .textColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Medium", size: 11)!),
                            .textCase(.uppercase),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/tag-status/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.07058823529411765, green: 0.07058823529411765, blue: 0.07058823529411765, alpha: 0.95))
                    ]
                }
                container.addProperty(identifier: "@dark/tag-status/title") {
                    return [
                            .textColor(UIColor(red: 0.6941176470588235, green: 0.6941176470588235, blue: 0.6941176470588235, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Medium", size: 11)!),
                            .textCase(.uppercase),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/tag-status[expired]/indicator/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.6941176470588235, green: 0.6941176470588235, blue: 0.6941176470588235, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/tasks/block[icon-selected]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.1764705882352941, green: 0.1764705882352941, blue: 0.1764705882352941, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/tasks/block[icon]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.07058823529411765, green: 0.07058823529411765, blue: 0.07058823529411765, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/tile/info/title") {
                    return [
                            .textColor(UIColor(red: 0.6470588235294118, green: 0.6470588235294118, blue: 0.6470588235294118, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Regular", size: 14)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/tile/subtitle") {
                    return [
                            .textColor(UIColor(red: 0.6470588235294118, green: 0.6470588235294118, blue: 0.6470588235294118, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Regular", size: 14)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/tile/tag-primary-icon/background") {
                    return [
                            .backgroundColor(UIColor(red: 0, green: 0, blue: 0, alpha: 0.9))
                    ]
                }
                container.addProperty(identifier: "@dark/tile/title") {
                    return [
                            .textColor(UIColor(red: 0.7372549019607844, green: 0.7372549019607844, blue: 0.7372549019607844, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 15)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/time-picker/underlay") {
                    return [
                            .backgroundColor(UIColor(red: 0.1662420742753623, green: 0.1662420742753623, blue: 0.1662420742753623, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/timeline-actions/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.2308084239130435, green: 0.2308084239130435, blue: 0.2308084239130435, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/timeline-actions/button-tertiary/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.07058823529411765, green: 0.07058823529411765, blue: 0.07058823529411765, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/timeline-actions/title") {
                    return [
                            .textColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 13)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/timeline-date/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.07058823529411765, green: 0.07058823529411765, blue: 0.07058823529411765, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/timeline-date/subtitle") {
                    return [
                            .textColor(UIColor(red: 0.6941176470588235, green: 0.6941176470588235, blue: 0.6941176470588235, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Regular", size: 10)!),
                            .textCase(.uppercase),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/timeline-date/title") {
                    return [
                            .textColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Regular", size: 22)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/timeline-heading/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0))
                    ]
                }
                container.addProperty(identifier: "@dark/timeline-heading/title") {
                    return [
                            .textColor(UIColor(red: 0.6941176470588235, green: 0.6941176470588235, blue: 0.6941176470588235, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 12)!),
                            .textCase(.uppercase),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/timeline-icon/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.07058823529411765, green: 0.07058823529411765, blue: 0.07058823529411765, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/timeline-row/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.1759227807971014, green: 0.1759227807971014, blue: 0.1759227807971014, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/timeline-row/info/subtitle") {
                    return [
                            .textColor(UIColor(red: 0.6470588235294118, green: 0.6470588235294118, blue: 0.6470588235294118, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 13)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/timeline-row/info/title") {
                    return [
                            .textColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 13)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/timeline-row/subtitle") {
                    return [
                            .textColor(UIColor(red: 0.6470588235294118, green: 0.6470588235294118, blue: 0.6470588235294118, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 13)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/timeline-row/tag-primary/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.6941176470588235, green: 0.6941176470588235, blue: 0.6941176470588235, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/timeline-row/tag-status/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.07058823529411765, green: 0.07058823529411765, blue: 0.07058823529411765, alpha: 0.95))
                    ]
                }
                container.addProperty(identifier: "@dark/timeline-row/title") {
                    return [
                            .textColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 17)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/timeline-row[future]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.07058823529411765, green: 0.07058823529411765, blue: 0.07058823529411765, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/timeline-row[highlighted]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0, green: 0.152444318518325, blue: 0.2444236865942029, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/timeline-row[highlighted]/timeline-actions/background") {
                    return [
                            .backgroundColor(UIColor(red: 0, green: 0.2033767862572211, blue: 0.3260869565217391, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/title") {
                    return [
                            .textColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Regular", size: 18)!),
                            .textCase(.uppercase),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/toast/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.07058823529411765, green: 0.07058823529411765, blue: 0.07058823529411765, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/toast/title") {
                    return [
                            .textColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 16)!),
                            .textCase(.none),
                            .kerning(0.15)
                    ]
                }
                container.addProperty(identifier: "@dark/toast[fail]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.1568627450980392, green: 0.06666666666666668, blue: 0.06666666666666668, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/toast[fail]/title") {
                    return [
                            .textColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 16)!),
                            .textCase(.none),
                            .kerning(0.15)
                    ]
                }
                container.addProperty(identifier: "@dark/toast[success]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.1176470588235294, green: 0.1450980392156863, blue: 0.06274509803921567, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/toast[success]/title") {
                    return [
                            .textColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 16)!),
                            .textCase(.none),
                            .kerning(0.15)
                    ]
                }
                container.addProperty(identifier: "@dark/toggle/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.5686274509803921, green: 0.8431372549019608, blue: 0.02352941176470588, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/toggle[off]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.2196078431372549, green: 0.2196078431372549, blue: 0.2196078431372549, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/toolbar/background") {
                    return [
                            .backgroundColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/toolbar/button-icon-left/title") {
                    return [
                            .textColor(UIColor(red: 0, green: 0.6431372549019607, blue: 1, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Medium", size: 17)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/toolbar/button-icon-right/title") {
                    return [
                            .textColor(UIColor(red: 0.6941176470588235, green: 0.6941176470588235, blue: 0.6941176470588235, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Medium", size: 17)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/toolbar/title") {
                    return [
                            .textColor(UIColor(red: 0.6941176470588235, green: 0.6941176470588235, blue: 0.6941176470588235, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Medium", size: 14)!),
                            .textCase(.uppercase),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/toolbar[search]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.2196078431372549, green: 0.2196078431372549, blue: 0.2196078431372549, alpha: 0))
                    ]
                }
                container.addProperty(identifier: "@dark/toolbar[tabs]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.2196078431372549, green: 0.2196078431372549, blue: 0.2196078431372549, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/totals/info/title") {
                    return [
                            .textColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 15)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/totals/info[label-highlighted]/title") {
                    return [
                            .textColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Semibold", size: 15)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/transaction-details/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.07058823529411765, green: 0.07058823529411765, blue: 0.07058823529411765, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/transaction-details/body") {
                    return [
                            .textColor(UIColor(red: 0.6941176470588235, green: 0.6941176470588235, blue: 0.6941176470588235, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Regular", size: 16)!),
                            .textCase(.none),
                            .kerning(0.2133333333333333)
                    ]
                }
                container.addProperty(identifier: "@dark/transaction-details/button-tertiary/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.07058823529411765, green: 0.07058823529411765, blue: 0.07058823529411765, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/transaction-details/divider/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.07058823529411765, green: 0.07058823529411765, blue: 0.07058823529411765, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/transaction-details/subtitle") {
                    return [
                            .textColor(UIColor(red: 0.6941176470588235, green: 0.6941176470588235, blue: 0.6941176470588235, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Regular", size: 12)!),
                            .textCase(.uppercase),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/transaction-details/tag-status/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.07058823529411765, green: 0.07058823529411765, blue: 0.07058823529411765, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/transaction-details/title") {
                    return [
                            .textColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 28)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/tray/background") {
                    return [
                            .backgroundColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/tray/divider/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.1843137254901961, green: 0.1843137254901961, blue: 0.1843137254901961, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/tray/image/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.203921568627451, green: 0.203921568627451, blue: 0.203921568627451, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/tray/title") {
                    return [
                            .textColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 15)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/widget/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.1764705882352941, green: 0.1764705882352941, blue: 0.1764705882352941, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/widget/button-tertiary/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.1764705882352941, green: 0.1764705882352941, blue: 0.1764705882352941, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/widget/button-tertiary/title") {
                    return [
                            .textColor(UIColor(red: 0, green: 0.6431372549019607, blue: 1, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Medium", size: 12)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/widget/divider/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.2752490942028986, green: 0.2752490942028986, blue: 0.2752490942028986, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/widget/info/title") {
                    return [
                            .textColor(UIColor(red: 0.6941176470588235, green: 0.6941176470588235, blue: 0.6941176470588235, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 14)!),
                            .textCase(.none),
                            .kerning(-0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/widget/list-row/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.1764705882352941, green: 0.1764705882352941, blue: 0.1764705882352941, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/widget/list-row[task-completed]/title") {
                    return [
                            .textColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 14)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/widget/list-row[task]/body") {
                    return [
                            .textColor(UIColor(red: 0.6941176470588235, green: 0.6941176470588235, blue: 0.6941176470588235, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 13)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/widget/list-row[task]/title") {
                    return [
                            .textColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 14)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/widget/progress-item[disabled]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.07058823529411765, green: 0.07058823529411765, blue: 0.07058823529411765, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "@dark/widget/subtitle") {
                    return [
                            .textColor(UIColor(red: 0.6470588235294118, green: 0.6470588235294118, blue: 0.6470588235294118, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 14)!),
                            .textCase(.none),
                            .kerning(-0.2)
                    ]
                }
                container.addProperty(identifier: "@dark/widget/title") {
                    return [
                            .textColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 20)!),
                            .textCase(.none),
                            .kerning(-0.2)
                    ]
                }
                container.addProperty(identifier: "accordion/body") {
                    return [
                            .textColor(UIColor(red: 0.387256532907486, green: 0.399604320526123, blue: 0.4638417959213257, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 15)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "accordion/title") {
                    return [
                            .textColor(UIColor(red: 0.1254901960784314, green: 0.1450980392156863, blue: 0.2313725490196079, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 15)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "alert/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "alert/list-row/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "alert/list-row/divider/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "alert/list-row/title") {
                    return [
                            .textColor(UIColor(red: 0.387256532907486, green: 0.399604320526123, blue: 0.4638417959213257, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 14)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "alert/subtitle") {
                    return [
                            .textColor(UIColor(red: 0.387256532907486, green: 0.399604320526123, blue: 0.4638417959213257, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 14)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "alert/title") {
                    return [
                            .textColor(UIColor(red: 0.1235505566000938, green: 0.1434680819511414, blue: 0.2327242195606232, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 16)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "assets/accordion/title") {
                    return [
                            .textColor(UIColor(red: 0.0392156862745098, green: 0.08235294117647059, blue: 0.196078431372549, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 19)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "assets/block/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "attributes/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "attributes/tag-status/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0.95))
                    ]
                }
                container.addProperty(identifier: "attributes/title") {
                    return [
                            .textColor(UIColor(red: 0.1235505566000938, green: 0.1434680819511414, blue: 0.2327242195606232, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 17)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "badge/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.2416911423206329, green: 0.3955334424972533, blue: 0.8134821057319641, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "badge/title") {
                    return [
                            .textColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 11)!),
                            .textCase(.uppercase),
                            .kerning(-0.4999999999999999)
                    ]
                }
                container.addProperty(identifier: "banners/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.8661045432090758, green: 0.921637237071991, blue: 0.9998796582221985, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "banners/divider/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.8661045432090758, green: 0.921637237071991, blue: 0.9998796582221985, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "banners/title") {
                    return [
                            .textColor(UIColor(red: 0.1254901960784314, green: 0.1450980392156863, blue: 0.2313725490196079, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 15)!),
                            .textCase(.none),
                            .kerning(0.1)
                    ]
                }
                container.addProperty(identifier: "banners[alert]/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 0.9176470588235294, blue: 0.9176470588235294, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "banners[alert]/divider[full]/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 0.9176470588235294, blue: 0.9176470588235294, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "banners[alert]/title") {
                    return [
                            .textColor(UIColor(red: 0.7333333333333333, green: 0.04705882352941176, blue: 0.04705882352941176, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 15)!),
                            .textCase(.none),
                            .kerning(0.1)
                    ]
                }
                container.addProperty(identifier: "block-stats/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.9529411764705882, green: 0.9647058823529412, blue: 0.9764705882352941, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "block-stats/body") {
                    return [
                            .textColor(UIColor(red: 0.1235505566000938, green: 0.1434680819511414, blue: 0.2327242195606232, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Regular", size: 36)!),
                            .textCase(.none),
                            .kerning(-0.5)
                    ]
                }
                container.addProperty(identifier: "block-stats/subtitle") {
                    return [
                            .textColor(UIColor(red: 0.1235505566000938, green: 0.1434680819511414, blue: 0.2327242195606232, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Medium", size: 13)!),
                            .textCase(.none)
                    ]
                }
                container.addProperty(identifier: "block-stats/title") {
                    return [
                            .textColor(UIColor(red: 0.387256532907486, green: 0.399604320526123, blue: 0.4638417959213257, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 10)!),
                            .textCase(.uppercase),
                            .kerning(-0.1)
                    ]
                }
                container.addProperty(identifier: "block-stats[circle-wide]/body") {
                    return [
                            .textColor(UIColor(red: 0.1235505566000938, green: 0.1434680819511414, blue: 0.2327242195606232, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Regular", size: 34)!),
                            .textCase(.none),
                            .kerning(-0.5)
                    ]
                }
                container.addProperty(identifier: "block-stats[circle-wide]/subtitle") {
                    return [
                            .textColor(UIColor(red: 0.1235505566000938, green: 0.1434680819511414, blue: 0.2327242195606232, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Medium", size: 15)!),
                            .textCase(.none)
                    ]
                }
                container.addProperty(identifier: "block-stats[circle3-wide]/body") {
                    return [
                            .textColor(UIColor(red: 0.1235505566000938, green: 0.1434680819511414, blue: 0.2327242195606232, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 13)!),
                            .textCase(.none)
                    ]
                }
                container.addProperty(identifier: "block-stats[circle3-wide]/subtitle") {
                    return [
                            .textColor(UIColor(red: 0.1235505566000938, green: 0.1434680819511414, blue: 0.2327242195606232, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 13)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "block-stock/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "block-stock[selected]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.9529411764705882, green: 0.9529411764705882, blue: 0.9529411764705882, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "block/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "block/body") {
                    return [
                            .textColor(UIColor(red: 0.3882352941176471, green: 0.4, blue: 0.4627450980392157, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-DemiBold", size: 14)!),
                            .textCase(.none),
                            .kerning(-0.1)
                    ]
                }
                container.addProperty(identifier: "block/subtitle") {
                    return [
                            .textColor(UIColor(red: 0.387256532907486, green: 0.399604320526123, blue: 0.4638417959213257, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Medium", size: 10)!),
                            .textCase(.uppercase),
                            .kerning(-0.2)
                    ]
                }
                container.addProperty(identifier: "block/title") {
                    return [
                            .textColor(UIColor(red: 0.1254901960784314, green: 0.1450980392156863, blue: 0.2313725490196079, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-DemiBold", size: 20)!),
                            .textCase(.none),
                            .kerning(-0.2)
                    ]
                }
                container.addProperty(identifier: "block[10]/title") {
                    return [
                            .textColor(UIColor(red: 0.2647363887810559, green: 0.729110054347826, blue: 0, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-DemiBold", size: 20)!),
                            .textCase(.none),
                            .kerning(-0.2)
                    ]
                }
                container.addProperty(identifier: "block[1]/title") {
                    return [
                            .textColor(UIColor(red: 0.6909816576086957, green: 0, blue: 0, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-DemiBold", size: 20)!),
                            .textCase(.none),
                            .kerning(-0.2)
                    ]
                }
                container.addProperty(identifier: "block[2]/title") {
                    return [
                            .textColor(UIColor(red: 0.7686274509803921, green: 0.2156862745098039, blue: 0, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-DemiBold", size: 20)!),
                            .textCase(.none),
                            .kerning(-0.2)
                    ]
                }
                container.addProperty(identifier: "block[3]/title") {
                    return [
                            .textColor(UIColor(red: 0.8156862745098039, green: 0.3490196078431372, blue: 0, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-DemiBold", size: 20)!),
                            .textCase(.none),
                            .kerning(-0.2)
                    ]
                }
                container.addProperty(identifier: "block[4]/title") {
                    return [
                            .textColor(UIColor(red: 0.8705882352941177, green: 0.4980392156862745, blue: 0, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-DemiBold", size: 20)!),
                            .textCase(.none),
                            .kerning(-0.2)
                    ]
                }
                container.addProperty(identifier: "block[5]/title") {
                    return [
                            .textColor(UIColor(red: 0.8784313725490196, green: 0.5686274509803921, blue: 0, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-DemiBold", size: 20)!),
                            .textCase(.none),
                            .kerning(-0.2)
                    ]
                }
                container.addProperty(identifier: "block[6]/title") {
                    return [
                            .textColor(UIColor(red: 0.8823529411764706, green: 0.6313725490196078, blue: 0, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-DemiBold", size: 20)!),
                            .textCase(.none),
                            .kerning(-0.2)
                    ]
                }
                container.addProperty(identifier: "block[7]/title") {
                    return [
                            .textColor(UIColor(red: 0.8862745098039215, green: 0.6941176470588235, blue: 0, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-DemiBold", size: 20)!),
                            .textCase(.none),
                            .kerning(-0.2)
                    ]
                }
                container.addProperty(identifier: "block[8]/title") {
                    return [
                            .textColor(UIColor(red: 0.788235294117647, green: 0.7294117647058823, blue: 0, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-DemiBold", size: 20)!),
                            .textCase(.none),
                            .kerning(-0.2)
                    ]
                }
                container.addProperty(identifier: "block[9]/title") {
                    return [
                            .textColor(UIColor(red: 0.5764705882352941, green: 0.7294117647058823, blue: 0, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-DemiBold", size: 20)!),
                            .textCase(.none),
                            .kerning(-0.2)
                    ]
                }
                container.addProperty(identifier: "block[available-hide]/subtitle") {
                    return [
                            .textColor(UIColor(red: 0.387256532907486, green: 0.399604320526123, blue: 0.4638417959213257, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Medium", size: 10)!),
                            .textCase(.uppercase),
                            .kerning(-0.2)
                    ]
                }
                container.addProperty(identifier: "block[available]/subtitle") {
                    return [
                            .textColor(UIColor(red: 0.387256532907486, green: 0.399604320526123, blue: 0.4638417959213257, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Medium", size: 10)!),
                            .textCase(.uppercase),
                            .kerning(-0.2)
                    ]
                }
                container.addProperty(identifier: "block[available]/title") {
                    return [
                            .textColor(UIColor(red: 0.4156862745098039, green: 0.6039215686274509, blue: 0.04313725490196078, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 20)!),
                            .textCase(.none),
                            .kerning(0.1333333333333333)
                    ]
                }
                container.addProperty(identifier: "block[out-of-stock-hide]/subtitle") {
                    return [
                            .textColor(UIColor(red: 0.387256532907486, green: 0.399604320526123, blue: 0.4638417959213257, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Medium", size: 10)!),
                            .textCase(.uppercase),
                            .kerning(-0.2)
                    ]
                }
                container.addProperty(identifier: "block[out-of-stock]/subtitle") {
                    return [
                            .textColor(UIColor(red: 0.387256532907486, green: 0.399604320526123, blue: 0.4638417959213257, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Medium", size: 10)!),
                            .textCase(.uppercase),
                            .kerning(-0.2)
                    ]
                }
                container.addProperty(identifier: "block[out-of-stock]/title") {
                    return [
                            .textColor(UIColor(red: 0.7333333333333333, green: 0.04705882352941176, blue: 0.04705882352941176, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 20)!),
                            .textCase(.none),
                            .kerning(0.1333333333333333)
                    ]
                }
                container.addProperty(identifier: "body") {
                    return [
                            .textColor(UIColor(red: 0.6510528922080994, green: 0.6585400104522705, blue: 0.6951061487197876, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 14)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "button-action-row/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.9529411764705882, green: 0.9647058823529412, blue: 0.9764705882352941, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "button-action-row/subtitle") {
                    return [
                            .textColor(UIColor(red: 0.387256532907486, green: 0.399604320526123, blue: 0.4638417959213257, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 14)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "button-action-row/tag-secondary/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.9529411764705882, green: 0.9529411764705882, blue: 0.9529411764705882, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "button-action-row/tag-secondary/title") {
                    return [
                            .textColor(UIColor(red: 0.6510528922080994, green: 0.6585400104522705, blue: 0.6951061487197876, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 10)!),
                            .textCase(.uppercase),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "button-action-row/title") {
                    return [
                            .textColor(UIColor(red: 0.1235505566000938, green: 0.1434680819511414, blue: 0.2327242195606232, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 15)!),
                            .textCase(.none),
                            .kerning(0.1764705882352941)
                    ]
                }
                container.addProperty(identifier: "button-alert/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 0.9166539634146341, blue: 0.9166539634146341, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "button-alert/title") {
                    return [
                            .textColor(UIColor(red: 0.7333333333333333, green: 0.04705882352941176, blue: 0.04705882352941176, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 14)!),
                            .textCase(.uppercase),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "button-badge/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "button-badge/subtitle") {
                    return [
                            .textColor(UIColor(red: 0.387256532907486, green: 0.399604320526123, blue: 0.4638417959213257, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Medium", size: 10)!),
                            .textCase(.uppercase),
                            .kerning(-0.2)
                    ]
                }
                container.addProperty(identifier: "button-badge/title") {
                    return [
                            .textColor(UIColor(red: 0.1254901960784314, green: 0.1450980392156863, blue: 0.2313725490196079, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-DemiBold", size: 20)!),
                            .textCase(.none),
                            .kerning(-0.2)
                    ]
                }
                container.addProperty(identifier: "button-badge[selected]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.9529411764705882, green: 0.9647058823529412, blue: 0.9764705882352941, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "button-badge[selected]/subtitle") {
                    return [
                            .textColor(UIColor(red: 0.2416911423206329, green: 0.3955334424972533, blue: 0.8134821057319641, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Medium", size: 10)!),
                            .textCase(.uppercase),
                            .kerning(-0.2)
                    ]
                }
                container.addProperty(identifier: "button-badge[selected]/title") {
                    return [
                            .textColor(UIColor(red: 0.2416911423206329, green: 0.3955334424972533, blue: 0.8134821057319641, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-DemiBold", size: 20)!),
                            .textCase(.none),
                            .kerning(-0.2)
                    ]
                }
                container.addProperty(identifier: "button-filters-avatar/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.9146190881729126, green: 0.9147508144378662, blue: 0.9214738011360168, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "button-filters-avatar/badge/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0))
                    ]
                }
                container.addProperty(identifier: "button-filters-avatar/badge/title") {
                    return [
                            .textColor(UIColor(red: 0.4036762020452235, green: 0.4231074743449539, blue: 0.5086050724637681, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 12)!),
                            .textCase(.none)
                    ]
                }
                container.addProperty(identifier: "button-filters-avatar/overlay") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0))
                    ]
                }
                container.addProperty(identifier: "button-filters-avatar/subtitle") {
                    return [
                            .textColor(UIColor(red: 0.1235505566000938, green: 0.1434680819511414, blue: 0.2327242195606232, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-UltraLight", size: 28)!),
                            .textCase(.none)
                    ]
                }
                container.addProperty(identifier: "button-filters-avatar/title") {
                    return [
                            .textColor(UIColor(red: 0.1235505566000938, green: 0.1434680819511414, blue: 0.2327242195606232, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Regular", size: 14)!),
                            .textCase(.none),
                            .kerning(-0.2)
                    ]
                }
                container.addProperty(identifier: "button-filters-avatar[disabled]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.9146190881729126, green: 0.9147508144378662, blue: 0.9214738011360168, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "button-filters-avatar[disabled]/badge/title") {
                    return [
                            .textColor(UIColor(red: 0.6509803921568628, green: 0.6588235294117647, blue: 0.6941176470588235, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 12)!),
                            .textCase(.none)
                    ]
                }
                container.addProperty(identifier: "button-filters-avatar[disabled]/overlay") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0.6))
                    ]
                }
                container.addProperty(identifier: "button-filters-avatar[disabled]/title") {
                    return [
                            .textColor(UIColor(red: 0.6509803921568628, green: 0.6588235294117647, blue: 0.6941176470588235, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Regular", size: 14)!),
                            .textCase(.none),
                            .kerning(-0.2)
                    ]
                }
                container.addProperty(identifier: "button-filters-avatar[selected]/badge/title") {
                    return [
                            .textColor(UIColor(red: 0.2416911423206329, green: 0.3955334424972533, blue: 0.8134821057319641, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 12)!),
                            .textCase(.none)
                    ]
                }
                container.addProperty(identifier: "button-filters-avatar[selected]/title") {
                    return [
                            .textColor(UIColor(red: 0.2416911423206329, green: 0.3955334424972533, blue: 0.8134821057319641, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 14)!),
                            .textCase(.none),
                            .kerning(-0.2)
                    ]
                }
                container.addProperty(identifier: "button-filters-icon/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "button-filters-icon[selected]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.2416911423206329, green: 0.3955334424972533, blue: 0.8134821057319641, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "button-filters-multi/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "button-filters-multi/title") {
                    return [
                            .textColor(UIColor(red: 0.1235505566000938, green: 0.1434680819511414, blue: 0.2327242195606232, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 12)!),
                            .textCase(.none)
                    ]
                }
                container.addProperty(identifier: "button-filters-multi[disabled]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.9137254901960784, green: 0.9137254901960784, blue: 0.9215686274509803, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "button-filters-multi[disabled]/title") {
                    return [
                            .textColor(UIColor(red: 0.6509803921568628, green: 0.6588235294117647, blue: 0.6941176470588235, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 12)!),
                            .textCase(.none)
                    ]
                }
                container.addProperty(identifier: "button-filters-multi[selected]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.2416911423206329, green: 0.3955334424972533, blue: 0.8134821057319641, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "button-filters-multi[selected]/title") {
                    return [
                            .textColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 12)!),
                            .textCase(.none)
                    ]
                }
                container.addProperty(identifier: "button-filters/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "button-filters/badge/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0))
                    ]
                }
                container.addProperty(identifier: "button-filters/badge/title") {
                    return [
                            .textColor(UIColor(red: 0.4036762020452235, green: 0.4231074743449539, blue: 0.5086050724637681, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 12)!),
                            .textCase(.none)
                    ]
                }
                container.addProperty(identifier: "button-filters/info/title") {
                    return [
                            .textColor(UIColor(red: 0.1235505566000938, green: 0.1434680819511414, blue: 0.2327242195606232, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 12)!),
                            .textCase(.none)
                    ]
                }
                container.addProperty(identifier: "button-filters/title") {
                    return [
                            .textColor(UIColor(red: 0.1235505566000938, green: 0.1434680819511414, blue: 0.2327242195606232, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 12)!),
                            .textCase(.none)
                    ]
                }
                container.addProperty(identifier: "button-filters[disabled]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.9137254901960784, green: 0.9137254901960784, blue: 0.9215686274509803, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "button-filters[disabled]/badge/title") {
                    return [
                            .textColor(UIColor(red: 0.6509803921568628, green: 0.6588235294117647, blue: 0.6941176470588235, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 12)!),
                            .textCase(.none)
                    ]
                }
                container.addProperty(identifier: "button-filters[disabled]/info/title") {
                    return [
                            .textColor(UIColor(red: 0.6509803921568628, green: 0.6588235294117647, blue: 0.6941176470588235, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 12)!),
                            .textCase(.none)
                    ]
                }
                container.addProperty(identifier: "button-filters[disabled]/title") {
                    return [
                            .textColor(UIColor(red: 0.6509803921568628, green: 0.6588235294117647, blue: 0.6941176470588235, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 12)!),
                            .textCase(.none)
                    ]
                }
                container.addProperty(identifier: "button-filters[selected]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.2416911423206329, green: 0.3955334424972533, blue: 0.8134821057319641, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "button-filters[selected]/badge/title") {
                    return [
                            .textColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 12)!),
                            .textCase(.none)
                    ]
                }
                container.addProperty(identifier: "button-filters[selected]/info/title") {
                    return [
                            .textColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 12)!),
                            .textCase(.none)
                    ]
                }
                container.addProperty(identifier: "button-filters[selected]/title") {
                    return [
                            .textColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 12)!),
                            .textCase(.none)
                    ]
                }
                container.addProperty(identifier: "button-icon-center/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0))
                    ]
                }
                container.addProperty(identifier: "button-icon-center/title") {
                    return [
                            .textColor(UIColor(red: 0.2416911423206329, green: 0.3955334424972533, blue: 0.8134821057319641, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Medium", size: 12)!),
                            .textCase(.uppercase),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "button-icon-center[disabled]/title") {
                    return [
                            .textColor(UIColor(red: 0.6510528922080994, green: 0.6585400104522705, blue: 0.6951061487197876, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Medium", size: 12)!),
                            .textCase(.uppercase),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "button-icon-left/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0))
                    ]
                }
                container.addProperty(identifier: "button-icon-left/title") {
                    return [
                            .textColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Medium", size: 17)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "button-icon-right/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0))
                    ]
                }
                container.addProperty(identifier: "button-icon-right/badge/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.7333333333333333, green: 0.04705882352941176, blue: 0.04705882352941176, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "button-icon-right/title") {
                    return [
                            .textColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Medium", size: 17)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "button-icon-right[disabled]/title") {
                    return [
                            .textColor(UIColor(red: 0.387256532907486, green: 0.399604320526123, blue: 0.4638417959213257, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Medium", size: 17)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "button-primary/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.2416911423206329, green: 0.3955334424972533, blue: 0.8134821057319641, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "button-primary/title") {
                    return [
                            .textColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 14)!),
                            .textCase(.uppercase),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "button-primary[disabled]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.9693886637687682, green: 0.9797282814979553, blue: 0.9998810887336731, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "button-primary[disabled]/title") {
                    return [
                            .textColor(UIColor(red: 0.7768980606742527, green: 0.8267425039540166, blue: 0.9098165760869565, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 14)!),
                            .textCase(.uppercase),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "button-primary[highlighted]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.1434172987937927, green: 0.2145760655403137, blue: 0.6287633180618286, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "button-secondary/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.9693886637687682, green: 0.9797282814979553, blue: 0.9998810887336731, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "button-secondary/title") {
                    return [
                            .textColor(UIColor(red: 0.2416911423206329, green: 0.3955334424972533, blue: 0.8134821057319641, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 14)!),
                            .textCase(.uppercase)
                    ]
                }
                container.addProperty(identifier: "button-secondary[disabled]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.9693886637687682, green: 0.9797282814979553, blue: 0.9998810887336731, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "button-secondary[disabled]/title") {
                    return [
                            .textColor(UIColor(red: 0.7764705882352941, green: 0.8274509803921568, blue: 0.9098039215686274, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 14)!),
                            .textCase(.uppercase)
                    ]
                }
                container.addProperty(identifier: "button-secondary[highlighted]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.2416911423206329, green: 0.3955334424972533, blue: 0.8134821057319641, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "button-secondary[highlighted]/title") {
                    return [
                            .textColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 14)!),
                            .textCase(.uppercase)
                    ]
                }
                container.addProperty(identifier: "button-swipe/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.2431372549019608, green: 0.396078431372549, blue: 0.8117647058823529, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "button-swipe[alert]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.9686274509803922, green: 0, blue: 0, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "button-tabbar/badge/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.7333333333333333, green: 0.04705882352941176, blue: 0.04705882352941176, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "button-tabbar/title") {
                    return [
                            .textColor(UIColor(red: 0.2416911423206329, green: 0.3955334424972533, blue: 0.8134821057319641, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 13)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "button-tabbar[disabled]/title") {
                    return [
                            .textColor(UIColor(red: 0.6473574042320251, green: 0.6363203525543213, blue: 0.6063362956047058, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 13)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "button-tabs/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.9568627450980391, green: 0.9529411764705882, blue: 0.9529411764705882, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "button-tabs/divider/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.9137254901960784, green: 0.9137254901960784, blue: 0.9215686274509803, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "button-tabs/subtitle") {
                    return [
                            .textColor(UIColor(red: 0.387256532907486, green: 0.399604320526123, blue: 0.4638417959213257, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Medium", size: 10)!),
                            .textCase(.uppercase),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "button-tabs/title") {
                    return [
                            .textColor(UIColor(red: 0.1235505566000938, green: 0.1434680819511414, blue: 0.2327242195606232, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 20)!),
                            .textCase(.none),
                            .kerning(0.1333333333333333)
                    ]
                }
                container.addProperty(identifier: "button-tabs[selected]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.9568627450980391, green: 0.9529411764705882, blue: 0.9529411764705882, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "button-tabs[selected]/divider/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.2416911423206329, green: 0.3955334424972533, blue: 0.8134821057319641, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "button-tabs[selected]/subtitle") {
                    return [
                            .textColor(UIColor(red: 0.2416911423206329, green: 0.3955334424972533, blue: 0.8134821057319641, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Medium", size: 10)!),
                            .textCase(.uppercase),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "button-tabs[selected]/title") {
                    return [
                            .textColor(UIColor(red: 0.2416911423206329, green: 0.3955334424972533, blue: 0.8134821057319641, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 20)!),
                            .textCase(.none),
                            .kerning(0.1333333333333333)
                    ]
                }
                container.addProperty(identifier: "button-tabswitch/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "button-tabswitch/badge/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.7333333333333333, green: 0.04705882352941176, blue: 0.04705882352941176, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "button-tabswitch/title") {
                    return [
                            .textColor(UIColor(red: 0.0392156862745098, green: 0.0823529411764706, blue: 0.196078431372549, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 12)!),
                            .textCase(.none)
                    ]
                }
                container.addProperty(identifier: "button-tabswitch[selected]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.2416911423206329, green: 0.3955334424972533, blue: 0.8134821057319641, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "button-tabswitch[selected]/badge/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "button-tabswitch[selected]/badge/title") {
                    return [
                            .textColor(UIColor(red: 0.0392156862745098, green: 0.08235294117647059, blue: 0.196078431372549, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 10)!),
                            .textCase(.uppercase),
                            .kerning(-0.4545454545454545)
                    ]
                }
                container.addProperty(identifier: "button-tabswitch[selected]/title") {
                    return [
                            .textColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 12)!),
                            .textCase(.none)
                    ]
                }
                container.addProperty(identifier: "button-tertiary-center/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "button-tertiary-center/title") {
                    return [
                            .textColor(UIColor(red: 0.2416911423206329, green: 0.3955334424972533, blue: 0.8134821057319641, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Medium", size: 12)!),
                            .textCase(.uppercase),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "button-tertiary/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "button-tertiary/title") {
                    return [
                            .textColor(UIColor(red: 0.2416911423206329, green: 0.3955334424972533, blue: 0.8134821057319641, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Medium", size: 12)!),
                            .textCase(.uppercase),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "button-tertiary[disabled]/title") {
                    return [
                            .textColor(UIColor(red: 0.7764705882352941, green: 0.8274509803921568, blue: 0.9098039215686274, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Medium", size: 12)!),
                            .textCase(.uppercase),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "button-tertiary[error]/title") {
                    return [
                            .textColor(UIColor(red: 0.7333333333333333, green: 0.04705882352941176, blue: 0.04705882352941176, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Medium", size: 12)!),
                            .textCase(.uppercase),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "button-tertiary[focused]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.984313725490196, green: 1, blue: 0.9529411764705882, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "button-tertiary[focused]/title") {
                    return [
                            .textColor(UIColor(red: 0.4156862745098039, green: 0.6039215686274509, blue: 0.04313725490196076, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Medium", size: 12)!),
                            .textCase(.uppercase),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "button-tertiary[selected]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.2416911423206329, green: 0.3955334424972533, blue: 0.8134821057319641, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "button-tertiary[selected]/title") {
                    return [
                            .textColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Medium", size: 12)!),
                            .textCase(.uppercase),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "button-toolbar/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "button-toolbar/title") {
                    return [
                            .textColor(UIColor(red: 0.2416911423206329, green: 0.3955334424972533, blue: 0.8134821057319641, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 14)!),
                            .textCase(.uppercase),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "calendar-day/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "calendar-day/indicator/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.7293022859640111, green: 0.738315012626681, blue: 0.7788722826086957, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "calendar-day/title") {
                    return [
                            .textColor(UIColor(red: 0.0392156862745098, green: 0.0823529411764706, blue: 0.196078431372549, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Medium", size: 16)!),
                            .textCase(.uppercase)
                    ]
                }
                container.addProperty(identifier: "calendar-day[disabled]/title") {
                    return [
                            .textColor(UIColor(red: 0.8196078431372549, green: 0.8352941176470589, blue: 0.8705882352941177, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Medium", size: 16)!),
                            .textCase(.uppercase)
                    ]
                }
                container.addProperty(identifier: "calendar-day[highlighted]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.9686274509803922, green: 0.9803921568627451, blue: 1, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "calendar-day[highlighted]/indicator/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.2416911423206329, green: 0.3955334424972533, blue: 0.8134821057319641, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "calendar-day[highlighted]/title") {
                    return [
                            .textColor(UIColor(red: 0.2416911423206329, green: 0.3955334424972533, blue: 0.8134821057319641, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Medium", size: 16)!),
                            .textCase(.uppercase)
                    ]
                }
                container.addProperty(identifier: "calendar-day[selected]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.2416911423206329, green: 0.3955334424972533, blue: 0.8134821057319641, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "calendar-day[selected]/indicator/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.2416911423206329, green: 0.3955334424972533, blue: 0.8134821057319641, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "calendar-day[selected]/title") {
                    return [
                            .textColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Medium", size: 16)!),
                            .textCase(.uppercase)
                    ]
                }
                container.addProperty(identifier: "calendar/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "calendar/button-tertiary/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0))
                    ]
                }
                container.addProperty(identifier: "calendar/button-tertiary[highlighted]/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0))
                    ]
                }
                container.addProperty(identifier: "calendar/subtitle") {
                    return [
                            .textColor(UIColor(red: 0.5637555248790429, green: 0.5747846262623333, blue: 0.6351902173913043, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Medium", size: 13)!),
                            .textCase(.uppercase),
                            .kerning(0.1)
                    ]
                }
                container.addProperty(identifier: "calendar/title") {
                    return [
                            .textColor(UIColor(red: 0.2416911423206329, green: 0.3955334424972533, blue: 0.8134821057319641, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 15)!),
                            .textCase(.uppercase),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "camera-view/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.9529411764705882, green: 0.9647058823529412, blue: 0.9764705882352941, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "camera-view/button-icon-left/title") {
                    return [
                            .textColor(UIColor(red: 0.2416911423206329, green: 0.3955334424972533, blue: 0.8134821057319641, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Medium", size: 17)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "carousel/heading/divider/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "client-row/title") {
                    return [
                            .textColor(UIColor(red: 0.1235505566000938, green: 0.1434680819511414, blue: 0.2327242195606232, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 17)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "client-row[highlighted]/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "clients/button-tertiary-center/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.9778645833333334, green: 0.9374201217731568, blue: 0.7981670596735264, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "clients/button-tertiary-center/title") {
                    return [
                            .textColor(UIColor(red: 0.752547554347826, green: 0.6194560013545531, blue: 0.1536355658780985, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Medium", size: 12)!),
                            .textCase(.uppercase),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "clients/create/accordion/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0))
                    ]
                }
                container.addProperty(identifier: "clients/create/heading/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0))
                    ]
                }
                container.addProperty(identifier: "clients/create/heading/divider/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0))
                    ]
                }
                container.addProperty(identifier: "clients/create/message-view/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0))
                    ]
                }
                container.addProperty(identifier: "clients/create/modal/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.9568627450980391, green: 0.9529411764705882, blue: 0.9529411764705882, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "clients/create/note-instructions/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "clients/create/note/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0))
                    ]
                }
                container.addProperty(identifier: "clients/profile/block/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "color-item/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.9058823529411765, green: 0.9254901960784314, blue: 0.9490196078431372, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "color/info/title") {
                    return [
                            .textColor(UIColor(red: 0.6510528922080994, green: 0.6585400104522705, blue: 0.6951061487197876, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 14)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "curations/accordion/title") {
                    return [
                            .textColor(UIColor(red: 0.0392156862745098, green: 0.0823529411764706, blue: 0.196078431372549, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 19)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "curations/block/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "dashboard/button-filters[selected]/title") {
                    return [
                            .textColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Regular", size: 13)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "dashboard/subheading/title") {
                    return [
                            .textColor(UIColor(red: 0.3158311964556201, green: 0.3359064695705046, blue: 0.4362828351449275, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Regular", size: 15)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "date-picker/underlay") {
                    return [
                            .backgroundColor(UIColor(red: 0.9628623188405797, green: 0.9628623188405797, blue: 0.9628623188405797, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "divider/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.9146190881729126, green: 0.9147508144378662, blue: 0.9214738011360168, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "divider/overlay") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "divider/title") {
                    return [
                            .textColor(UIColor(red: 0.3176470588235294, green: 0.3372549019607843, blue: 0.4352941176470588, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Medium", size: 11)!),
                            .textCase(.uppercase),
                            .kerning(1.2)
                    ]
                }
                container.addProperty(identifier: "email-content/body") {
                    return [
                            .textColor(UIColor(red: 0.4674223882648877, green: 0.4754815794212982, blue: 0.5174082880434783, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 14)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "email-content/subtitle") {
                    return [
                            .textColor(UIColor(red: 0.1257268717534216, green: 0.1468395554186159, blue: 0.2414515398550725, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 14)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "email-content/tag-primary/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.9058823529411765, green: 0.9254901960784314, blue: 0.9490196078431372, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "email-content/tag-primary/title") {
                    return [
                            .textColor(UIColor(red: 0.4235294117647059, green: 0.4431372549019608, blue: 0.5411764705882353, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 12)!),
                            .textCase(.uppercase),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "email-content/tag-primary[highlighted]/title") {
                    return [
                            .textColor(UIColor(red: 0.830078125, green: 0.03524035942263722, blue: 0.03524035942263722, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 12)!),
                            .textCase(.uppercase),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "email-content/tag-secondary/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0))
                    ]
                }
                container.addProperty(identifier: "email-content/tag-secondary/title") {
                    return [
                            .textColor(UIColor(red: 0.4246054478440027, green: 0.4436480050340966, blue: 0.5427139945652174, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 12)!),
                            .textCase(.uppercase),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "email-content/title") {
                    return [
                            .textColor(UIColor(red: 0.1257268717534216, green: 0.1468395554186159, blue: 0.2414515398550725, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 16)!),
                            .textCase(.none),
                            .kerning(0.1882352941176471)
                    ]
                }
                container.addProperty(identifier: "email-hero/body") {
                    return [
                            .textColor(UIColor(red: 0.4674223882648877, green: 0.4754815794212982, blue: 0.5174082880434783, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 14)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "email-hero/subtitle") {
                    return [
                            .textColor(UIColor(red: 0.1257268717534216, green: 0.1468395554186159, blue: 0.2414515398550725, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 14)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "email-hero/tag-primary/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.9058823529411765, green: 0.9254901960784314, blue: 0.9490196078431372, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "email-hero/tag-primary/title") {
                    return [
                            .textColor(UIColor(red: 0.4235294117647059, green: 0.4431372549019608, blue: 0.5411764705882353, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 12)!),
                            .textCase(.uppercase),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "email-hero/tag-primary[highlighted]/title") {
                    return [
                            .textColor(UIColor(red: 0.830078125, green: 0.03524035942263722, blue: 0.03524035942263722, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 12)!),
                            .textCase(.uppercase),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "email-hero/tag-secondary/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0))
                    ]
                }
                container.addProperty(identifier: "email-hero/tag-secondary/title") {
                    return [
                            .textColor(UIColor(red: 0.4246054478440027, green: 0.4436480050340966, blue: 0.5427139945652174, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 12)!),
                            .textCase(.uppercase),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "email-hero/title") {
                    return [
                            .textColor(UIColor(red: 0.1257268717534216, green: 0.1468395554186159, blue: 0.2414515398550725, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 17)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "email/body") {
                    return [
                            .textColor(UIColor(red: 0.4674223882648877, green: 0.4754815794212982, blue: 0.5174082880434783, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 12)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "email/subtitle") {
                    return [
                            .textColor(UIColor(red: 0.387256532907486, green: 0.399604320526123, blue: 0.4638417959213257, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 14)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "email/title") {
                    return [
                            .textColor(UIColor(red: 0.1235505566000938, green: 0.1434680819511414, blue: 0.2327242195606232, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-DemiBold", size: 18)!),
                            .textCase(.uppercase),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "expandable/body") {
                    return [
                            .textColor(UIColor(red: 0.6510528922080994, green: 0.6585400104522705, blue: 0.6951061487197876, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 16)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "expandable/title") {
                    return [
                            .textColor(UIColor(red: 0.2416911423206329, green: 0.3955334424972533, blue: 0.8134821057319641, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 16)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "fab/divider/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.9529411764705882, green: 0.9529411764705882, blue: 0.9529411764705882, alpha: 0))
                    ]
                }
                container.addProperty(identifier: "fab/info/title") {
                    return [
                            .textColor(UIColor(red: 0.6510528922080994, green: 0.6585400104522705, blue: 0.6951061487197876, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 14)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "filters/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "filters/button-filters[selected]/title") {
                    return [
                            .textColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 12)!),
                            .textCase(.none)
                    ]
                }
                container.addProperty(identifier: "fold/overlay") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0.75))
                    ]
                }
                container.addProperty(identifier: "form-field-message/title") {
                    return [
                            .textColor(UIColor(red: 0.6509803921568628, green: 0.6588235294117647, blue: 0.6941176470588235, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 12)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "form-field-title/title") {
                    return [
                            .textColor(UIColor(red: 0.387256532907486, green: 0.399604320526123, blue: 0.4638417959213257, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Regular", size: 14)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "form-field/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0))
                    ]
                }
                container.addProperty(identifier: "form-field/badge/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0))
                    ]
                }
                container.addProperty(identifier: "form-field/badge/title") {
                    return [
                            .textColor(UIColor(red: 0.4036762020452235, green: 0.4231074743449539, blue: 0.5086050724637681, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 12)!),
                            .textCase(.none),
                            .kerning(-0.2)
                    ]
                }
                container.addProperty(identifier: "form-field/button-tertiary/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0))
                    ]
                }
                container.addProperty(identifier: "form-field/button-tertiary/title") {
                    return [
                            .textColor(UIColor(red: 0.2416911423206329, green: 0.3955334424972533, blue: 0.8134821057319641, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Medium", size: 12)!),
                            .textCase(.uppercase),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "form-field/subtitle") {
                    return [
                            .textColor(UIColor(red: 0.6510528922080994, green: 0.6585400104522705, blue: 0.6951061487197876, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 15)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "form-field/title") {
                    return [
                            .textColor(UIColor(red: 0.1235505566000938, green: 0.1434680819511414, blue: 0.2327242195606232, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 17)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "form-field[disabled]/badge/title") {
                    return [
                            .textColor(UIColor(red: 0.8196078431372549, green: 0.8352941176470589, blue: 0.8705882352941177, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 12)!),
                            .textCase(.none)
                    ]
                }
                container.addProperty(identifier: "form-field[disabled]/button-tertiary/title") {
                    return [
                            .textColor(UIColor(red: 0.7764705882352941, green: 0.8274509803921568, blue: 0.9098039215686274, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Medium", size: 12)!),
                            .textCase(.uppercase),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "form-field[disabled]/form-field-message/title") {
                    return [
                            .textColor(UIColor(red: 0.8196078431372549, green: 0.8352941176470589, blue: 0.8705882352941177, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 12)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "form-field[disabled]/form-field-title/title") {
                    return [
                            .textColor(UIColor(red: 0.8196078431372549, green: 0.8352941176470589, blue: 0.8705882352941177, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Regular", size: 14)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "form-field[disabled]/form-type-button/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.9137254901960784, green: 0.9137254901960784, blue: 0.9215686274509803, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "form-field[disabled]/form-type-button/info/title") {
                    return [
                            .textColor(UIColor(red: 0.6509803921568628, green: 0.6588235294117647, blue: 0.6941176470588235, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 12)!),
                            .textCase(.none)
                    ]
                }
                container.addProperty(identifier: "form-field[disabled]/form-type-button/title") {
                    return [
                            .textColor(UIColor(red: 0.6509803921568628, green: 0.6588235294117647, blue: 0.6941176470588235, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 12)!),
                            .textCase(.none)
                    ]
                }
                container.addProperty(identifier: "form-field[disabled]/form-type-signature/body") {
                    return [
                            .textColor(UIColor(red: 0.8196078431372549, green: 0.8352941176470589, blue: 0.8705882352941177, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 14)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "form-field[disabled]/form-type-signature/subtitle") {
                    return [
                            .textColor(UIColor(red: 0.8196078431372549, green: 0.8352941176470589, blue: 0.8705882352941177, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 14)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "form-field[disabled]/subtitle") {
                    return [
                            .textColor(UIColor(red: 0.8196078431372549, green: 0.8352941176470589, blue: 0.8705882352941177, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 15)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "form-field[disabled]/title") {
                    return [
                            .textColor(UIColor(red: 0.8196078431372549, green: 0.8352941176470589, blue: 0.8705882352941177, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 17)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "form-field[error]/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 0.9774961890243903, blue: 0.977509875506312, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "form-field[error]/divider/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.7333333333333333, green: 0.04705882352941172, blue: 0.04705882352941172, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "form-field[error]/title") {
                    return [
                            .textColor(UIColor(red: 0.7333333333333333, green: 0.04705882352941176, blue: 0.04705882352941176, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 17)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "form-field[placeholder]/title") {
                    return [
                            .textColor(UIColor(red: 0.6509803921568628, green: 0.6588235294117647, blue: 0.6941176470588235, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 17)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "form-field[warning]/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 0.9880565062131358, blue: 0.9662728658536586, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "form-field[warning]/divider/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.8784313725490196, green: 0.5686274509803921, blue: 0, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "form-field[warning]/title") {
                    return [
                            .textColor(UIColor(red: 0.8784313725490196, green: 0.5686274509803921, blue: 0, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 17)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "form-group/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "form-type-button/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "form-type-button/info/title") {
                    return [
                            .textColor(UIColor(red: 0.2416911423206329, green: 0.3955334424972533, blue: 0.8134821057319641, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 14)!),
                            .textCase(.none),
                            .kerning(-0.2)
                    ]
                }
                container.addProperty(identifier: "form-type-button/title") {
                    return [
                            .textColor(UIColor(red: 0.2416911423206329, green: 0.3955334424972533, blue: 0.8134821057319641, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 14)!),
                            .textCase(.none),
                            .kerning(-0.2)
                    ]
                }
                container.addProperty(identifier: "form-type-button[disabled]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.9137254901960784, green: 0.9137254901960784, blue: 0.9215686274509803, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "form-type-button[disabled]/badge/title") {
                    return [
                            .textColor(UIColor(red: 0.6509803921568628, green: 0.6588235294117647, blue: 0.6941176470588235, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 12)!),
                            .textCase(.none),
                            .kerning(-0.2)
                    ]
                }
                container.addProperty(identifier: "form-type-button[disabled]/info/title") {
                    return [
                            .textColor(UIColor(red: 0.6509803921568628, green: 0.6588235294117647, blue: 0.6941176470588235, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 14)!),
                            .textCase(.none),
                            .kerning(-0.2)
                    ]
                }
                container.addProperty(identifier: "form-type-button[selected]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.2416911423206329, green: 0.3955334424972533, blue: 0.8134821057319641, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "form-type-button[selected]/badge/title") {
                    return [
                            .textColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 12)!),
                            .textCase(.none),
                            .kerning(-0.2)
                    ]
                }
                container.addProperty(identifier: "form-type-button[selected]/info/title") {
                    return [
                            .textColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 14)!),
                            .textCase(.none),
                            .kerning(-0.2)
                    ]
                }
                container.addProperty(identifier: "form-type-button[selected]/title") {
                    return [
                            .textColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 14)!),
                            .textCase(.none),
                            .kerning(-0.2)
                    ]
                }
                container.addProperty(identifier: "form-type-calendar-week/button-tertiary/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0))
                    ]
                }
                container.addProperty(identifier: "form-type-calendar-week/button-tertiary[highlighted]/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0))
                    ]
                }
                container.addProperty(identifier: "form-type-calendar-week/subtitle") {
                    return [
                            .textColor(UIColor(red: 0.5637555248790429, green: 0.5747846262623333, blue: 0.6351902173913043, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Medium", size: 13)!),
                            .textCase(.uppercase),
                            .kerning(0.1)
                    ]
                }
                container.addProperty(identifier: "form-type-calendar-week/title") {
                    return [
                            .textColor(UIColor(red: 0.2416911423206329, green: 0.3955334424972533, blue: 0.8134821057319641, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 15)!),
                            .textCase(.uppercase),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "form-type-calendar/button-tertiary/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0))
                    ]
                }
                container.addProperty(identifier: "form-type-calendar/button-tertiary[highlighted]/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0))
                    ]
                }
                container.addProperty(identifier: "form-type-calendar/subtitle") {
                    return [
                            .textColor(UIColor(red: 0.5637555248790429, green: 0.5747846262623333, blue: 0.6351902173913043, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Medium", size: 13)!),
                            .textCase(.uppercase),
                            .kerning(0.1)
                    ]
                }
                container.addProperty(identifier: "form-type-calendar/title") {
                    return [
                            .textColor(UIColor(red: 0.2416911423206329, green: 0.3955334424972533, blue: 0.8134821057319641, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 15)!),
                            .textCase(.uppercase),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "form-type-client[disabled]/info/subtitle") {
                    return [
                            .textColor(UIColor(red: 0.6509803921568628, green: 0.6588235294117647, blue: 0.6941176470588235, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 14)!),
                            .textCase(.none),
                            .kerning(-0.2)
                    ]
                }
                container.addProperty(identifier: "form-type-client[disabled]/info/title") {
                    return [
                            .textColor(UIColor(red: 0.6509803921568628, green: 0.6588235294117647, blue: 0.6941176470588235, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 14)!),
                            .textCase(.none),
                            .kerning(-0.2)
                    ]
                }
                container.addProperty(identifier: "form-type-client[disabled]/subtitle") {
                    return [
                            .textColor(UIColor(red: 0.8196078431372549, green: 0.8352941176470589, blue: 0.8705882352941177, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 15)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "form-type-client[disabled]/title") {
                    return [
                            .textColor(UIColor(red: 0.8196078431372549, green: 0.8352941176470589, blue: 0.8705882352941177, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 17)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "form-type-image-sm/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.9058823529411765, green: 0.9254901960784314, blue: 0.9490196078431372, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "form-type-image-sm/indicator/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.2965771113699103, green: 0.816802536231884, blue: 0, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "form-type-image-sm/indicator[expired]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.2172780797101449, green: 0.2172780797101449, blue: 0.2172780797101449, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "form-type-image-sm/indicator[low-stock]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.8705882352941177, green: 0.4980392156862745, blue: 0, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "form-type-image-sm/indicator[no-stock]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.6976902173913043, green: 0.6976902173913043, blue: 0.6976902173913043, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "form-type-image-sm/indicator[on-demand]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.9940557065217391, green: 0.7661099119382088, blue: 0.123916014330511, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "form-type-image-sm/indicator[out-of-stock]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.7932518115942029, green: 0, blue: 0, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "form-type-image-sm/overlay") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0))
                    ]
                }
                container.addProperty(identifier: "form-type-image-sm/title") {
                    return [
                            .textColor(UIColor(red: 0.1254901960784314, green: 0.1450980392156863, blue: 0.2313725490196079, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 15)!),
                            .textCase(.uppercase),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "form-type-image-sm[disabled]/overlay") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0.6))
                    ]
                }
                container.addProperty(identifier: "form-type-image-sm[disabled]/title") {
                    return [
                            .textColor(UIColor(red: 0.5657552083333334, green: 0.5657552083333334, blue: 0.5657552083333334, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 15)!),
                            .textCase(.uppercase),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "form-type-image-sm[selected]/overlay") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0))
                    ]
                }
                container.addProperty(identifier: "form-type-image/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.9146190881729126, green: 0.9147508144378662, blue: 0.9214738011360168, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "form-type-image/info/title") {
                    return [
                            .textColor(UIColor(red: 0.1235505566000938, green: 0.1434680819511414, blue: 0.2327242195606232, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 14)!),
                            .textCase(.none),
                            .kerning(-0.2)
                    ]
                }
                container.addProperty(identifier: "form-type-image/overlay") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0))
                    ]
                }
                container.addProperty(identifier: "form-type-image/title") {
                    return [
                            .textColor(UIColor(red: 0.1235505566000938, green: 0.1434680819511414, blue: 0.2327242195606232, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Regular", size: 28)!),
                            .textCase(.none)
                    ]
                }
                container.addProperty(identifier: "form-type-image[disabled]/badge/title") {
                    return [
                            .textColor(UIColor(red: 0.8196078431372549, green: 0.8352941176470589, blue: 0.8705882352941177, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 12)!),
                            .textCase(.none)
                    ]
                }
                container.addProperty(identifier: "form-type-image[disabled]/info/title") {
                    return [
                            .textColor(UIColor(red: 0.6509803921568628, green: 0.6588235294117647, blue: 0.6941176470588235, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 14)!),
                            .textCase(.none),
                            .kerning(-0.2)
                    ]
                }
                container.addProperty(identifier: "form-type-image[disabled]/overlay") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0.6))
                    ]
                }
                container.addProperty(identifier: "form-type-image[selected]/badge/title") {
                    return [
                            .textColor(UIColor(red: 0.2416911423206329, green: 0.3955334424972533, blue: 0.8134821057319641, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 12)!),
                            .textCase(.none)
                    ]
                }
                container.addProperty(identifier: "form-type-image[selected]/info/title") {
                    return [
                            .textColor(UIColor(red: 0.2416911423206329, green: 0.3955334424972533, blue: 0.8134821057319641, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 14)!),
                            .textCase(.none),
                            .kerning(-0.2)
                    ]
                }
                container.addProperty(identifier: "form-type-image[selected]/overlay") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0))
                    ]
                }
                container.addProperty(identifier: "form-type-profile-photo/image/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.9058823529411765, green: 0.9254901960784314, blue: 0.9490196078431372, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "form-type-profile-photo/title") {
                    return [
                            .textColor(UIColor(red: 0.1235505566000938, green: 0.1434680819511414, blue: 0.2327242195606232, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Regular", size: 36)!),
                            .textCase(.none)
                    ]
                }
                container.addProperty(identifier: "form-type-select-inline[disabled]/badge/title") {
                    return [
                            .textColor(UIColor(red: 0.8196078431372549, green: 0.8352941176470589, blue: 0.8705882352941177, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 12)!),
                            .textCase(.none)
                    ]
                }
                container.addProperty(identifier: "form-type-select-inline[disabled]/subtitle") {
                    return [
                            .textColor(UIColor(red: 0.8196078431372549, green: 0.8352941176470589, blue: 0.8705882352941177, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 15)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "form-type-select-inline[disabled]/title") {
                    return [
                            .textColor(UIColor(red: 0.8196078431372549, green: 0.8352941176470589, blue: 0.8705882352941177, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 17)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "form-type-select-stacked[disabled]/badge/title") {
                    return [
                            .textColor(UIColor(red: 0.8196078431372549, green: 0.8352941176470589, blue: 0.8705882352941177, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 12)!),
                            .textCase(.none)
                    ]
                }
                container.addProperty(identifier: "form-type-select-stacked[disabled]/subtitle") {
                    return [
                            .textColor(UIColor(red: 0.8196078431372549, green: 0.8352941176470589, blue: 0.8705882352941177, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 15)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "form-type-select-stacked[disabled]/title") {
                    return [
                            .textColor(UIColor(red: 0.8196078431372549, green: 0.8352941176470589, blue: 0.8705882352941177, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 17)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "form-type-select[disabled]/badge/title") {
                    return [
                            .textColor(UIColor(red: 0.8196078431372549, green: 0.8352941176470589, blue: 0.8705882352941177, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 12)!),
                            .textCase(.none)
                    ]
                }
                container.addProperty(identifier: "form-type-select[disabled]/subtitle") {
                    return [
                            .textColor(UIColor(red: 0.8196078431372549, green: 0.8352941176470589, blue: 0.8705882352941177, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 15)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "form-type-select[disabled]/title") {
                    return [
                            .textColor(UIColor(red: 0.8196078431372549, green: 0.8352941176470589, blue: 0.8705882352941177, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 17)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "form-type-signature/button-tertiary/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "graph-item/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "graph-item[accent]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.3328941887282112, green: 0.5417972310941493, blue: 0.8674422554347826, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "graph-item[eight]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.2458627820014954, green: 0.7959352731704709, blue: 0.8451260924339294, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "graph-item[five]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.8766596913337708, green: 0.108336366713047, blue: 0.1236282661557198, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "graph-item[four]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.06168909649328106, green: 0.6321897644927537, blue: 0.3668406165860222, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "graph-item[nine]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.2586306578445624, green: 0.3836616847826087, blue: 0.2065690656481972, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "graph-item[one]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.3328941887282112, green: 0.5417972310941493, blue: 0.8674422554347826, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "graph-item[seven]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.4734477403610948, green: 0.3307192676014257, blue: 0.6530514039855072, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "graph-item[six]/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 0.7321646341463415, blue: 0.85129055480502, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "graph-item[ten]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.7386041359169911, green: 0.9660892210144928, blue: 0.5682401309884787, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "graph-item[three]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.9558334946632385, green: 0.5913878679275512, blue: 0.1483992040157318, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "graph-item[two]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.9215686274509803, green: 0.7568627450980392, blue: 0.4901960784313725, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "graph/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "heading/subtitle") {
                    return [
                            .textColor(UIColor(red: 0.6509803921568628, green: 0.6588235294117647, blue: 0.6941176470588235, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 14)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "heading/title") {
                    return [
                            .textColor(UIColor(red: 0.0392156862745098, green: 0.0823529411764706, blue: 0.196078431372549, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 19)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "heading[error]/divider/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.7333333333333333, green: 0.04705882352941176, blue: 0.04705882352941176, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "heading[error]/title") {
                    return [
                            .textColor(UIColor(red: 0.7333333333333333, green: 0.04705882352941176, blue: 0.04705882352941176, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 19)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "heading[feature]/title") {
                    return [
                            .textColor(UIColor(red: 0.0392156862745098, green: 0.08235294117647061, blue: 0.196078431372549, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 22)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "home-indicator/background") {
                    return [
                            .backgroundColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "homepage/note/title") {
                    return [
                            .textColor(UIColor(red: 0.1235505566000938, green: 0.1434680819511414, blue: 0.2327242195606232, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-DemiBold", size: 24)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "image/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.9040878684245136, green: 0.9260447267847206, blue: 0.9480015851449275, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "image/title") {
                    return [
                            .textColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 18)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "image[highlighted]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.9058823529411765, green: 0.9254901960784314, blue: 0.9490196078431372, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "image[icon-highlighted]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.9058823529411765, green: 0.9254901960784314, blue: 0.9490196078431372, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "image[loading]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.9058823529411765, green: 0.9254901960784314, blue: 0.9490196078431372, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "indicator/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.4156862745098039, green: 0.6039215686274509, blue: 0.04313725490196076, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "indicator[low-stock]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.8705882352941177, green: 0.4980392156862745, blue: 0, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "indicator[no-stock]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.6980392156862745, green: 0.6980392156862745, blue: 0.6980392156862745, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "indicator[out-of-stock]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.792156862745098, green: 0, blue: 0, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "info/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.9529411764705882, green: 0.9529411764705882, blue: 0.9529411764705882, alpha: 0))
                    ]
                }
                container.addProperty(identifier: "info/subtitle") {
                    return [
                            .textColor(UIColor(red: 0.387256532907486, green: 0.399604320526123, blue: 0.4638417959213257, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 15)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "info/title") {
                    return [
                            .textColor(UIColor(red: 0.1235505566000938, green: 0.1434680819511414, blue: 0.2327242195606232, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 15)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "info[label-error]/title") {
                    return [
                            .textColor(UIColor(red: 0.7333333333333333, green: 0.04705882352941176, blue: 0.04705882352941176, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 15)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "info[label-highlighted]/title") {
                    return [
                            .textColor(UIColor(red: 0.1235505566000938, green: 0.1434680819511414, blue: 0.2327242195606232, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Semibold", size: 15)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "input/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "input/badge/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0))
                    ]
                }
                container.addProperty(identifier: "input/badge/title") {
                    return [
                            .textColor(UIColor(red: 0.403921568627451, green: 0.4235294117647059, blue: 0.5098039215686274, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 15)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "input/body") {
                    return [
                            .textColor(UIColor(red: 0.6510528922080994, green: 0.6585400104522705, blue: 0.6951061487197876, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 15)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "input/button-tertiary/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "input/carousel/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.9040878684245136, green: 0.9260447267847206, blue: 0.9480015851449275, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "input/carousel/indicator/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.2980392156862746, green: 0.8156862745098039, blue: 0, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "input/carousel[disabled]/overlay") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0.900197))
                    ]
                }
                container.addProperty(identifier: "input/carousel[disabled]/title") {
                    return [
                            .textColor(UIColor(red: 0.5647058823529412, green: 0.5647058823529412, blue: 0.5647058823529412, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 17)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "input/subtitle") {
                    return [
                            .textColor(UIColor(red: 0.387256532907486, green: 0.399604320526123, blue: 0.4638417959213257, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Regular", size: 14)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "input/tag-status/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0.95))
                    ]
                }
                container.addProperty(identifier: "input/title") {
                    return [
                            .textColor(UIColor(red: 0.1235505566000938, green: 0.1434680819511414, blue: 0.2327242195606232, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 17)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "input[blurred]/title") {
                    return [
                            .textColor(UIColor(red: 0.6510528922080994, green: 0.6585400104522705, blue: 0.6951061487197876, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 17)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "input[carousel]/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0))
                    ]
                }
                container.addProperty(identifier: "input[cta]/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0))
                    ]
                }
                container.addProperty(identifier: "input[cta]/button-tertiary/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0))
                    ]
                }
                container.addProperty(identifier: "input[date-time-blurred]/title") {
                    return [
                            .textColor(UIColor(red: 0.6510528922080994, green: 0.6585400104522705, blue: 0.6951061487197876, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 17)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "input[disabled]/subtitle") {
                    return [
                            .textColor(UIColor(red: 0.8196078431372549, green: 0.8352941176470589, blue: 0.8705882352941177, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Regular", size: 14)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "input[disabled]/title") {
                    return [
                            .textColor(UIColor(red: 0.8196078431372549, green: 0.8352941176470589, blue: 0.8705882352941177, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 17)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "input[error]/body") {
                    return [
                            .textColor(UIColor(red: 0.6509803921568628, green: 0.6588235294117647, blue: 0.6941176470588235, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 12)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "input[error]/divider/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.7333333333333333, green: 0.04705882352941176, blue: 0.04705882352941176, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "input[error]/title") {
                    return [
                            .textColor(UIColor(red: 0.7333333333333333, green: 0.04705882352941176, blue: 0.04705882352941176, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 17)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "input[radio-box-disabled]/badge/title") {
                    return [
                            .textColor(UIColor(red: 0.6509803921568628, green: 0.6588235294117647, blue: 0.6941176470588235, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 15)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "input[radio-box-disabled]/subtitle") {
                    return [
                            .textColor(UIColor(red: 0.8196078431372549, green: 0.8352941176470589, blue: 0.8705882352941177, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 15)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "input[radio-box-disabled]/title") {
                    return [
                            .textColor(UIColor(red: 0.8196078431372549, green: 0.8352941176470589, blue: 0.8705882352941177, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 17)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "input[radio-box-preview-disabled]/badge/title") {
                    return [
                            .textColor(UIColor(red: 0.6509803921568628, green: 0.6588235294117647, blue: 0.6941176470588235, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 15)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "input[radio-box-preview-disabled]/subtitle") {
                    return [
                            .textColor(UIColor(red: 0.8196078431372549, green: 0.8352941176470589, blue: 0.8705882352941177, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 15)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "input[radio-box-preview-disabled]/title") {
                    return [
                            .textColor(UIColor(red: 0.8196078431372549, green: 0.8352941176470589, blue: 0.8705882352941177, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 17)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "input[radio-box]/body") {
                    return [
                            .textColor(UIColor(red: 0.6510528922080994, green: 0.6585400104522705, blue: 0.6951061487197876, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 15)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "input[tag-disabled]/subtitle") {
                    return [
                            .textColor(UIColor(red: 0.8196078431372549, green: 0.8352941176470589, blue: 0.8705882352941177, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Regular", size: 14)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "input[tag-disabled]/title") {
                    return [
                            .textColor(UIColor(red: 0.8196078431372549, green: 0.8352941176470589, blue: 0.8705882352941177, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 17)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "input[warning]/body") {
                    return [
                            .textColor(UIColor(red: 0.6509803921568628, green: 0.6588235294117647, blue: 0.6941176470588235, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 12)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "input[warning]/divider/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.8784313725490196, green: 0.5686274509803921, blue: 0, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "input[warning]/title") {
                    return [
                            .textColor(UIColor(red: 0.8784313725490196, green: 0.5686274509803921, blue: 0, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 17)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "list-group/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "list-row/body") {
                    return [
                            .textColor(UIColor(red: 0.6510528922080994, green: 0.6585400104522705, blue: 0.6951061487197876, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 16)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "list-row/title") {
                    return [
                            .textColor(UIColor(red: 0.387256532907486, green: 0.399604320526123, blue: 0.4638417959213257, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 18)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "list-row[double-edit]/body") {
                    return [
                            .textColor(UIColor(red: 0.6510528922080994, green: 0.6585400104522705, blue: 0.6951061487197876, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 16)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "list-row[highlighted]/title") {
                    return [
                            .textColor(UIColor(red: 0.7333333333333333, green: 0.04705882352941176, blue: 0.04705882352941176, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 18)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "list-row[stacked]/body") {
                    return [
                            .textColor(UIColor(red: 0.6510528922080994, green: 0.6585400104522705, blue: 0.6951061487197876, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 16)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "list-row[task-completed]/title") {
                    return [
                            .textColor(UIColor(red: 0.6509803921568628, green: 0.6588235294117647, blue: 0.6941176470588235, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 18)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "list-row[task]/body") {
                    return [
                            .textColor(UIColor(red: 0.6510528922080994, green: 0.6585400104522705, blue: 0.6951061487197876, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 16)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "list/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0))
                    ]
                }
                container.addProperty(identifier: "login/status-bar/background") {
                    return [
                            .backgroundColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "login/subtitle") {
                    return [
                            .textColor(UIColor(red: 0.1137254901960784, green: 0.1215686274509804, blue: 0.1647058823529412, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Regular", size: 14)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "login/title") {
                    return [
                            .textColor(UIColor(red: 0.0392156862745098, green: 0.08235294117647059, blue: 0.196078431372549, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Regular", size: 18)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "login[keycloak]/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "message-view/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0))
                    ]
                }
                container.addProperty(identifier: "message-view/subtitle") {
                    return [
                            .textColor(UIColor(red: 0.387256532907486, green: 0.399604320526123, blue: 0.4638417959213257, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 15)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "message-view/title") {
                    return [
                            .textColor(UIColor(red: 0.1235505566000938, green: 0.1434680819511414, blue: 0.2327242195606232, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 16)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "modal/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "modal/button-icon-left/title") {
                    return [
                            .textColor(UIColor(red: 0.2416911423206329, green: 0.3955334424972533, blue: 0.8134821057319641, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Medium", size: 17)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "modal/heading/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "modal/navbar/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.9568627450980391, green: 0.9529411764705882, blue: 0.9529411764705882, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "modal/navbar/button-icon-left/title") {
                    return [
                            .textColor(UIColor(red: 0.2416911423206329, green: 0.3955334424972533, blue: 0.8134821057319641, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Medium", size: 17)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "modal/navbar/button-icon-right/title") {
                    return [
                            .textColor(UIColor(red: 0.2416911423206329, green: 0.3955334424972533, blue: 0.8134821057319641, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Medium", size: 17)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "modal/navbar/button-icon-right[disabled]/title") {
                    return [
                            .textColor(UIColor(red: 0.6510528922080994, green: 0.6585400104522705, blue: 0.6951061487197876, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Medium", size: 17)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "modal/navbar/divider/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.9568627450980391, green: 0.9529411764705882, blue: 0.9529411764705882, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "modal/navbar/title") {
                    return [
                            .textColor(UIColor(red: 0.1235505566000938, green: 0.1434680819511414, blue: 0.2327242195606232, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 18)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "modal/search/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "modal/search[highlighted]/title") {
                    return [
                            .textColor(UIColor(red: 0.1235505566000938, green: 0.1434680819511414, blue: 0.2327242195606232, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Regular", size: 16)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "modal/searchbar/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.9568627450980391, green: 0.9529411764705882, blue: 0.9529411764705882, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "modal/searchbar/divider/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.9568627450980391, green: 0.9529411764705882, blue: 0.9529411764705882, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "modal/searchbar/search/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "modal/subtitle") {
                    return [
                            .textColor(UIColor(red: 0.387256532907486, green: 0.399604320526123, blue: 0.4638417959213257, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 14)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "modal/title") {
                    return [
                            .textColor(UIColor(red: 0.1235505566000938, green: 0.1434680819511414, blue: 0.2327242195606232, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 16)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "modal[tray]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.9764705882352941, green: 0.9529411764705882, blue: 0.9333333333333333, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "modal[tray]/navbar/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.9764705882352941, green: 0.9529411764705882, blue: 0.9333333333333333, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "modal[tray]/navbar/divider/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.9764705882352941, green: 0.9529411764705882, blue: 0.9333333333333333, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "modal[tray]/navbar/title") {
                    return [
                            .textColor(UIColor(red: 0.1254901960784314, green: 0.1450980392156863, blue: 0.2313725490196079, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 18)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "navbar-list/background") {
                    return [
                            .backgroundColor(UIColor(red: 0, green: 0.1568627450980392, blue: 0.3333333333333333, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "navbar-list/body") {
                    return [
                            .textColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Regular", size: 14)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "navbar-list/divider/background") {
                    return [
                            .backgroundColor(UIColor(red: 0, green: 0.1568627450980392, blue: 0.3333333333333333, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "navbar-list/overlay") {
                    return [
                            .backgroundColor(UIColor(red: 0, green: 0, blue: 0, alpha: 0.50098))
                    ]
                }
                container.addProperty(identifier: "navbar-list/subtitle") {
                    return [
                            .textColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 16)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "navbar-list/title") {
                    return [
                            .textColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 18)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "navbar-profile/background") {
                    return [
                            .backgroundColor(UIColor(red: 0, green: 0.1568627450980392, blue: 0.3333333333333333, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "navbar-profile/block/background") {
                    return [
                            .backgroundColor(UIColor(red: 0, green: 0.1568627450980392, blue: 0.3333333333333333, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "navbar-profile/block/subtitle") {
                    return [
                            .textColor(UIColor(red: 0.7058823529411764, green: 0.7294117647058823, blue: 0.8470588235294118, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Medium", size: 10)!),
                            .textCase(.uppercase),
                            .kerning(-0.1)
                    ]
                }
                container.addProperty(identifier: "navbar-profile/block/title") {
                    return [
                            .textColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 15)!),
                            .textCase(.none),
                            .kerning(0.1)
                    ]
                }
                container.addProperty(identifier: "navbar-profile/body") {
                    return [
                            .textColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 18)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "navbar-profile/button-tertiary/background") {
                    return [
                            .backgroundColor(UIColor(red: 0, green: 0.1568627450980392, blue: 0.3333333333333333, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "navbar-profile/button-tertiary/title") {
                    return [
                            .textColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Medium", size: 15)!),
                            .textCase(.uppercase),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "navbar-profile/divider/background") {
                    return [
                            .backgroundColor(UIColor(red: 0, green: 0.1568627450980392, blue: 0.3333333333333333, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "navbar-profile/info/title") {
                    return [
                            .textColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 16)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "navbar-profile/spinner/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "navbar-profile/subtitle") {
                    return [
                            .textColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 18)!),
                            .textCase(.none),
                            .kerning(0.2571428571428571)
                    ]
                }
                container.addProperty(identifier: "navbar-profile/tag-primary-icon/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.9333333333333333, green: 0.9176470588235294, blue: 0.9137254901960784, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "navbar-profile/tag-primary/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.9333333333333333, green: 0.9176470588235294, blue: 0.9137254901960784, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "navbar-profile/tag-primary/title") {
                    return [
                            .textColor(UIColor(red: 0.0392156862745098, green: 0.08235294117647061, blue: 0.196078431372549, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Medium", size: 11)!),
                            .textCase(.uppercase),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "navbar-profile/tag-secondary/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.5647058823529412, green: 0.5764705882352941, blue: 0.6352941176470588, alpha: 0))
                    ]
                }
                container.addProperty(identifier: "navbar-profile/tag-secondary/title") {
                    return [
                            .textColor(UIColor(red: 0.9333333333333333, green: 0.9176470588235294, blue: 0.9137254901960784, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Medium", size: 11)!),
                            .textCase(.uppercase),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "navbar-profile/title") {
                    return [
                            .textColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 18)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "navbar/background") {
                    return [
                            .backgroundColor(UIColor(red: 0, green: 0.1580956280231474, blue: 0.3330958485603333, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "navbar/button-icon-right[disabled]/title") {
                    return [
                            .textColor(UIColor(red: 0.3490196078431372, green: 0.4509803921568628, blue: 0.5647058823529412, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Medium", size: 17)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "navbar/divider/background") {
                    return [
                            .backgroundColor(UIColor(red: 0, green: 0.1580956280231474, blue: 0.3330958485603333, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "navbar/overlay") {
                    return [
                            .backgroundColor(UIColor(red: 0, green: 0, blue: 0, alpha: 0.40098))
                    ]
                }
                container.addProperty(identifier: "navbar/subtitle") {
                    return [
                            .textColor(UIColor(red: 0.5637555248790429, green: 0.5747846262623333, blue: 0.6351902173913043, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 13)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "navbar/title") {
                    return [
                            .textColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 18)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "navbar[image-search]/search/title") {
                    return [
                            .textColor(UIColor(red: 0.8117647058823529, green: 0.8117647058823529, blue: 0.8117647058823529, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 16)!),
                            .textCase(.none)
                    ]
                }
                container.addProperty(identifier: "navbar[image-search]/searchbar/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0))
                    ]
                }
                container.addProperty(identifier: "navbar[image-search]/searchbar/search/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0.15))
                    ]
                }
                container.addProperty(identifier: "navbar[image]/search/title") {
                    return [
                            .textColor(UIColor(red: 0.8117647058823529, green: 0.8117647058823529, blue: 0.8117647058823529, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 16)!),
                            .textCase(.none)
                    ]
                }
                container.addProperty(identifier: "navbar[image]/searchbar/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0))
                    ]
                }
                container.addProperty(identifier: "navbar[image]/searchbar/search/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0.15))
                    ]
                }
                container.addProperty(identifier: "note-info/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0))
                    ]
                }
                container.addProperty(identifier: "note-instructions/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.9529411764705882, green: 0.9647058823529412, blue: 0.9764705882352941, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "note-instructions/body") {
                    return [
                            .textColor(UIColor(red: 0.387256532907486, green: 0.399604320526123, blue: 0.4638417959213257, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 14)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "note-instructions/subtitle") {
                    return [
                            .textColor(UIColor(red: 0.387256532907486, green: 0.399604320526123, blue: 0.4638417959213257, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 14)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "note-instructions/title") {
                    return [
                            .textColor(UIColor(red: 0.1235505566000938, green: 0.1434680819511414, blue: 0.2327242195606232, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 16)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "note-instructions[alert]/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 0.9176470588235294, blue: 0.9176470588235294, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "note-instructions[alert]/title") {
                    return [
                            .textColor(UIColor(red: 0.7333333333333333, green: 0.04705882352941176, blue: 0.04705882352941176, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 16)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "note/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0))
                    ]
                }
                container.addProperty(identifier: "note/body") {
                    return [
                            .textColor(UIColor(red: 0.387256532907486, green: 0.399604320526123, blue: 0.4638417959213257, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 15)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "note/subtitle") {
                    return [
                            .textColor(UIColor(red: 0.03137254901960784, green: 0.08235294117647061, blue: 0.2235294117647059, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Medium", size: 15)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "note/title") {
                    return [
                            .textColor(UIColor(red: 0.1235505566000938, green: 0.1434680819511414, blue: 0.2327242195606232, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 15)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "note[alert]/body") {
                    return [
                            .textColor(UIColor(red: 0.7333333333333333, green: 0.04705882352941176, blue: 0.04705882352941176, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 15)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "note[alert]/title") {
                    return [
                            .textColor(UIColor(red: 0.7333333333333333, green: 0.04705882352941176, blue: 0.04705882352941176, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 15)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "note[status]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.9529411764705882, green: 0.9647058823529412, blue: 0.9764705882352941, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "notification/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "notification/body") {
                    return [
                            .textColor(UIColor(red: 0.6509803921568628, green: 0.6588235294117647, blue: 0.6941176470588235, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 12)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "notification/info[label]/subtitle") {
                    return [
                            .textColor(UIColor(red: 0.6509803921568628, green: 0.6588235294117647, blue: 0.6941176470588235, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 13)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "notification/info[label]/title") {
                    return [
                            .textColor(UIColor(red: 0.4503482596113219, green: 0.4565915520008312, blue: 0.4846863677536232, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 13)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "notification/subtitle") {
                    return [
                            .textColor(UIColor(red: 0.6509803921568628, green: 0.6588235294117647, blue: 0.6941176470588235, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 13)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "notification/title") {
                    return [
                            .textColor(UIColor(red: 0.1235505566000938, green: 0.1434680819511414, blue: 0.2327242195606232, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 15)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "notification/underlay") {
                    return [
                            .backgroundColor(UIColor(red: 0.2416911423206329, green: 0.3955334424972533, blue: 0.8134821057319641, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "notification[read]/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "notification[swipe]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.9529411764705882, green: 0.9647058823529412, blue: 0.9764705882352941, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "notification[unread]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.9529411764705882, green: 0.9647058823529412, blue: 0.9764705882352941, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "overlay") {
                    return [
                            .backgroundColor(UIColor(red: 0, green: 0, blue: 0, alpha: 0.35))
                    ]
                }
                container.addProperty(identifier: "permissions/status-bar/background") {
                    return [
                            .backgroundColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "product/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0))
                    ]
                }
                container.addProperty(identifier: "product/body") {
                    return [
                            .textColor(UIColor(red: 0.387256532907486, green: 0.399604320526123, blue: 0.4638417959213257, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 15)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "product/subtitle") {
                    return [
                            .textColor(UIColor(red: 0.6510528922080994, green: 0.6585400104522705, blue: 0.6951061487197876, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 10)!),
                            .textCase(.uppercase),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "product/tag-primary/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.9058823529411765, green: 0.9254901960784314, blue: 0.9490196078431372, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "product/tag-primary/title") {
                    return [
                            .textColor(UIColor(red: 0.4235294117647059, green: 0.4431372549019608, blue: 0.5411764705882353, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 12)!),
                            .textCase(.uppercase),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "product/tag-primary[highlighted]/title") {
                    return [
                            .textColor(UIColor(red: 0.830078125, green: 0.03524035942263722, blue: 0.03524035942263722, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 12)!),
                            .textCase(.uppercase),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "product/tag-secondary/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0))
                    ]
                }
                container.addProperty(identifier: "product/tag-secondary/title") {
                    return [
                            .textColor(UIColor(red: 0.4246054478440027, green: 0.4436480050340966, blue: 0.5427139945652174, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 12)!),
                            .textCase(.uppercase),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "product/title") {
                    return [
                            .textColor(UIColor(red: 0.1235505566000938, green: 0.1434680819511414, blue: 0.2327242195606232, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 17)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "product[group-image]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.9529411764705882, green: 0.9647058823529412, blue: 0.9764705882352941, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "product[group-image]/button-tertiary/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.9529411764705882, green: 0.9647058823529412, blue: 0.9764705882352941, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "product[group-swipe]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.9529411764705882, green: 0.9647058823529412, blue: 0.9764705882352941, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "product[group-swipe]/button-tertiary/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.9529411764705882, green: 0.9647058823529412, blue: 0.9764705882352941, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "product[group]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.9529411764705882, green: 0.9647058823529412, blue: 0.9764705882352941, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "product[group]/button-tertiary/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.9529411764705882, green: 0.9647058823529412, blue: 0.9764705882352941, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "product[info]/button-tertiary/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "product[info]/button-tertiary/title") {
                    return [
                            .textColor(UIColor(red: 0.6510528922080994, green: 0.6585400104522705, blue: 0.6951061487197876, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 10)!),
                            .textCase(.uppercase),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "product[info]/title") {
                    return [
                            .textColor(UIColor(red: 0.1235505566000938, green: 0.1434680819511414, blue: 0.2327242195606232, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 24)!),
                            .textCase(.none),
                            .kerning(0.2666666666666667)
                    ]
                }
                container.addProperty(identifier: "product[row-swipe]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.9529411764705882, green: 0.9647058823529412, blue: 0.9764705882352941, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "product[row-swipe]/divider/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0))
                    ]
                }
                container.addProperty(identifier: "product[row]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.9529411764705882, green: 0.9647058823529412, blue: 0.9764705882352941, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "product[row]/divider/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0))
                    ]
                }
                container.addProperty(identifier: "product[row]/tag-primary[highlighted]/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 0.9294117647058824, blue: 0.9294117647058824, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "products/button-filters[selected]/title") {
                    return [
                            .textColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 12)!),
                            .textCase(.none)
                    ]
                }
                container.addProperty(identifier: "products/subtitle") {
                    return [
                            .textColor(UIColor(red: 0.5637555248790429, green: 0.5747846262623333, blue: 0.6351902173913043, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 10)!),
                            .textCase(.uppercase),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "products/title") {
                    return [
                            .textColor(UIColor(red: 0.3158311964556201, green: 0.3359064695705046, blue: 0.4362828351449275, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 18)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "progress-item/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.2416911423206329, green: 0.3955334424972533, blue: 0.8134821057319641, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "progress-item[10]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.2647363887810559, green: 0.729110054347826, blue: 0, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "progress-item[1]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.6909816576086957, green: 0, blue: 0, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "progress-item[2]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.7686274509803921, green: 0.2156862745098039, blue: 0, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "progress-item[3]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.8156862745098039, green: 0.3490196078431372, blue: 0, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "progress-item[4]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.8705882352941177, green: 0.4980392156862745, blue: 0, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "progress-item[5]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.8784313725490196, green: 0.5686274509803921, blue: 0, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "progress-item[6]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.8823529411764706, green: 0.6313725490196078, blue: 0, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "progress-item[7]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.8862745098039215, green: 0.6941176470588235, blue: 0, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "progress-item[8]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.788235294117647, green: 0.7294117647058823, blue: 0, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "progress-item[9]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.5764705882352941, green: 0.7294117647058823, blue: 0, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "progress-item[disabled]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.9529411764705882, green: 0.9647058823529412, blue: 0.9764705882352941, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "pulldown-item/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0))
                    ]
                }
                container.addProperty(identifier: "pulldown-item/divider/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.9077244400978088, green: 0.907855212688446, blue: 0.9145901799201965, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "pulldown-item/title") {
                    return [
                            .textColor(UIColor(red: 0.1235505566000938, green: 0.1434680819511414, blue: 0.2327242195606232, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 17)!),
                            .textCase(.none),
                            .kerning(0.2125)
                    ]
                }
                container.addProperty(identifier: "pulldown-item[alert]/title") {
                    return [
                            .textColor(UIColor(red: 0.7333333333333333, green: 0.04705882352941176, blue: 0.04705882352941176, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 17)!),
                            .textCase(.none),
                            .kerning(0.2125)
                    ]
                }
                container.addProperty(identifier: "pulldown-item[disabled]/title") {
                    return [
                            .textColor(UIColor(red: 0.6451665204757091, green: 0.6704461349535847, blue: 0.7370923913043478, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 17)!),
                            .textCase(.none),
                            .kerning(0.2125)
                    ]
                }
                container.addProperty(identifier: "pulldown/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "qr-code/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "qr-code/overlay") {
                    return [
                            .backgroundColor(UIColor(red: 0.1254901960784314, green: 0.1450980392156863, blue: 0.2313725490196079, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "rating-details/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0))
                    ]
                }
                container.addProperty(identifier: "rating-details/body") {
                    return [
                            .textColor(UIColor(red: 0.03137254901960784, green: 0.08235294117647061, blue: 0.2235294117647059, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Medium", size: 15)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "rating-details/button-tertiary/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0))
                    ]
                }
                container.addProperty(identifier: "rating-details/subtitle") {
                    return [
                            .textColor(UIColor(red: 0.5637555248790429, green: 0.5747846262623333, blue: 0.6351902173913043, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Regular", size: 12)!),
                            .textCase(.uppercase),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "rating-details/title") {
                    return [
                            .textColor(UIColor(red: 0.0316441059112549, green: 0.0821874663233757, blue: 0.2236494719982147, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 28)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "search/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.1490196078431373, green: 0.2823529411764706, blue: 0.4313725490196079, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "search/title") {
                    return [
                            .textColor(UIColor(red: 0.4862745098039216, green: 0.5686274509803921, blue: 0.6588235294117647, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 16)!),
                            .textCase(.none)
                    ]
                }
                container.addProperty(identifier: "search[highlighted]/title") {
                    return [
                            .textColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 16)!),
                            .textCase(.none)
                    ]
                }
                container.addProperty(identifier: "searchbar/background") {
                    return [
                            .backgroundColor(UIColor(red: 0, green: 0.1568627450980392, blue: 0.3333333333333333, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "searchbar/divider/background") {
                    return [
                            .backgroundColor(UIColor(red: 0, green: 0.1568627450980392, blue: 0.3333333333333333, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "signature/button-tertiary/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "signature[disabled]/subtitle") {
                    return [
                            .textColor(UIColor(red: 0.8196078431372549, green: 0.8352941176470589, blue: 0.8705882352941177, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 14)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "spinner/background") {
                    return [
                            .backgroundColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "stat-item/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.9529411764705882, green: 0.9647058823529412, blue: 0.9764705882352941, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "stat-item/subtitle") {
                    return [
                            .textColor(UIColor(red: 0.3158311964556201, green: 0.3359064695705046, blue: 0.4362828351449275, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 12)!),
                            .textCase(.none)
                    ]
                }
                container.addProperty(identifier: "stat-item/title") {
                    return [
                            .textColor(UIColor(red: 0.0862284079194069, green: 0.1764871180057525, blue: 0.3058399856090546, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Medium", size: 13)!),
                            .textCase(.none)
                    ]
                }
                container.addProperty(identifier: "status-bar/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "stepper/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.9686274509803922, green: 0.9803921568627451, blue: 1, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "subheading/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "subheading/title") {
                    return [
                            .textColor(UIColor(red: 0.5647058823529412, green: 0.5764705882352941, blue: 0.6352941176470588, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 15)!),
                            .textCase(.uppercase),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "subheading[error]/divider/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.7333333333333333, green: 0.04705882352941176, blue: 0.04705882352941176, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "subheading[error]/title") {
                    return [
                            .textColor(UIColor(red: 0.7333333333333333, green: 0.04705882352941176, blue: 0.04705882352941176, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 15)!),
                            .textCase(.uppercase),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "subtitle") {
                    return [
                            .textColor(UIColor(red: 0.387256532907486, green: 0.399604320526123, blue: 0.4638417959213257, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 14)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "tabbar/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.9761974215507507, green: 0.9524833559989929, blue: 0.9352091550827026, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "tabbar/divider/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.9761974215507507, green: 0.9524833559989929, blue: 0.9352091550827026, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "tablet/product[info]/title") {
                    return [
                            .textColor(UIColor(red: 0.1235505566000938, green: 0.1434680819511414, blue: 0.2327242195606232, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 28)!),
                            .textCase(.none),
                            .kerning(0.3111111111111112)
                    ]
                }
                container.addProperty(identifier: "tabswitch/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "tag-primary-icon/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.1235505566000938, green: 0.1434680819511414, blue: 0.2327242195606232, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "tag-primary/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.1235505566000938, green: 0.1434680819511414, blue: 0.2327242195606232, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "tag-primary/title") {
                    return [
                            .textColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Medium", size: 11)!),
                            .textCase(.uppercase),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "tag-primary[highlighted]/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 0.9291539634146342, blue: 0.9291539634146342, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "tag-primary[highlighted]/title") {
                    return [
                            .textColor(UIColor(red: 0.8157835144927537, green: 0.03726053895272732, blue: 0.03726053895272732, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Medium", size: 11)!),
                            .textCase(.uppercase),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "tag-secondary/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.9058823529411765, green: 0.9254901960784314, blue: 0.9490196078431372, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "tag-secondary/title") {
                    return [
                            .textColor(UIColor(red: 0.3158311964556201, green: 0.3359064695705046, blue: 0.4362828351449275, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Medium", size: 11)!),
                            .textCase(.uppercase),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "tag-secondary[add]/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "tag-secondary[add]/title") {
                    return [
                            .textColor(UIColor(red: 0.2729257804227005, green: 0.6959918478260869, blue: 0.03436261120830849, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Medium", size: 11)!),
                            .textCase(.uppercase),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "tag-secondary[alert]/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 0.9294117647058824, blue: 0.9294117647058824, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "tag-secondary[alert]/title") {
                    return [
                            .textColor(UIColor(red: 0.8169157608695652, green: 0.0360635435957508, blue: 0.0360635435957508, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Medium", size: 11)!),
                            .textCase(.uppercase),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "tag-secondary[appointments]/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "tag-secondary[appointments]/title") {
                    return [
                            .textColor(UIColor(red: 0.9138360507246377, green: 0.2727229463881341, blue: 0.2727229463881341, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Medium", size: 11)!),
                            .textCase(.uppercase),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "tag-secondary[consultation]/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "tag-secondary[consultation]/title") {
                    return [
                            .textColor(UIColor(red: 0.2729257804227005, green: 0.6959918478260869, blue: 0.03436261120830849, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Medium", size: 11)!),
                            .textCase(.uppercase),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "tag-secondary[delete]/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "tag-secondary[delete]/title") {
                    return [
                            .textColor(UIColor(red: 0.8169157608695652, green: 0.03606354359575079, blue: 0.03606354359575079, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Medium", size: 11)!),
                            .textCase(.uppercase),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "tag-secondary[important]/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "tag-secondary[important]/title") {
                    return [
                            .textColor(UIColor(red: 0.7735790307971014, green: 0.5994698570164838, blue: 0, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Medium", size: 11)!),
                            .textCase(.uppercase),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "tag-secondary[newsletter]/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "tag-secondary[newsletter]/title") {
                    return [
                            .textColor(UIColor(red: 0.7487076436673799, green: 0.03147800029779631, blue: 0.782608695652174, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Medium", size: 11)!),
                            .textCase(.uppercase),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "tag-secondary[outreaches]/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "tag-secondary[outreaches]/title") {
                    return [
                            .textColor(UIColor(red: 0.1586224422993804, green: 0.371509796754635, blue: 0.8871716485507246, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Medium", size: 11)!),
                            .textCase(.uppercase),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "tag-secondary[transactions]/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "tag-secondary[transactions]/title") {
                    return [
                            .textColor(UIColor(red: 0.8169157608695652, green: 0.03606354359575079, blue: 0.03606354359575079, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Medium", size: 11)!),
                            .textCase(.uppercase),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "tag-secondary[update]/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "tag-secondary[update]/title") {
                    return [
                            .textColor(UIColor(red: 0.1586224422993804, green: 0.371509796754635, blue: 0.8871716485507246, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Medium", size: 11)!),
                            .textCase(.uppercase),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "tag-status/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0.95))
                    ]
                }
                container.addProperty(identifier: "tag-status/title") {
                    return [
                            .textColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Medium", size: 11)!),
                            .textCase(.uppercase),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "tag-status[10]/indicator/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.2647363887810559, green: 0.729110054347826, blue: 0, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "tag-status[1]/indicator/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.6909816576086957, green: 0, blue: 0, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "tag-status[2]/indicator/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.7686274509803921, green: 0.2156862745098039, blue: 0, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "tag-status[3]/indicator/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.8156862745098039, green: 0.3490196078431372, blue: 0, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "tag-status[4]/indicator/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.8705882352941177, green: 0.4980392156862745, blue: 0, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "tag-status[5]/indicator/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.8784313725490196, green: 0.5686274509803921, blue: 0, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "tag-status[6]/indicator/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.8823529411764706, green: 0.6313725490196078, blue: 0, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "tag-status[7]/indicator/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.8862745098039215, green: 0.6941176470588235, blue: 0, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "tag-status[8]/indicator/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.788235294117647, green: 0.7294117647058823, blue: 0, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "tag-status[9]/indicator/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.5764705882352941, green: 0.7294117647058823, blue: 0, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "tag-status[expired]/indicator/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.2172780797101449, green: 0.2172780797101449, blue: 0.2172780797101449, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "tag-status[on-demand]/indicator/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.9940557065217391, green: 0.7661099119382088, blue: 0.123916014330511, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "tag-status[out-of-stock]/indicator/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.7932518115942029, green: 0, blue: 0, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "tasks/block[icon-selected]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.9529411764705882, green: 0.9647058823529412, blue: 0.9764705882352941, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "tasks/block[icon]/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "tile/info/title") {
                    return [
                            .textColor(UIColor(red: 0.387256532907486, green: 0.399604320526123, blue: 0.4638417959213257, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Regular", size: 14)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "tile/subtitle") {
                    return [
                            .textColor(UIColor(red: 0.387256532907486, green: 0.399604320526123, blue: 0.4638417959213257, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Regular", size: 14)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "tile/tag-primary-icon/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "tile/title") {
                    return [
                            .textColor(UIColor(red: 0.1235505566000938, green: 0.1434680819511414, blue: 0.2327242195606232, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 15)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "time-picker/underlay") {
                    return [
                            .backgroundColor(UIColor(red: 0.9628623188405797, green: 0.9628623188405797, blue: 0.9628623188405797, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "timeline-actions/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.9058823529411765, green: 0.9254901960784314, blue: 0.9490196078431372, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "timeline-actions/button-tertiary/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "timeline-actions/button-tertiary/title") {
                    return [
                            .textColor(UIColor(red: 0.4156862745098039, green: 0.6039215686274509, blue: 0.04313725490196078, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Medium", size: 12)!),
                            .textCase(.uppercase),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "timeline-actions/button-tertiary[error]/title") {
                    return [
                            .textColor(UIColor(red: 0.7333333333333333, green: 0.04705882352941176, blue: 0.04705882352941176, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Medium", size: 12)!),
                            .textCase(.uppercase),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "timeline-actions/title") {
                    return [
                            .textColor(UIColor(red: 0.1254901960784313, green: 0.1450980392156863, blue: 0.2313725490196079, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 13)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "timeline-date/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "timeline-date/subtitle") {
                    return [
                            .textColor(UIColor(red: 0.387256532907486, green: 0.399604320526123, blue: 0.4638417959213257, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Regular", size: 10)!),
                            .textCase(.uppercase),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "timeline-date/title") {
                    return [
                            .textColor(UIColor(red: 0.1235505566000938, green: 0.1434680819511414, blue: 0.2327242195606232, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Regular", size: 22)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "timeline-heading/title") {
                    return [
                            .textColor(UIColor(red: 0.3158311964556201, green: 0.3359064695705046, blue: 0.4362828351449275, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 12)!),
                            .textCase(.uppercase),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "timeline-icon/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "timeline-row/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.9529411764705882, green: 0.9647058823529412, blue: 0.9764705882352941, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "timeline-row/info/subtitle") {
                    return [
                            .textColor(UIColor(red: 0.6509803921568628, green: 0.6588235294117647, blue: 0.6941176470588235, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 13)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "timeline-row/info/title") {
                    return [
                            .textColor(UIColor(red: 0.1254901960784314, green: 0.1450980392156863, blue: 0.2313725490196079, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 13)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "timeline-row/subtitle") {
                    return [
                            .textColor(UIColor(red: 0.6509803921568628, green: 0.6588235294117647, blue: 0.6941176470588235, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 13)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "timeline-row/tag-status/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "timeline-row/title") {
                    return [
                            .textColor(UIColor(red: 0.1235505566000938, green: 0.1434680819511414, blue: 0.2327242195606232, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 17)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "timeline-row[future]/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "timeline-row[highlighted]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.8484375, green: 0.92421875, blue: 1, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "timeline-row[highlighted]/timeline-actions/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.7391043648529322, green: 0.8431940280545527, blue: 0.9454540307971014, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "title") {
                    return [
                            .textColor(UIColor(red: 0.1235505566000938, green: 0.1434680819511414, blue: 0.2327242195606232, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Regular", size: 18)!),
                            .textCase(.uppercase),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "toast/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "toast/title") {
                    return [
                            .textColor(UIColor(red: 0.3158311964556201, green: 0.3359064695705046, blue: 0.4362828351449275, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 16)!),
                            .textCase(.none),
                            .kerning(0.15)
                    ]
                }
                container.addProperty(identifier: "toast[fail]/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "toast[fail]/title") {
                    return [
                            .textColor(UIColor(red: 0.7333333333333333, green: 0.04705882352941176, blue: 0.04705882352941176, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 16)!),
                            .textCase(.none),
                            .kerning(0.15)
                    ]
                }
                container.addProperty(identifier: "toast[success]/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "toast[success]/title") {
                    return [
                            .textColor(UIColor(red: 0.4156862745098039, green: 0.6039215686274509, blue: 0.04313725490196078, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 16)!),
                            .textCase(.none),
                            .kerning(0.15)
                    ]
                }
                container.addProperty(identifier: "toggle/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.4196078431372549, green: 0.615686274509804, blue: 0.02745098039215686, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "toggle[off]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.9411764705882353, green: 0.9372549019607843, blue: 0.9294117647058824, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "toolbar/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "toolbar/button-icon-left/title") {
                    return [
                            .textColor(UIColor(red: 0.2416911423206329, green: 0.3955334424972533, blue: 0.8134821057319641, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Medium", size: 17)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "toolbar/button-icon-right/title") {
                    return [
                            .textColor(UIColor(red: 0.6510528922080994, green: 0.6585400104522705, blue: 0.6951061487197876, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Medium", size: 17)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "toolbar/title") {
                    return [
                            .textColor(UIColor(red: 0.387256532907486, green: 0.399604320526123, blue: 0.4638417959213257, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Medium", size: 14)!),
                            .textCase(.uppercase),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "toolbar[search]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.9568627450980391, green: 0.9529411764705882, blue: 0.9529411764705882, alpha: 0))
                    ]
                }
                container.addProperty(identifier: "toolbar[tabs]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.9568627450980391, green: 0.9529411764705882, blue: 0.9529411764705882, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "totals/info/title") {
                    return [
                            .textColor(UIColor(red: 0.3158311964556201, green: 0.3359064695705046, blue: 0.4362828351449275, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 15)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "totals/info[label-highlighted]/title") {
                    return [
                            .textColor(UIColor(red: 0.3158311964556201, green: 0.3359064695705046, blue: 0.4362828351449275, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Semibold", size: 15)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "transaction-details/body") {
                    return [
                            .textColor(UIColor(red: 0.3158311964556201, green: 0.3359064695705046, blue: 0.4362828351449275, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Regular", size: 16)!),
                            .textCase(.none),
                            .kerning(0.2133333333333333)
                    ]
                }
                container.addProperty(identifier: "transaction-details/button-tertiary/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "transaction-details/divider/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "transaction-details/subtitle") {
                    return [
                            .textColor(UIColor(red: 0.5637555248790429, green: 0.5747846262623333, blue: 0.6351902173913043, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Regular", size: 12)!),
                            .textCase(.uppercase),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "transaction-details/tag-status/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0.95))
                    ]
                }
                container.addProperty(identifier: "transaction-details/title") {
                    return [
                            .textColor(UIColor(red: 0.0316441059112549, green: 0.0821874663233757, blue: 0.2236494719982147, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 28)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "tray/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.9764705882352941, green: 0.9529411764705882, blue: 0.9333333333333333, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "tray/divider/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.9168081974637681, green: 0.8922174486532165, blue: 0.8716491046580546, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "tray/image/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.9040878684245136, green: 0.9260447267847206, blue: 0.9480015851449275, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "tray/title") {
                    return [
                            .textColor(UIColor(red: 0.1235505566000938, green: 0.1434680819511414, blue: 0.2327242195606232, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 15)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "underlay") {
                    return [
                            .backgroundColor(UIColor(red: 0.9686274509803922, green: 0, blue: 0, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "widget/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.9529411764705882, green: 0.9647058823529412, blue: 0.9764705882352941, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "widget/button-tertiary/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.9529411764705882, green: 0.9647058823529412, blue: 0.9764705882352941, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "widget/button-tertiary/title") {
                    return [
                            .textColor(UIColor(red: 0.2416911423206329, green: 0.3955334424972533, blue: 0.8134821057319641, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Medium", size: 12)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "widget/info/title") {
                    return [
                            .textColor(UIColor(red: 0.387256532907486, green: 0.399604320526123, blue: 0.4638417959213257, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 14)!),
                            .textCase(.none),
                            .kerning(-0.2)
                    ]
                }
                container.addProperty(identifier: "widget/list-row/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.9529411764705882, green: 0.9647058823529412, blue: 0.9764705882352941, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "widget/list-row[task-completed]/body") {
                    return [
                            .textColor(UIColor(red: 0.6510528922080994, green: 0.6585400104522705, blue: 0.6951061487197876, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 13)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "widget/list-row[task-completed]/title") {
                    return [
                            .textColor(UIColor(red: 0.6509803921568628, green: 0.6588235294117647, blue: 0.6941176470588235, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 14)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "widget/list-row[task]/body") {
                    return [
                            .textColor(UIColor(red: 0.6510528922080994, green: 0.6585400104522705, blue: 0.6951061487197876, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 13)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "widget/list-row[task]/title") {
                    return [
                            .textColor(UIColor(red: 0.387256532907486, green: 0.399604320526123, blue: 0.4638417959213257, alpha: 1)),
                            .font(UIFont(name: "SFProDisplay-Regular", size: 14)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "widget/progress-item[disabled]/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "widget/subtitle") {
                    return [
                            .textColor(UIColor(red: 0.387256532907486, green: 0.399604320526123, blue: 0.4638417959213257, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 14)!),
                            .textCase(.none),
                            .kerning(-0.2)
                    ]
                }
                container.addProperty(identifier: "widget/title") {
                    return [
                            .textColor(UIColor(red: 0.1235505566000938, green: 0.1434680819511414, blue: 0.2327242195606232, alpha: 1)),
                            .font(UIFont(name: "AvenirNext-Medium", size: 20)!),
                            .textCase(.none),
                            .kerning(-0.2)
                    ]
                }

        return container
    }
}

/// Casing support to enable casing in iOS 14 only.
extension TextCase {
    @available(iOS 14, *)
    var toSwiftUICase: Text.Case? {
        switch self {
        case .uppercase:
            return .uppercase
        case .lowercase:
            return .lowercase
        case .none:
            return nil
        }
    }
}

extension View {
    // Is there a better name for this?
    @ViewBuilder
    func withTextCase(_ casing: TextCase) -> some View {
        if #available(iOS 14, *) {
            self.textCase(casing.toSwiftUICase)
        } else {
            self
        }
    }
}

// Adds support for rounding a specific corner

struct RoundedCorners: Shape {
    var tl: CGFloat = 0.0
    var tr: CGFloat = 0.0
    var bl: CGFloat = 0.0
    var br: CGFloat = 0.0

    func path(in rect: CGRect) -> Path {
        var path = Path()

        let w = rect.size.width
        let h = rect.size.height

        // Make sure we do not exceed the size of the rectangle
        let tr = min(min(self.tr, h/2), w/2)
        let tl = min(min(self.tl, h/2), w/2)
        let bl = min(min(self.bl, h/2), w/2)
        let br = min(min(self.br, h/2), w/2)

        path.move(to: CGPoint(x: w / 2.0, y: 0))
        path.addLine(to: CGPoint(x: w - tr, y: 0))
        path.addArc(center: CGPoint(x: w - tr, y: tr), radius: tr,
                    startAngle: Angle(degrees: -90), endAngle: Angle(degrees: 0), clockwise: false)

        path.addLine(to: CGPoint(x: w, y: h - br))
        path.addArc(center: CGPoint(x: w - br, y: h - br), radius: br,
                    startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 90), clockwise: false)

        path.addLine(to: CGPoint(x: bl, y: h))
        path.addArc(center: CGPoint(x: bl, y: h - bl), radius: bl,
                    startAngle: Angle(degrees: 90), endAngle: Angle(degrees: 180), clockwise: false)

        path.addLine(to: CGPoint(x: 0, y: tl))
        path.addArc(center: CGPoint(x: tl, y: tl), radius: tl,
                    startAngle: Angle(degrees: 180), endAngle: Angle(degrees: 270), clockwise: false)
        path.closeSubpath()

        return path
    }
}

// Add support for themes
extension Theme {
    static let dark = Theme(name: "dark")
}

public extension StrokeStyle {
    init(lineWidth: CGFloat? = nil,
         lineCap: CGLineCap? = nil,
         lineJoin: CGLineJoin? = nil,
         miterLimit: CGFloat? = nil,
         dash: [CGFloat]? = nil,
         dashPhase: CGFloat? = nil) {
        self.init(lineWidth: lineWidth ?? 1,
                  lineCap: lineCap ?? .butt,
                  lineJoin: lineJoin ?? .miter,
                  miterLimit: miterLimit ?? 10,
                  dash: dash ?? [],
                  dashPhase: dashPhase ?? 0)
    }
}

#endif
// swiftlint:enable all
