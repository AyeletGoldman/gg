import Foundation
import SwiftUI
import StylableSwiftUI

/*
 * THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
 * IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
 * YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
 */

// swiftlint:disable all
extension Stylist {
    static func create() -> Stylist {

        let stylist = Stylist()

        stylist.addStyle(identifier: "accordion/body") {
            $0
                .styleText { text in
                    text
                        .tracking(0.1866666666666667)
                }
                .font(Font.custom("Graphik-Regular", size: 14))
                .foregroundColor(Color(red: 0.18, green: 0.18, blue: 0.18, opacity: 1))
                .lineSpacing(5)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "accordion/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.09230769230769233)
                }
                .font(Font.custom("Graphik-Semibold", size: 12))
                .foregroundColor(Color(red: 0.18, green: 0.18, blue: 0.18, opacity: 1))
                .lineSpacing(5)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "alert/title") {
            $0
                .font(Font.custom("Graphik-Semibold", size: 14))
                .foregroundColor(Color(red: 0.18, green: 0.18, blue: 0.18, opacity: 1))
                .lineSpacing(4)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 1))
        }
        stylist.addStyle(identifier: "badge/background") {
            $0
                .background(Color(red: 0.9, green: 0.15, blue: 0.18, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 4))
        }
        stylist.addStyle(identifier: "badge/title") {
            $0
                .styleText { text in
                    text
                        .tracking(-0.4545454545454545)
                }
                .font(Font.custom("Graphik-Regular", size: 10))
                .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .lineSpacing(-2)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "banners/background") {
            $0
                .background(Color(red: 0.97, green: 0.97, blue: 0.97, opacity: 1))
        }
        stylist.addStyle(identifier: "banners/divider/background") {
            $0
                .background(Color(red: 0.97, green: 0.97, blue: 0.97, opacity: 1))
        }
        stylist.addStyle(identifier: "banners/title") {
            $0
                .font(Font.custom("Graphik-Regular", size: 12.5))
                .foregroundColor(Color(red: 0, green: 0, blue: 0, opacity: 1))
                .lineSpacing(1.5)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "block-stats/background") {
            $0
                .background(Color(red: 0.97, green: 0.97, blue: 0.97, opacity: 1))
        }
        stylist.addStyle(identifier: "block-stats/body") {
            $0
                .styleText { text in
                    text
                        .tracking(-0.3888888888888888)
                }
                .font(Font.custom("Graphik-Semibold", size: 28))
                .foregroundColor(Color(red: 0.18, green: 0.18, blue: 0.18, opacity: 1))
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "block-stats/subtitle") {
            $0
                .font(Font.custom("Graphik-Regular", size: 8.5))
                .foregroundColor(Color(red: 0.18, green: 0.18, blue: 0.18, opacity: 1))
                .lineSpacing(3.5)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "block-stats/title") {
            $0
                .styleText { text in
                    text
                        .tracking(-0.1)
                }
                .font(Font.custom("Graphik-Semibold", size: 10))
                .foregroundColor(Color(red: 0.18, green: 0.18, blue: 0.18, opacity: 1))
                .lineSpacing(1)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "block-stats[circle-wide]/body") {
            $0
                .styleText { text in
                    text
                        .tracking(-0.3823529411764706)
                }
                .font(Font.custom("Graphik-Semibold", size: 26))
                .foregroundColor(Color(red: 0.18, green: 0.18, blue: 0.18, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "block-stats[circle-wide]/subtitle") {
            $0
                .font(Font.custom("Graphik-Regular", size: 15))
                .foregroundColor(Color(red: 0.18, green: 0.18, blue: 0.18, opacity: 1))
                .lineSpacing(1)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "block-stats[circle3-wide]/body") {
            $0
                .font(Font.custom("Graphik-Semibold", size: 11.5))
                .foregroundColor(Color(red: 0.12, green: 0.14, blue: 0.23, opacity: 1))
                .lineSpacing(1.5)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "block-stats[circle3-wide]/subtitle") {
            $0
                .styleText { text in
                    text
                        .tracking(0.1769230769230769)
                }
                .font(Font.custom("Graphik-Regular", size: 11.5))
                .foregroundColor(Color(red: 0.18, green: 0.18, blue: 0.18, opacity: 1))
                .lineSpacing(1.5)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.uppercase)
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
        stylist.addStyle(identifier: "block/subtitle") {
            $0
                .styleText { text in
                    text
                        .tracking(-0.2)
                }
                .font(Font.custom("SFProDisplay-Medium", size: 10))
                .foregroundColor(Color(red: 0.39, green: 0.4, blue: 0.46, opacity: 1))
                .lineSpacing(4)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "block/title") {
            $0
                .styleText { text in
                    text
                        .tracking(-0.17)
                }
                .font(Font.custom("Graphik-Semibold", size: 17))
                .foregroundColor(Color(red: 0.13, green: 0.15, blue: 0.23, opacity: 1))
                .lineSpacing(7)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "block[available-hide]/subtitle") {
            $0
                .font(Font.custom("Graphik-Regular", size: 10))
                .foregroundColor(Color(red: 0.18, green: 0.18, blue: 0.18, opacity: 1))
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
                .font(Font.custom("Graphik-Regular", size: 10))
                .foregroundColor(Color(red: 0.18, green: 0.18, blue: 0.18, opacity: 1))
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "block[available]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.1333333333333332)
                }
                .font(Font.custom("Graphik-Semibold", size: 20))
                .foregroundColor(Color(red: 0.18, green: 0.18, blue: 0.18, opacity: 1))
                .lineSpacing(7)
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
                .font(Font.custom("Graphik-Regular", size: 10))
                .foregroundColor(Color(red: 0.73, green: 0.73, blue: 0.73, opacity: 1))
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
                .font(Font.custom("Graphik-Regular", size: 10))
                .foregroundColor(Color(red: 0.18, green: 0.18, blue: 0.18, opacity: 1))
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "block[out-of-stock]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.1333333333333332)
                }
                .font(Font.custom("Graphik-Semibold", size: 20))
                .foregroundColor(Color(red: 0.9, green: 0.15, blue: 0.18, opacity: 1))
                .lineSpacing(7)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "body") {
            $0
                .styleText { text in
                    text
                        .tracking(0.5)
                }
                .font(Font.custom("Graphik-Regular", size: 12))
                .foregroundColor(Color(red: 0.16, green: 0.16, blue: 0.16, opacity: 1))
                .lineSpacing(4)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "button-action-row/background") {
            $0
                .background(Color(red: 0.97, green: 0.97, blue: 0.97, opacity: 1))
        }
        stylist.addStyle(identifier: "button-action-row/subtitle") {
            $0
                .styleText { text in
                    text
                        .tracking(0.1714285714285715)
                }
                .font(Font.custom("Graphik-Regular", size: 12))
                .foregroundColor(Color(red: 0.18, green: 0.18, blue: 0.18, opacity: 1))
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
                .font(Font.custom("Graphik-Regular", size: 10))
                .foregroundColor(Color(red: 0.73, green: 0.73, blue: 0.73, opacity: 1))
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "button-action-row/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.1529411764705882)
                }
                .font(Font.custom("Graphik-Semibold", size: 13))
                .foregroundColor(Color(red: 0.18, green: 0.18, blue: 0.18, opacity: 1))
                .lineSpacing(5)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "button-alert/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(Color(red: 0.9, green: 0.15, blue: 0.18, opacity: 1), style: StrokeStyle(lineWidth: 2, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        stylist.addStyle(identifier: "button-alert/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.16)
                }
                .font(Font.custom("Graphik-Semibold", size: 14))
                .foregroundColor(Color(red: 0.9, green: 0.15, blue: 0.18, opacity: 1))
                .lineSpacing(5)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "button-filters-avatar/background") {
            $0
                .background(Color(red: 0.81, green: 0.81, blue: 0.81, opacity: 1).overlay(Image("853732577995ec08625706620b0235b0184b90e8", bundle: nil).resizable().aspectRatio(contentMode: .fill)))
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        stylist.addStyle(identifier: "button-filters-avatar/subtitle") {
            $0
                .font(Font.custom("Graphik-Semibold", size: 28))
                .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .lineSpacing(10)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "button-filters-avatar/title") {
            $0
                .styleText { text in
                    text
                        .tracking(-0.2)
                }
                .font(Font.custom("Graphik-Regular", size: 14))
                .foregroundColor(Color(red: 0.12, green: 0.14, blue: 0.23, opacity: 1))
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
                .font(Font.custom("Graphik-Regular", size: 14))
                .foregroundColor(Color(red: 0, green: 0, blue: 0, opacity: 1))
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "button-filters-multi/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .overlay(RoundedRectangle(cornerRadius: 16).strokeBorder(Color(red: 0.91, green: 0.91, blue: 0.92, opacity: 1), style: StrokeStyle(lineWidth: 1, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
                .clipShape(RoundedRectangle(cornerRadius: 16))
        }
        stylist.addStyle(identifier: "button-filters-multi/title") {
            $0
                .font(Font.custom("Graphik-Regular", size: 12))
                .foregroundColor(Color(red: 0.18, green: 0.18, blue: 0.18, opacity: 1))
                .lineSpacing(4)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "button-filters-multi[selected]/background") {
            $0
                .background(Color(red: 0.18, green: 0.18, blue: 0.18, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 16))
        }
        stylist.addStyle(identifier: "button-filters-multi[selected]/title") {
            $0
                .font(Font.custom("Graphik-Regular", size: 12))
                .foregroundColor(Color(red: 0.18, green: 0.18, blue: 0.18, opacity: 1))
                .lineSpacing(4)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "button-filters/background") {
            $0
                .background(Color(red: 0.97, green: 0.97, blue: 0.97, opacity: 1))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(Color(red: 0.97, green: 0.97, blue: 0.97, opacity: 1), style: StrokeStyle(lineWidth: 1, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        stylist.addStyle(identifier: "button-filters/title") {
            $0
                .font(Font.custom("Graphik-Semibold", size: 11))
                .foregroundColor(Color(red: 0, green: 0, blue: 0, opacity: 1))
                .lineSpacing(5)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "button-filters[selected]/background") {
            $0
                .background(Color(red: 0.18, green: 0.18, blue: 0.18, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        stylist.addStyle(identifier: "button-filters[selected]/title") {
            $0
                .font(Font.custom("Graphik-Semibold", size: 11))
                .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .lineSpacing(5)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.uppercase)
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
                .font(Font.custom("Graphik-Semibold", size: 12))
                .foregroundColor(Color(red: 0.18, green: 0.18, blue: 0.18, opacity: 1))
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
                .font(Font.custom("Graphik-Regular", size: 12))
                .foregroundColor(Color(red: 0.73, green: 0.73, blue: 0.73, opacity: 1))
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
                        .tracking(0.1764705882352941)
                }
                .font(Font.custom("Graphik-Regular", size: 15))
                .foregroundColor(Color(red: 0.18, green: 0.18, blue: 0.18, opacity: 1))
                .lineSpacing(5)
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
                .background(Color(red: 0.9, green: 0.15, blue: 0.18, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 4))
        }
        stylist.addStyle(identifier: "button-icon-right/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.1764705882352941)
                }
                .font(Font.custom("Graphik-Regular", size: 15))
                .foregroundColor(Color(red: 0.18, green: 0.18, blue: 0.18, opacity: 1))
                .lineSpacing(5)
                .multilineTextAlignment(.trailing)
                .frame(alignment: .trailing)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "button-icon-right[disabled]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.1764705882352941)
                }
                .font(Font.custom("Graphik-Regular", size: 15))
                .foregroundColor(Color(red: 0.73, green: 0.73, blue: 0.73, opacity: 1))
                .lineSpacing(5)
                .multilineTextAlignment(.trailing)
                .frame(alignment: .trailing)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "button-login /title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("Graphik-Semibold", size: 14))
                .foregroundColor(Color(red: 0.18, green: 0.18, blue: 0.18, opacity: 1))
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "button-primary/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(Color(red: 0.18, green: 0.18, blue: 0.18, opacity: 1), style: StrokeStyle(lineWidth: 2, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        stylist.addStyle(identifier: "button-primary/title") {
            $0
                .font(Font.custom("Graphik-Semibold", size: 14))
                .foregroundColor(Color(red: 0.18, green: 0.18, blue: 0.18, opacity: 1))
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "button-primary[disabled]/background") {
            $0
                .background(Color(red: 0.97, green: 0.97, blue: 0.97, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        stylist.addStyle(identifier: "button-primary[disabled]/title") {
            $0
                .font(Font.custom("Graphik-Semibold", size: 14))
                .foregroundColor(Color(red: 0.73, green: 0.73, blue: 0.73, opacity: 1))
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "button-primary[highlighted]/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(Color(red: 0.9, green: 0.15, blue: 0.18, opacity: 1), style: StrokeStyle(lineWidth: 1, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        stylist.addStyle(identifier: "button-secondary/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(Color(red: 0, green: 0, blue: 0, opacity: 1), style: StrokeStyle(lineWidth: 2, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        stylist.addStyle(identifier: "button-secondary/title") {
            $0
                .font(Font.custom("Graphik-Semibold", size: 14))
                .foregroundColor(Color(red: 0.18, green: 0.18, blue: 0.18, opacity: 1))
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "button-secondary[disabled]/background") {
            $0
                .background(Color(red: 0.97, green: 0.97, blue: 0.97, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        stylist.addStyle(identifier: "button-secondary[disabled]/title") {
            $0
                .font(Font.custom("Graphik-Semibold", size: 14))
                .foregroundColor(Color(red: 0.73, green: 0.73, blue: 0.73, opacity: 1))
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "button-secondary[highlighted]/background") {
            $0
                .background(Color(red: 0.18, green: 0.18, blue: 0.18, opacity: 0.8))
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        stylist.addStyle(identifier: "button-secondary[highlighted]/title") {
            $0
                .font(Font.custom("Graphik-Semibold", size: 14))
                .foregroundColor(Color(red: 0, green: 0, blue: 0, opacity: 1))
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "button-swipe[alert]/background") {
            $0
                .background(Color(red: 0.9, green: 0.15, blue: 0.18, opacity: 1))
        }
        stylist.addStyle(identifier: "button-tabbar/badge/background") {
            $0
                .background(Color(red: 0.73, green: 0.05, blue: 0.05, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 4))
        }
        stylist.addStyle(identifier: "button-tabbar/title") {
            $0
                .font(Font.custom("Graphik-Semibold", size: 10))
                .foregroundColor(Color(red: 0.18, green: 0.18, blue: 0.18, opacity: 1))
                .lineSpacing(8)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "button-tabbar[disabled]/title") {
            $0
                .font(Font.custom("Graphik-Regular", size: 10))
                .foregroundColor(Color(red: 0.18, green: 0.18, blue: 0.18, opacity: 1))
                .lineSpacing(8)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "button-tabs/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 1))
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
                .font(Font.custom("Graphik-Regular", size: 10))
                .foregroundColor(Color(red: 0, green: 0, blue: 0, opacity: 0.8))
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
                .font(Font.custom("Graphik-Semibold", size: 20))
                .foregroundColor(Color(red: 0, green: 0, blue: 0, opacity: 0.8))
                .lineSpacing(7)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "button-tabs[selected]/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 1))
        }
        stylist.addStyle(identifier: "button-tabs[selected]/divider/background") {
            $0
                .background(Color(red: 0, green: 0, blue: 0, opacity: 1))
        }
        stylist.addStyle(identifier: "button-tabs[selected]/subtitle") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("Graphik-Regular", size: 10))
                .foregroundColor(Color(red: 0, green: 0, blue: 0, opacity: 1))
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
                .font(Font.custom("Graphik-Semibold", size: 20))
                .foregroundColor(Color(red: 0, green: 0, blue: 0, opacity: 1))
                .lineSpacing(7)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "button-tabswitch/background") {
            $0
                .background(Color(red: 0.93, green: 0.92, blue: 0.91, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 4))
        }
        stylist.addStyle(identifier: "button-tabswitch/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("Graphik-Regular", size: 12))
                .foregroundColor(Color(red: 0.18, green: 0.18, blue: 0.18, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "button-tabswitch[selected]/background") {
            $0
                .background(Color(red: 0, green: 0, blue: 0, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 4))
        }
        stylist.addStyle(identifier: "button-tabswitch[selected]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("Graphik-Regular", size: 12))
                .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "button-tertiary-center/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(Color(red: 0.18, green: 0.18, blue: 0.18, opacity: 1), style: StrokeStyle(lineWidth: 0, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        stylist.addStyle(identifier: "button-tertiary/background") {
            $0
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(Color(red: 0, green: 0, blue: 0, opacity: 1), style: StrokeStyle(lineWidth: 1.5, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        stylist.addStyle(identifier: "button-tertiary/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.1)
                }
                .font(Font.custom("Graphik-Semibold", size: 11))
                .foregroundColor(Color(red: 0.18, green: 0.18, blue: 0.18, opacity: 1))
                .lineSpacing(5)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "button-tertiary[highlighted]/background") {
            $0
                .background(Color(red: 0.27, green: 0.53, blue: 0.25, opacity: 0.05))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(Color(red: 0.27, green: 0.53, blue: 0.25, opacity: 1), style: StrokeStyle(lineWidth: 1.5, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        stylist.addStyle(identifier: "button-tertiary[highlighted]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.1)
                }
                .font(Font.custom("Graphik-Semibold", size: 11))
                .foregroundColor(Color(red: 0.27, green: 0.53, blue: 0.25, opacity: 1))
                .lineSpacing(5)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "button-tertiary[selected]/background") {
            $0
                .background(Color(red: 0.24, green: 0.4, blue: 0.81, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        stylist.addStyle(identifier: "button-tertiary[selected]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("Graphik-Regular", size: 12))
                .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "button-toolbar/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 0))
        }
        stylist.addStyle(identifier: "button-toolbar/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.1785714285714286)
                }
                .font(Font.custom("Graphik-Semibold", size: 12.5))
                .foregroundColor(Color(red: 0.18, green: 0.18, blue: 0.18, opacity: 1))
                .lineSpacing(6.5)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "calendar-day/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "calendar-day/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("Graphik-Regular", size: 16))
                .foregroundColor(Color(red: 0.18, green: 0.18, blue: 0.18, opacity: 1))
                .lineSpacing(3)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "calendar-day[disabled]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("Graphik-Regular", size: 16))
                .foregroundColor(Color(red: 0.73, green: 0.73, blue: 0.73, opacity: 1))
                .lineSpacing(3)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "calendar-day[selected]/background") {
            $0
                .background(Color(red: 0.05, green: 0.14, blue: 0.25, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "calendar-day[selected]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("Graphik-Regular", size: 16))
                .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .lineSpacing(3)
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
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        stylist.addStyle(identifier: "calendar/button-tertiary[highlighted]/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 0))
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        stylist.addStyle(identifier: "calendar/subtitle") {
            $0
                .styleText { text in
                    text
                        .tracking(0.1)
                }
                .font(Font.custom("Graphik-Semibold", size: 13))
                .foregroundColor(Color(red: 0.18, green: 0.18, blue: 0.18, opacity: 1))
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
                .font(Font.custom("Graphik-Regular", size: 15))
                .foregroundColor(Color(red: 0.18, green: 0.18, blue: 0.18, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "camera-view/background") {
            $0
                .background(Color(red: 0.94, green: 0.94, blue: 0.94, opacity: 1))
        }
        stylist.addStyle(identifier: "carousel/heading/divider/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 1))
        }
        stylist.addStyle(identifier: "carousel/tile/title") {
            $0
                .font(Font.custom("Graphik-Semibold", size: 11.5))
                .foregroundColor(Color(red: 0.18, green: 0.18, blue: 0.18, opacity: 1))
                .lineSpacing(1.5)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "client-row/tag-secondary/background") {
            $0
                .background(Color(red: 0.97, green: 0.97, blue: 0.97, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 4))
        }
        stylist.addStyle(identifier: "client-row/tag-secondary/title") {
            $0
                .styleText { text in
                    text
                        .tracking(-0.3272727272727273)
                }
                .font(Font.custom("Graphik-Semibold", size: 9))
                .foregroundColor(Color(red: 0, green: 0, blue: 0, opacity: 1))
                .lineSpacing(1)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "client-row/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.1529411764705882)
                }
                .font(Font.custom("Graphik-Semibold", size: 13))
                .foregroundColor(Color(red: 0.18, green: 0.18, blue: 0.18, opacity: 1))
                .lineSpacing(4)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "client-row[edit]/tag-secondary/background") {
            $0
                .background(Color(red: 0.97, green: 0.97, blue: 0.97, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 4))
        }
        stylist.addStyle(identifier: "clients[profile]/block/background") {
            $0
                .background(Color(red: 0.97, green: 0.97, blue: 0.97, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        stylist.addStyle(identifier: "clients[profile]/navbar/background") {
            $0
                .background(Color(red: 0.91, green: 0.91, blue: 0.91, opacity: 1))
        }
        stylist.addStyle(identifier: "clients[search]/navbar/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.14)
                }
                .font(Font.custom("Graphik-Semibold", size: 15))
                .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .lineSpacing(7)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "color-item/background") {
            $0
                .background(Color(red: 0.94, green: 0.94, blue: 0.94, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 2))
        }
        stylist.addStyle(identifier: "color/info/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.14)
                }
                .font(Font.custom("Graphik-Regular", size: 10))
                .foregroundColor(Color(red: 0, green: 0, blue: 0, opacity: 1))
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "dashboard/button-filters[selected]/title") {
            $0
                .font(Font.custom("Graphik-Semibold", size: 10))
                .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .lineSpacing(6)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "dashboard/subheading/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("Graphik-Regular", size: 15))
                .foregroundColor(Color(red: 0.18, green: 0.18, blue: 0.18, opacity: 1))
                .lineSpacing(4)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "date/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 1))
        }
        stylist.addStyle(identifier: "date/subtitle") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("Graphik-Regular", size: 10))
                .foregroundColor(Color(red: 0.09, green: 0.09, blue: 0.09, opacity: 1))
                .lineSpacing(4)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "date/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("Graphik-Regular", size: 22))
                .foregroundColor(Color(red: 0, green: 0, blue: 0, opacity: 1))
                .lineSpacing(8)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "disabled-toggle/background") {
            $0
                .background(Color(red: 0.85, green: 0.85, blue: 0.85, opacity: 1))
        }
        stylist.addStyle(identifier: "divider/background") {
            $0
                .background(Color(red: 0.91, green: 0.91, blue: 0.91, opacity: 1))
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
                .font(Font.custom("Graphik-Semibold", size: 11))
                .foregroundColor(Color(red: 0.18, green: 0.18, blue: 0.18, opacity: 1))
                .lineSpacing(-3)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "fab/background") {
            $0
                .background(LinearGradient(gradient: Gradient(stops:[.init(color: Color(red: 1, green: 1, blue: 1, opacity: 0), location: 0),.init(color: Color(red: 1, green: 1, blue: 1, opacity: 1), location: 1)]), startPoint: UnitPoint(x: 0.5, y: 0), endPoint: UnitPoint(x: 0.5, y: 0.55)))
        }
        stylist.addStyle(identifier: "fab/button-primary/title") {
            $0
                .font(Font.custom("Graphik-Semibold", size: 12))
                .foregroundColor(Color(red: 0, green: 0, blue: 0, opacity: 1))
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "fab/button-secondary/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(Color(red: 0.18, green: 0.18, blue: 0.18, opacity: 1), style: StrokeStyle(lineWidth: 2, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        stylist.addStyle(identifier: "fab/button-secondary/title") {
            $0
                .font(Font.custom("Graphik-Semibold", size: 12))
                .foregroundColor(Color(red: 0, green: 0, blue: 0, opacity: 1))
                .lineSpacing(-2)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "fab/divider/background") {
            $0
                .background(Color(red: 0.95, green: 0.95, blue: 0.95, opacity: 0))
        }
        stylist.addStyle(identifier: "fab/info/title") {
            $0
                .font(Font.custom("Graphik-Semibold", size: 12))
                .foregroundColor(Color(red: 0, green: 0, blue: 0, opacity: 1))
                .lineSpacing(3)
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
                .font(Font.custom("Graphik-Semibold", size: 12))
                .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .lineSpacing(4)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "form-field-title/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.1642857142857143)
                }
                .font(Font.custom("Graphik-Semibold", size: 11.5))
                .foregroundColor(Color(red: 0.13, green: 0.13, blue: 0.13, opacity: 1))
                .lineSpacing(5.5)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "form-field/badge/title") {
            $0
                .styleText { text in
                    text
                        .tracking(-0.2)
                }
                .font(Font.custom("Graphik-Regular", size: 12))
                .foregroundColor(Color(red: 0.4, green: 0.42, blue: 0.51, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
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
                        .tracking(0.1666666666666667)
                }
                .font(Font.custom("Graphik-Regular", size: 12.5))
                .foregroundColor(Color(red: 0.65, green: 0.66, blue: 0.7, opacity: 1))
                .lineSpacing(4.5)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "form-field/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.1647058823529412)
                }
                .font(Font.custom("Graphik-Regular", size: 14))
                .foregroundColor(Color(red: 0.12, green: 0.14, blue: 0.23, opacity: 1))
                .lineSpacing(6)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "form-type-image-sm/background") {
            $0
                .background(Color(red: 0.98, green: 0.98, blue: 0.98, opacity: 1).overlay(Image("5c953cc19e315c165d7ba22a7547d815284a5ccb", bundle: nil).resizable().aspectRatio(contentMode: .fill)))
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        stylist.addStyle(identifier: "form-type-image-sm/indicator/background") {
            $0
                .background(Color(red: 0.3, green: 0.82, blue: 0, opacity: 1))
                .overlay(RoundedRectangle(cornerRadius: 4).strokeBorder(Color(red: 1, green: 1, blue: 1, opacity: 1), style: StrokeStyle(lineWidth: 2, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
                .clipShape(RoundedRectangle(cornerRadius: 4))
        }
        stylist.addStyle(identifier: "form-type-image-sm/indicator[expired]/background") {
            $0
                .background(Color(red: 0.22, green: 0.22, blue: 0.22, opacity: 1))
                .overlay(RoundedRectangle(cornerRadius: 4).strokeBorder(Color(red: 1, green: 1, blue: 1, opacity: 1), style: StrokeStyle(lineWidth: 2, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
                .clipShape(RoundedRectangle(cornerRadius: 4))
        }
        stylist.addStyle(identifier: "form-type-image-sm/indicator[low-stock]/background") {
            $0
                .background(Color(red: 0.87, green: 0.5, blue: 0, opacity: 1))
                .overlay(RoundedRectangle(cornerRadius: 4).strokeBorder(Color(red: 1, green: 1, blue: 1, opacity: 1), style: StrokeStyle(lineWidth: 2, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
                .clipShape(RoundedRectangle(cornerRadius: 4))
        }
        stylist.addStyle(identifier: "form-type-image-sm/indicator[no-stock]/background") {
            $0
                .background(Color(red: 0.7, green: 0.7, blue: 0.7, opacity: 1))
                .overlay(RoundedRectangle(cornerRadius: 4).strokeBorder(Color(red: 1, green: 1, blue: 1, opacity: 1), style: StrokeStyle(lineWidth: 2, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
                .clipShape(RoundedRectangle(cornerRadius: 4))
        }
        stylist.addStyle(identifier: "form-type-image-sm/indicator[on-demand]/background") {
            $0
                .background(Color(red: 0.99, green: 0.77, blue: 0.12, opacity: 1))
                .overlay(RoundedRectangle(cornerRadius: 4).strokeBorder(Color(red: 1, green: 1, blue: 1, opacity: 1), style: StrokeStyle(lineWidth: 2, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
                .clipShape(RoundedRectangle(cornerRadius: 4))
        }
        stylist.addStyle(identifier: "form-type-image-sm/indicator[out-of-stock]/background") {
            $0
                .background(Color(red: 0.79, green: 0, blue: 0, opacity: 1))
                .overlay(RoundedRectangle(cornerRadius: 4).strokeBorder(Color(red: 1, green: 1, blue: 1, opacity: 1), style: StrokeStyle(lineWidth: 2, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
                .clipShape(RoundedRectangle(cornerRadius: 4))
        }
        stylist.addStyle(identifier: "form-type-image-sm/overlay") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 0))
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        stylist.addStyle(identifier: "form-type-image-sm/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.16)
                }
                .font(Font.custom("Graphik-Semibold", size: 12))
                .foregroundColor(Color(red: 0.13, green: 0.15, blue: 0.23, opacity: 1))
                .lineSpacing(8)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "form-type-image-sm[disabled]/overlay") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 0.6))
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        stylist.addStyle(identifier: "form-type-image-sm[disabled]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.16)
                }
                .font(Font.custom("Graphik-Semibold", size: 12))
                .foregroundColor(Color(red: 0.57, green: 0.57, blue: 0.57, opacity: 1))
                .lineSpacing(8)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "form-type-image-sm[selected]/overlay") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 0))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(Color(red: 1, green: 1, blue: 1, opacity: 1), style: StrokeStyle(lineWidth: 4, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(Color(red: 0.13, green: 0.13, blue: 0.13, opacity: 1), style: StrokeStyle(lineWidth: 2, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        stylist.addStyle(identifier: "graph-item/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "graph-item[accent]/background") {
            $0
                .background(Color(red: 0.2, green: 0.29, blue: 0.62, opacity: 1))
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
                .background(Color(red: 0.05, green: 0.14, blue: 0.25, opacity: 1))
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
                .background(Color(red: 0.98, green: 0.41, blue: 0.24, opacity: 1))
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
        stylist.addStyle(identifier: "heading/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.1578947368421053)
                }
                .font(Font.custom("Graphik-Semibold", size: 15))
                .foregroundColor(Color(red: 0.18, green: 0.18, blue: 0.18, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.uppercase)
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
                .font(Font.custom("Graphik-Regular", size: 19))
                .foregroundColor(Color(red: 0.9, green: 0.15, blue: 0.18, opacity: 1))
                .lineSpacing(-2)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "home-indicator/background") {
            $0
                .background(Color(red: 0.18, green: 0.18, blue: 0.18, opacity: 1))
        }
        stylist.addStyle(identifier: "image/background") {
            $0
                .background(Color(red: 0.97, green: 0.97, blue: 0.97, opacity: 1).overlay(Image("d1dfb56cf342436cb051370564838256ff90c98b", bundle: nil).resizable().aspectRatio(contentMode: .fill)))
        }
        stylist.addStyle(identifier: "image[highlighted]/background") {
            $0
                .background(Color(red: 0.97, green: 0.97, blue: 0.97, opacity: 1).overlay(Image("d1dfb56cf342436cb051370564838256ff90c98b", bundle: nil).resizable().aspectRatio(contentMode: .fit)))
                .overlay(RoundedRectangle(cornerRadius: 0).strokeBorder(Color(red: 0.18, green: 0.18, blue: 0.18, opacity: 1), style: StrokeStyle(lineWidth: 2, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
        }
        stylist.addStyle(identifier: "image[icon-highlighted]/background") {
            $0
                .background(Color(red: 0.97, green: 0.97, blue: 0.97, opacity: 1).overlay(Image("d1dfb56cf342436cb051370564838256ff90c98b", bundle: nil).resizable().aspectRatio(contentMode: .fit)))
                .overlay(RoundedRectangle(cornerRadius: 0).strokeBorder(Color(red: 0.18, green: 0.18, blue: 0.18, opacity: 1), style: StrokeStyle(lineWidth: 2, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
        }
        stylist.addStyle(identifier: "image[loading]/background") {
            $0
                .background(Color(red: 0.97, green: 0.97, blue: 0.97, opacity: 1).overlay(Image("316245682e462d0050363a60e6f399a71502059d", bundle: nil).resizable().aspectRatio(contentMode: .fit)))
        }
        stylist.addStyle(identifier: "indicator/background") {
            $0
                .background(Color(red: 0.42, green: 0.6, blue: 0.04, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 4))
        }
        stylist.addStyle(identifier: "info/background") {
            $0
                .background(Color(red: 0.95, green: 0.95, blue: 0.95, opacity: 0))
        }
        stylist.addStyle(identifier: "info/subtitle") {
            $0
                .styleText { text in
                    text
                        .tracking(-0.4)
                }
                .font(Font.custom("Graphik-Regular", size: 11))
                .foregroundColor(Color(red: 0.18, green: 0.18, blue: 0.18, opacity: 1))
                .lineSpacing(6)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "info/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.1466666666666667)
                }
                .font(Font.custom("Graphik-Semibold", size: 11))
                .foregroundColor(Color(red: 0.18, green: 0.18, blue: 0.18, opacity: 1))
                .lineSpacing(6)
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
                .font(Font.custom("Graphik-Semibold", size: 15))
                .foregroundColor(Color(red: 0.18, green: 0.18, blue: 0.18, opacity: 1))
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
                .clipShape(RoundedRectangle(cornerRadius: 4))
        }
        stylist.addStyle(identifier: "input/body") {
            $0
                .styleText { text in
                    text
                        .tracking(0.1666666666666667)
                }
                .font(Font.custom("Graphik-Regular", size: 12.5))
                .foregroundColor(Color(red: 0.65, green: 0.66, blue: 0.7, opacity: 1))
                .lineSpacing(4.5)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "input/button-tertiary/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        stylist.addStyle(identifier: "input/carousel/background") {
            $0
                .background(Color(red: 0.98, green: 0.98, blue: 0.98, opacity: 1).overlay(Image("d1dfb56cf342436cb051370564838256ff90c98b", bundle: nil).resizable().aspectRatio(contentMode: .fill)))
                .overlay(RoundedRectangle(cornerRadius: 15).strokeBorder(Color(red: 1, green: 1, blue: 1, opacity: 1), style: StrokeStyle(lineWidth: 1, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
                .clipShape(RoundedRectangle(cornerRadius: 15))
        }
        stylist.addStyle(identifier: "input/carousel/indicator/background") {
            $0
                .background(Color(red: 0.3, green: 0.82, blue: 0, opacity: 1))
                .overlay(RoundedRectangle(cornerRadius: 4).strokeBorder(Color(red: 1, green: 1, blue: 1, opacity: 1), style: StrokeStyle(lineWidth: 2, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
                .clipShape(RoundedRectangle(cornerRadius: 4))
        }
        stylist.addStyle(identifier: "input/carousel/overlay") {
            $0
                .overlay(RoundedRectangle(cornerRadius: 15).strokeBorder(Color(red: 1, green: 1, blue: 1, opacity: 1), style: StrokeStyle(lineWidth: 2, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
                .clipShape(RoundedRectangle(cornerRadius: 15))
        }
        stylist.addStyle(identifier: "input/carousel[disabled]/overlay") {
            $0
                .background(Color(red: 0.98, green: 0.98, blue: 0.98, opacity: 0.900197))
                .overlay(RoundedRectangle(cornerRadius: 15).strokeBorder(Color(red: 1, green: 1, blue: 1, opacity: 1), style: StrokeStyle(lineWidth: 2, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
                .clipShape(RoundedRectangle(cornerRadius: 15))
        }
        stylist.addStyle(identifier: "input/carousel[disabled]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.1294117647058823)
                }
                .font(Font.custom("Graphik-Semibold", size: 11))
                .foregroundColor(Color(red: 0.56, green: 0.56, blue: 0.56, opacity: 1))
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "input/carousel[selected]/overlay") {
            $0
                .overlay(RoundedRectangle(cornerRadius: 15).strokeBorder(Color(red: 1, green: 1, blue: 1, opacity: 1), style: StrokeStyle(lineWidth: 4, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
                .overlay(RoundedRectangle(cornerRadius: 15).strokeBorder(Color(red: 0.18, green: 0.18, blue: 0.18, opacity: 1), style: StrokeStyle(lineWidth: 2, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
                .clipShape(RoundedRectangle(cornerRadius: 15))
        }
        stylist.addStyle(identifier: "input/subtitle") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2016)
                }
                .font(Font.custom("Graphik-Regular", size: 12))
                .foregroundColor(Color(red: 0, green: 0, blue: 0, opacity: 0.5))
                .lineSpacing(5)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "input/tag-status/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 0))
                .overlay(RoundedRectangle(cornerRadius: 25).strokeBorder(Color(red: 0.91, green: 0.91, blue: 0.92, opacity: 1), style: StrokeStyle(lineWidth: 0, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "input/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.1529411764705882)
                }
                .font(Font.custom("Graphik-Regular", size: 13))
                .foregroundColor(Color(red: 0, green: 0, blue: 0, opacity: 1))
                .lineSpacing(9)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "input[blurred]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.17)
                }
                .font(Font.custom("Graphik-Regular", size: 12.5))
                .foregroundColor(Color(red: 0.73, green: 0.73, blue: 0.73, opacity: 1))
                .lineSpacing(4.5)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "input[carousel]/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 0))
        }
        stylist.addStyle(identifier: "input[carousel]/title") {
            $0
                .font(Font.custom("Graphik-Semibold", size: 11))
                .foregroundColor(Color(red: 0.13, green: 0.13, blue: 0.13, opacity: 1))
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "input[compact]/subtitle") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2083333333333333)
                }
                .font(Font.custom("Graphik-Regular", size: 12.5))
                .foregroundColor(Color(red: 0, green: 0, blue: 0, opacity: 0.5))
                .lineSpacing(4.5)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "input[compact]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.19)
                }
                .font(Font.custom("Graphik-Regular", size: 14))
                .foregroundColor(Color(red: 0.18, green: 0.18, blue: 0.18, opacity: 1))
                .lineSpacing(8)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "input[date-time]/button-secondary/title") {
            $0
                .font(Font.custom("Graphik-Semibold", size: 10.5))
                .foregroundColor(Color(red: 0.18, green: 0.18, blue: 0.18, opacity: 1))
                .lineSpacing(-0.5)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "input[disabled]/subtitle") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("Graphik-Regular", size: 14))
                .foregroundColor(Color(red: 0.18, green: 0.18, blue: 0.18, opacity: 1))
                .lineSpacing(3)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "input[disabled]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.1882352941176471)
                }
                .font(Font.custom("Graphik-Regular", size: 16))
                .foregroundColor(Color(red: 0.18, green: 0.18, blue: 0.18, opacity: 1))
                .lineSpacing(6)
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
                        .tracking(0.1882352941176471)
                }
                .font(Font.custom("Graphik-Regular", size: 16))
                .foregroundColor(Color(red: 0.9, green: 0.15, blue: 0.18, opacity: 1))
                .lineSpacing(6)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "input[radio-box-stock]/tag-status/title") {
            $0
                .styleText { text in
                    text
                        .tracking(-0.09565217391304348)
                }
                .font(Font.custom("Graphik-Regular", size: 11))
                .foregroundColor(Color(red: 0, green: 0, blue: 0, opacity: 1))
                .lineSpacing(-1)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "input[radio-box]/body") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("Graphik-Regular", size: 15))
                .foregroundColor(Color(red: 0.18, green: 0.18, blue: 0.18, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.trailing)
                .frame(alignment: .trailing)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "input[tag]/tag-secondary/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.17)
                }
                .font(Font.custom("Graphik-Regular", size: 13))
                .foregroundColor(Color(red: 0, green: 0, blue: 0, opacity: 1))
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "line") {
            $0
                .background(Color(red: 0.85, green: 0.85, blue: 0.85, opacity: 0.35))
        }
        stylist.addStyle(identifier: "list-row/body") {
            $0
                .styleText { text in
                    text
                        .tracking(0.15625)
                }
                .font(Font.custom("Graphik-Regular", size: 12.5))
                .foregroundColor(Color(red: 0.18, green: 0.18, blue: 0.18, opacity: 1))
                .lineSpacing(4.5)
                .multilineTextAlignment(.trailing)
                .frame(alignment: .trailing)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "list-row/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.1277777777777778)
                }
                .font(Font.custom("Graphik-Semibold", size: 11.5))
                .foregroundColor(Color(red: 0.18, green: 0.18, blue: 0.18, opacity: 1))
                .lineSpacing(5.5)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "list-row[double-edit]/body") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("Graphik-Regular", size: 16))
                .foregroundColor(Color(red: 0.18, green: 0.18, blue: 0.18, opacity: 1))
                .lineSpacing(1)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "list-row[highlighted]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.1333333333333334)
                }
                .font(Font.custom("Graphik-Semibold", size: 12))
                .foregroundColor(Color(red: 0.9, green: 0.15, blue: 0.18, opacity: 1))
                .lineSpacing(5)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "list-row[stacked]/body") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("Graphik-Regular", size: 16))
                .foregroundColor(Color(red: 0.73, green: 0.73, blue: 0.73, opacity: 1))
                .lineSpacing(1)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "list/heading/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.1821428571428571)
                }
                .font(Font.custom("Graphik-Semibold", size: 17))
                .foregroundColor(Color(red: 0, green: 0, blue: 0, opacity: 1))
                .lineSpacing(-5)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "list/list-row/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.1356521739130435)
                }
                .font(Font.custom("Graphik-Regular", size: 12))
                .foregroundColor(Color(red: 0, green: 0, blue: 0, opacity: 1))
                .lineSpacing(5)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "login/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 1))
        }
        stylist.addStyle(identifier: "login/button-primary/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(Color(red: 0.16, green: 0.16, blue: 0.16, opacity: 1), style: StrokeStyle(lineWidth: 2, lineCap: CGLineCap(rawValue: 2), lineJoin: CGLineJoin(rawValue: 0))))
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        stylist.addStyle(identifier: "login/button-primary/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.1555555555555556)
                }
                .font(Font.custom("Graphik-Semibold", size: 14))
                .foregroundColor(Color(red: 0, green: 0, blue: 0, opacity: 1))
                .lineSpacing(-4)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "login/subtitle") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("Graphik-Regular", size: 14))
                .foregroundColor(Color(red: 0.18, green: 0.18, blue: 0.18, opacity: 1))
                .lineSpacing(3)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "login/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.1555555555555556)
                }
                .font(Font.custom("Graphik-Semibold", size: 14))
                .foregroundColor(Color(red: 0.18, green: 0.18, blue: 0.18, opacity: 1))
                .lineSpacing(6)
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
                .background(Color(red: 0.05, green: 0.14, blue: 0.25, opacity: 1))
        }
        stylist.addStyle(identifier: "message-view/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 1))
        }
        stylist.addStyle(identifier: "message-view/subtitle") {
            $0
                .styleText { text in
                    text
                        .tracking(0.16)
                }
                .font(Font.custom("Graphik-Regular", size: 12))
                .foregroundColor(Color(red: 0.18, green: 0.18, blue: 0.18, opacity: 1))
                .lineSpacing(-3)
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
                .font(Font.custom("Graphik-Semibold", size: 16))
                .foregroundColor(Color(red: 0.18, green: 0.18, blue: 0.18, opacity: 1))
                .lineSpacing(6)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "modal/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 1))
        }
        stylist.addStyle(identifier: "modal/button-icon-left/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.1764705882352941)
                }
                .font(Font.custom("Graphik-Regular", size: 15))
                .foregroundColor(Color(red: 0.18, green: 0.18, blue: 0.18, opacity: 1))
                .lineSpacing(5)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "modal/button-icon-right/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.1764705882352941)
                        .underline(true)
                }
                .font(Font.custom("Graphik-Regular", size: 15))
                .foregroundColor(Color(red: 0, green: 0, blue: 0, opacity: 1))
                .lineSpacing(5)
                .multilineTextAlignment(.trailing)
                .frame(alignment: .trailing)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "modal/button-icon-right[disabled]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.1764705882352941)
                }
                .font(Font.custom("Graphik-Regular", size: 15))
                .foregroundColor(Color(red: 0.73, green: 0.73, blue: 0.73, opacity: 1))
                .lineSpacing(5)
                .multilineTextAlignment(.trailing)
                .frame(alignment: .trailing)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "modal/heading/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 1))
        }
        stylist.addStyle(identifier: "modal/navbar/background") {
            $0
                .background(Color(red: 0.98, green: 0.98, blue: 0.98, opacity: 1))
        }
        stylist.addStyle(identifier: "modal/navbar/divider/background") {
            $0
                .background(Color(red: 0.98, green: 0.98, blue: 0.98, opacity: 1))
        }
        stylist.addStyle(identifier: "modal/navbar/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.15)
                }
                .font(Font.custom("Graphik-Semibold", size: 13.5))
                .foregroundColor(Color(red: 0.18, green: 0.18, blue: 0.18, opacity: 1))
                .lineSpacing(8.5)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "modal/search/background") {
            $0
                .background(Color(red: 0.97, green: 0.97, blue: 0.97, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 4))
        }
        stylist.addStyle(identifier: "modal/search[highlighted]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("Graphik-Regular", size: 16))
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
                .clipShape(RoundedRectangle(cornerRadius: 4))
        }
        stylist.addStyle(identifier: "modal/subtitle") {
            $0
                .styleText { text in
                    text
                        .tracking(0.1733333333333333)
                }
                .font(Font.custom("Graphik-Regular", size: 13))
                .foregroundColor(Color(red: 0, green: 0, blue: 0, opacity: 1))
                .lineSpacing(5)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "modal/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.14)
                }
                .font(Font.custom("Graphik-Semibold", size: 14))
                .foregroundColor(Color(red: 0, green: 0, blue: 0, opacity: 1))
                .lineSpacing(8)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "navbar-list/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 1))
        }
        stylist.addStyle(identifier: "navbar-list/body") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("Graphik-Regular", size: 14))
                .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .lineSpacing(3)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 1), radius: 15, x: 0, y: 0)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "navbar-list/divider/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 1))
        }
        stylist.addStyle(identifier: "navbar-list/overlay") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 0.50098).overlay(LinearGradient(gradient: Gradient(stops:[.init(color: Color(red: 0, green: 0, blue: 0, opacity: 0.5), location: 0),.init(color: Color(red: 0, green: 0, blue: 0, opacity: 0), location: 1)]), startPoint: UnitPoint(x: 0.5, y: 0), endPoint: UnitPoint(x: 0.5, y: 0.5))))
        }
        stylist.addStyle(identifier: "navbar-list/subtitle") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("Graphik-Regular", size: 16))
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
                        .tracking(0.2222222222222223)
                }
                .font(Font.custom("Graphik-Semibold", size: 20))
                .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 1), radius: 15, x: 0, y: 0)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "navbar-list[short]/overlay") {
            $0
                .background(Color(red: 0, green: 0.16, blue: 0.33, opacity: 1).overlay(LinearGradient(gradient: Gradient(stops:[.init(color: Color(red: 0, green: 0, blue: 0, opacity: 0.5), location: 0),.init(color: Color(red: 0, green: 0, blue: 0, opacity: 0), location: 1)]), startPoint: UnitPoint(x: 0.5, y: 0), endPoint: UnitPoint(x: 0.5, y: 0.5))))
                .blur(radius: 10)
        }
        stylist.addStyle(identifier: "navbar-profile/background") {
            $0
                .background(Color(red: 0.91, green: 0.91, blue: 0.91, opacity: 1))
        }
        stylist.addStyle(identifier: "navbar-profile/block/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 0))
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        stylist.addStyle(identifier: "navbar-profile/block/subtitle") {
            $0
                .styleText { text in
                    text
                        .tracking(0.36)
                }
                .font(Font.custom("Graphik-Regular", size: 9))
                .foregroundColor(Color(red: 0, green: 0, blue: 0, opacity: 1))
                .lineSpacing(3)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "navbar-profile/block/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.1)
                }
                .font(Font.custom("Graphik-Semibold", size: 15))
                .foregroundColor(Color(red: 0, green: 0, blue: 0, opacity: 1))
                .lineSpacing(5)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "navbar-profile/body") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("Graphik-Regular", size: 18))
                .foregroundColor(Color(red: 0, green: 0, blue: 0, opacity: 1))
                .lineSpacing(4)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "navbar-profile/button-tertiary/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 0.2))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(Color(red: 0, green: 0, blue: 0, opacity: 1), style: StrokeStyle(lineWidth: 2, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        stylist.addStyle(identifier: "navbar-profile/button-tertiary/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("Graphik-Regular", size: 15))
                .foregroundColor(Color(red: 0.17, green: 0.17, blue: 0.17, opacity: 1))
                .lineSpacing(5)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "navbar-profile/divider/background") {
            $0
                .background(Color(red: 0.91, green: 0.91, blue: 0.91, opacity: 1))
        }
        stylist.addStyle(identifier: "navbar-profile/subtitle") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2285714285714285)
                }
                .font(Font.custom("Graphik-Semibold", size: 16))
                .foregroundColor(Color(red: 0.17, green: 0.17, blue: 0.17, opacity: 1))
                .lineSpacing(6)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "navbar-profile/tag-primary/background") {
            $0
                .background(Color(red: 0.9, green: 0.15, blue: 0.18, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 4))
        }
        stylist.addStyle(identifier: "navbar-profile/tag-primary/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.1818181818181818)
                }
                .font(Font.custom("Graphik-Semibold", size: 10))
                .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "navbar-profile/tag-secondary/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .overlay(RoundedRectangle(cornerRadius: 4).strokeBorder(Color(red: 0.93, green: 0.92, blue: 0.91, opacity: 1), style: StrokeStyle(lineWidth: 1, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
                .clipShape(RoundedRectangle(cornerRadius: 4))
        }
        stylist.addStyle(identifier: "navbar-profile/tag-secondary/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.1818181818181818)
                }
                .font(Font.custom("Graphik-Semibold", size: 10))
                .foregroundColor(Color(red: 0.18, green: 0.18, blue: 0.18, opacity: 1))
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
                .font(Font.custom("Graphik-Semibold", size: 18))
                .foregroundColor(Color(red: 0, green: 0, blue: 0, opacity: 1))
                .lineSpacing(4)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "navbar/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 1))
        }
        stylist.addStyle(identifier: "navbar/divider/background") {
            $0
                .background(Color(red: 0.91, green: 0.91, blue: 0.91, opacity: 1))
        }
        stylist.addStyle(identifier: "navbar/subtitle") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("Graphik-Regular", size: 13))
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
                        .tracking(-0.14)
                }
                .font(Font.custom("Graphik-Semibold", size: 15))
                .foregroundColor(Color(red: 0, green: 0, blue: 0, opacity: 1))
                .lineSpacing(7)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "navbar[image-search]/button-icon-right/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.18)
                }
                .font(Font.custom("Graphik-Regular", size: 15))
                .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .lineSpacing(5)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "navbar[image]/search/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 0.95))
                .clipShape(RoundedRectangle(cornerRadius: 4))
        }
        stylist.addStyle(identifier: "navbar[image]/search/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.25)
                }
                .font(Font.custom("Graphik-Semibold", size: 14))
                .foregroundColor(Color(red: 0.18, green: 0.18, blue: 0.18, opacity: 1))
                .lineSpacing(5)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "navbar[image]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(-0.14)
                }
                .font(Font.custom("Graphik-Semibold", size: 15))
                .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .lineSpacing(7)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "note-info/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 0))
        }
        stylist.addStyle(identifier: "note-instructions/background") {
            $0
                .background(Color(red: 0.97, green: 0.97, blue: 0.97, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        stylist.addStyle(identifier: "note-instructions/body") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("Graphik-Regular", size: 14))
                .foregroundColor(Color(red: 0.18, green: 0.18, blue: 0.18, opacity: 1))
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
                .font(Font.custom("Graphik-Semibold", size: 14))
                .foregroundColor(Color(red: 0.18, green: 0.18, blue: 0.18, opacity: 1))
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
                .font(Font.custom("Graphik-Regular", size: 16))
                .foregroundColor(Color(red: 0, green: 0, blue: 0, opacity: 1))
                .lineSpacing(6)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "note/body") {
            $0
                .font(Font.custom("Graphik-Regular", size: 11))
                .foregroundColor(Color(red: 0.18, green: 0.18, blue: 0.18, opacity: 1))
                .lineSpacing(8)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "note/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.4946666666666666)
                }
                .font(Font.custom("Graphik-Semibold", size: 14))
                .foregroundColor(Color(red: 0, green: 0, blue: 0, opacity: 1))
                .lineSpacing(3)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "note[alert]/body") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("Graphik-Regular", size: 15))
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
                .font(Font.custom("Graphik-Semibold", size: 14))
                .foregroundColor(Color(red: 0.73, green: 0.05, blue: 0.05, opacity: 1))
                .lineSpacing(3)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "note[rating]/title") {
            $0
                .font(Font.custom("Graphik-Semibold", size: 11))
                .foregroundColor(Color(red: 0, green: 0, blue: 0, opacity: 1))
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "notification/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.2), radius: 20, x: 0, y: 10)
        }
        stylist.addStyle(identifier: "notification/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.15)
                }
                .font(Font.custom("Graphik-Regular", size: 16))
                .foregroundColor(Color(red: 0.18, green: 0.18, blue: 0.18, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "overlay") {
            $0
                .background(Color(red: 0, green: 0, blue: 0, opacity: 0.35))
        }
        stylist.addStyle(identifier: "product/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 1))
        }
        stylist.addStyle(identifier: "product/body") {
            $0
                .styleText { text in
                    text
                        .tracking(0.18)
                }
                .font(Font.custom("Graphik-Regular", size: 13.5))
                .foregroundColor(Color(red: 0.18, green: 0.18, blue: 0.18, opacity: 1))
                .lineSpacing(3.5)
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
                .font(Font.custom("Graphik-Semibold", size: 10))
                .foregroundColor(Color(red: 0.18, green: 0.18, blue: 0.18, opacity: 1))
                .lineSpacing(1)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "product/tag-primary/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 0))
                .clipShape(RoundedRectangle(cornerRadius: 4))
        }
        stylist.addStyle(identifier: "product/tag-primary/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("Graphik-Regular", size: 13))
                .foregroundColor(Color(red: 0, green: 0, blue: 0, opacity: 1))
                .lineSpacing(-3)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "product/tag-secondary/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                        .strikethrough(true)
                }
                .font(Font.custom("Graphik-Regular", size: 13))
                .foregroundColor(Color(red: 0.33, green: 0.33, blue: 0.33, opacity: 1))
                .lineSpacing(-3)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "product/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.1647058823529412)
                }
                .font(Font.custom("Graphik-Semibold", size: 14))
                .foregroundColor(Color(red: 0, green: 0, blue: 0, opacity: 1))
                .lineSpacing(-1)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "product[image]/image[loading]/background") {
            $0
                .background(Color(red: 0.97, green: 0.97, blue: 0.97, opacity: 1))
        }
        stylist.addStyle(identifier: "product[info]/button-tertiary/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 0))
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        stylist.addStyle(identifier: "product[info]/button-tertiary/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                        .underline(true)
                }
                .font(Font.custom("Graphik-Regular", size: 10))
                .foregroundColor(Color(red: 0, green: 0, blue: 0, opacity: 1))
                .lineSpacing(1)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "product[info]/title") {
            $0
                .font(Font.custom("Graphik-Semibold", size: 14.5))
                .foregroundColor(Color(red: 0.18, green: 0.18, blue: 0.18, opacity: 1))
                .lineSpacing(4.5)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "product[row]/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        stylist.addStyle(identifier: "product[row]/divider/background") {
            $0
                .background(Color(red: 0.98, green: 0.98, blue: 0.98, opacity: 0))
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        stylist.addStyle(identifier: "product[row]/info/subtitle") {
            $0
                .font(Font.custom("Graphik-Regular", size: 11))
                .foregroundColor(Color(red: 0, green: 0, blue: 0, opacity: 1))
                .lineSpacing(6)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "product[row]/info/title") {
            $0
                .font(Font.custom("Graphik-Regular", size: 11))
                .foregroundColor(Color(red: 0.18, green: 0.18, blue: 0.18, opacity: 1))
                .lineSpacing(6)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "product[row]/product/title") {
            $0
                .font(Font.custom("Graphik-Semibold", size: 11))
                .foregroundColor(Color(red: 0, green: 0, blue: 0, opacity: 1))
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "product[row]/title") {
            $0
                .font(Font.custom("Graphik-Semibold", size: 12))
                .foregroundColor(Color(red: 0, green: 0, blue: 0, opacity: 1))
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "products/button-filters[selected]/title") {
            $0
                .font(Font.custom("Graphik-Semibold", size: 10))
                .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .lineSpacing(6)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "products/subtitle") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("Graphik-Semibold", size: 10))
                .foregroundColor(Color(red: 0.18, green: 0.18, blue: 0.18, opacity: 1))
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
                .font(Font.custom("Graphik-Semibold", size: 18))
                .foregroundColor(Color(red: 0, green: 0, blue: 0, opacity: 1))
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "progress-item/background") {
            $0
                .background(Color(red: 0.18, green: 0.18, blue: 0.18, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 8))
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
                .background(Color(red: 0.94, green: 0.94, blue: 0.94, opacity: 1))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(Color(red: 0.94, green: 0.94, blue: 0.94, opacity: 1), style: StrokeStyle(lineWidth: 1, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
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
                .font(Font.custom("Graphik-Semibold", size: 12))
                .foregroundColor(Color(red: 0, green: 0, blue: 0, opacity: 1))
                .lineSpacing(8)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "pulldown-item[disabled]/title") {
            $0
                .font(Font.custom("Graphik-Semibold", size: 12))
                .foregroundColor(Color(red: 0.73, green: 0.73, blue: 0.73, opacity: 1))
                .lineSpacing(8)
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
        stylist.addStyle(identifier: "rating-details/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 1))
        }
        stylist.addStyle(identifier: "rating-details/title") {
            $0
                .font(Font.custom("Graphik-Regular", size: 13))
                .foregroundColor(Color(red: 0, green: 0, blue: 0, opacity: 1))
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "search/background") {
            $0
                .background(Color(red: 0.97, green: 0.97, blue: 0.97, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 4))
        }
        stylist.addStyle(identifier: "search/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.25)
                }
                .font(Font.custom("Graphik-Semibold", size: 14))
                .foregroundColor(Color(red: 0.18, green: 0.18, blue: 0.18, opacity: 1))
                .lineSpacing(5)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "search[highlighted]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.5)
                }
                .font(Font.custom("Graphik-Regular", size: 14))
                .foregroundColor(Color(red: 0.18, green: 0.18, blue: 0.18, opacity: 1))
                .lineSpacing(5)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "searchbar/background") {
            $0
                .background(Color(red: 0.05, green: 0.14, blue: 0.25, opacity: 0))
        }
        stylist.addStyle(identifier: "searchbar/divider/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 1))
        }
        stylist.addStyle(identifier: "stat-item/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 0))
        }
        stylist.addStyle(identifier: "stat-item/subtitle") {
            $0
                .font(Font.custom("Graphik-Regular", size: 13))
                .foregroundColor(Color(red: 0.18, green: 0.18, blue: 0.18, opacity: 1))
                .lineSpacing(-3)
                .multilineTextAlignment(.trailing)
                .frame(alignment: .trailing)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "stat-item/title") {
            $0
                .font(Font.custom("Graphik-Semibold", size: 10))
                .foregroundColor(Color(red: 0, green: 0, blue: 0, opacity: 1))
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.uppercase)
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
                        .tracking(0.1866666666666667)
                }
                .font(Font.custom("Graphik-Semibold", size: 14))
                .foregroundColor(Color(red: 0, green: 0, blue: 0, opacity: 1))
                .lineSpacing(3)
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
                .font(Font.custom("Graphik-Semibold", size: 15))
                .foregroundColor(Color(red: 0.9, green: 0.15, blue: 0.18, opacity: 1))
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
                .font(Font.custom("Graphik-Regular", size: 14))
                .foregroundColor(Color(red: 0.18, green: 0.18, blue: 0.18, opacity: 1))
                .lineSpacing(3)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "tabbar/background") {
            $0
                .background(Color(red: 0.98, green: 0.98, blue: 0.98, opacity: 1))
        }
        stylist.addStyle(identifier: "tabbar/divider/background") {
            $0
                .background(Color(red: 0.91, green: 0.91, blue: 0.91, opacity: 1))
        }
        stylist.addStyle(identifier: "tabswitch/background") {
            $0
                .background(Color(red: 0.91, green: 0.91, blue: 0.92, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        stylist.addStyle(identifier: "tag-primary-icon/background") {
            $0
                .background(Color(red: 0.9, green: 0.15, blue: 0.18, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 6))
        }
        stylist.addStyle(identifier: "tag-primary/background") {
            $0
                .background(Color(red: 0.9, green: 0.15, blue: 0.18, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 4))
        }
        stylist.addStyle(identifier: "tag-primary/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.18)
                }
                .font(Font.custom("Graphik-Semibold", size: 9))
                .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "tag-secondary/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 0))
                .clipShape(RoundedRectangle(cornerRadius: 4))
        }
        stylist.addStyle(identifier: "tag-secondary/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.4)
                }
                .font(Font.custom("Graphik-Regular", size: 13))
                .foregroundColor(Color(red: 0.18, green: 0.18, blue: 0.18, opacity: 1))
                .lineSpacing(4)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "tag-secondary[discount]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.08666666666666667)
                        .strikethrough(true)
                }
                .font(Font.custom("Graphik-Regular", size: 13))
                .foregroundColor(Color(red: 0.85, green: 0.85, blue: 0.85, opacity: 1))
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "tag-status/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 0.75))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "tag-status/title") {
            $0
                .styleText { text in
                    text
                        .tracking(-0.09090909090909091)
                }
                .font(Font.custom("Graphik-Regular", size: 10))
                .foregroundColor(Color(red: 0, green: 0, blue: 0, opacity: 1))
                .lineSpacing(-1)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "tag-status[expired]/indicator/background") {
            $0
                .background(Color(red: 0.22, green: 0.22, blue: 0.22, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 4))
        }
        stylist.addStyle(identifier: "tag-status[on-demand]/indicator/background") {
            $0
                .background(Color(red: 0.99, green: 0.77, blue: 0.12, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 4))
        }
        stylist.addStyle(identifier: "tag-status[out-of-stock]/indicator/background") {
            $0
                .background(Color(red: 0.79, green: 0, blue: 0, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 4))
        }
        stylist.addStyle(identifier: "tile/subtitle") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("Graphik-Regular", size: 14))
                .foregroundColor(Color(red: 0.18, green: 0.18, blue: 0.18, opacity: 1))
                .lineSpacing(3)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "tile/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.1647058823529412)
                }
                .font(Font.custom("Graphik-Regular", size: 14))
                .foregroundColor(Color(red: 0, green: 0, blue: 0, opacity: 1))
                .lineSpacing(3)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "timeline-date/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 1))
        }
        stylist.addStyle(identifier: "timeline-date/subtitle") {
            $0
                .styleText { text in
                    text
                        .tracking(0.25)
                }
                .font(Font.custom("Graphik-Regular", size: 11))
                .foregroundColor(Color(red: 0, green: 0, blue: 0, opacity: 1))
                .lineSpacing(3)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "timeline-date/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2192307692307692)
                }
                .font(Font.custom("Graphik-Semibold", size: 19))
                .foregroundColor(Color(red: 0, green: 0, blue: 0, opacity: 1))
                .lineSpacing(1)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "timeline-heading/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.1542857142857143)
                }
                .font(Font.custom("Graphik-Regular", size: 12))
                .foregroundColor(Color(red: 0, green: 0, blue: 0, opacity: 1))
                .lineSpacing(5)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "timeline-row/background") {
            $0
                .background(Color(red: 0.98, green: 0.98, blue: 0.98, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        stylist.addStyle(identifier: "timeline-row/info/title") {
            $0
                .font(Font.custom("Graphik-Regular", size: 11))
                .foregroundColor(Color(red: 0, green: 0, blue: 0, opacity: 1))
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "timeline-row/info[label]/subtitle") {
            $0
                .styleText { text in
                    text
                        .tracking(0.1615384615384616)
                }
                .font(Font.custom("Graphik-Regular", size: 10.5))
                .foregroundColor(Color(red: 0.65, green: 0.66, blue: 0.69, opacity: 1))
                .lineSpacing(3.5)
                .multilineTextAlignment(.trailing)
                .frame(alignment: .trailing)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "timeline-row/line") {
            $0
                .overlay(Rectangle().strokeBorder(Color(red: 0.9, green: 0.15, blue: 0.18, opacity: 1), style: StrokeStyle(lineWidth: 1, lineCap: CGLineCap(rawValue: 1), lineJoin: CGLineJoin(rawValue: 1))))
        }
        stylist.addStyle(identifier: "timeline-row/subtitle") {
            $0
                .styleText { text in
                    text
                        .tracking(0.1538461538461539)
                }
                .font(Font.custom("Graphik-Regular", size: 10))
                .foregroundColor(Color(red: 0, green: 0, blue: 0, opacity: 1))
                .lineSpacing(4)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "timeline-row/tag-status/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 0.5))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "timeline-row/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.1529411764705882)
                }
                .font(Font.custom("Graphik-Semibold", size: 13))
                .foregroundColor(Color(red: 0.18, green: 0.18, blue: 0.18, opacity: 1))
                .lineSpacing(7)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "timeline-row[future]/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(Color(red: 0.91, green: 0.91, blue: 0.91, opacity: 1), style: StrokeStyle(lineWidth: 1, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 1))))
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        stylist.addStyle(identifier: "title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.1764705882352941)
                }
                .font(Font.custom("Graphik-Semibold", size: 15))
                .foregroundColor(Color(red: 0.18, green: 0.18, blue: 0.18, opacity: 1))
                .lineSpacing(8)
                .withTextCase(.none)
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
                .font(Font.custom("Graphik-Regular", size: 16))
                .foregroundColor(Color(red: 0.18, green: 0.18, blue: 0.18, opacity: 1))
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
                .font(Font.custom("Graphik-Regular", size: 16))
                .foregroundColor(Color(red: 0.9, green: 0.15, blue: 0.18, opacity: 1))
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
                .font(Font.custom("Graphik-Regular", size: 16))
                .foregroundColor(Color(red: 0.27, green: 0.53, blue: 0.25, opacity: 1))
                .lineSpacing(2)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "toggle/background") {
            $0
                .background(Color(red: 0.18, green: 0.18, blue: 0.18, opacity: 1))
        }
        stylist.addStyle(identifier: "toggle[off]/background") {
            $0
                .background(Color(red: 0.94, green: 0.94, blue: 0.93, opacity: 1))
        }
        stylist.addStyle(identifier: "toolbar/background") {
            $0
                .background(Color(red: 0.95, green: 0.95, blue: 0.95, opacity: 1))
        }
        stylist.addStyle(identifier: "toolbar/button-icon-left/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("Graphik-Semibold", size: 17))
                .foregroundColor(Color(red: 0, green: 0, blue: 0, opacity: 1))
                .lineSpacing(3)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "toolbar/button-icon-right/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.1764705882352941)
                }
                .font(Font.custom("Graphik-Regular", size: 15))
                .foregroundColor(Color(red: 0.18, green: 0.18, blue: 0.18, opacity: 1))
                .lineSpacing(5)
                .multilineTextAlignment(.trailing)
                .frame(alignment: .trailing)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "toolbar/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.165)
                }
                .font(Font.custom("Graphik-Semibold", size: 11))
                .foregroundColor(Color(red: 0.18, green: 0.18, blue: 0.18, opacity: 1))
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "toolbar[search]/background") {
            $0
                .background(Color(red: 0.91, green: 0.91, blue: 0.91, opacity: 0.3))
        }
        stylist.addStyle(identifier: "toolbar[search]/divider/background") {
            $0
                .background(Color(red: 0.98, green: 0.98, blue: 0.98, opacity: 1))
        }
        stylist.addStyle(identifier: "toolbar[tabs]/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 1))
        }
        stylist.addStyle(identifier: "totals/info/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.1733333333333333)
                }
                .font(Font.custom("Graphik-Regular", size: 13))
                .foregroundColor(Color(red: 0.18, green: 0.18, blue: 0.18, opacity: 1))
                .lineSpacing(4)
                .multilineTextAlignment(.trailing)
                .frame(alignment: .trailing)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "totals/info[label-highlighted]/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2133333333333333)
                }
                .font(Font.custom("Graphik-Semibold", size: 16))
                .foregroundColor(Color(red: 0, green: 0, blue: 0, opacity: 1))
                .lineSpacing(1)
                .multilineTextAlignment(.trailing)
                .frame(alignment: .trailing)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "transaction-details/body") {
            $0
                .styleText { text in
                    text
                        .tracking(0.1733333333333333)
                }
                .font(Font.custom("Graphik-Regular", size: 13))
                .foregroundColor(Color(red: 0.18, green: 0.18, blue: 0.18, opacity: 1))
                .lineSpacing(9)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "transaction-details/button-tertiary/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        stylist.addStyle(identifier: "transaction-details/button-tertiary/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.18)
                }
                .font(Font.custom("Graphik-Regular", size: 11))
                .foregroundColor(Color(red: 0, green: 0, blue: 0, opacity: 1))
                .lineSpacing(2)
                .withTextCase(.uppercase)
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
                .font(Font.custom("Graphik-Regular", size: 12))
                .foregroundColor(Color(red: 0.18, green: 0.18, blue: 0.18, opacity: 1))
                .lineSpacing(4)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.uppercase)
        }
        stylist.addStyle(identifier: "transaction-details/tag-status/background") {
            $0
                .background(Color(red: 1, green: 1, blue: 1, opacity: 0.95))
                .overlay(RoundedRectangle(cornerRadius: 25).strokeBorder(Color(red: 0.91, green: 0.91, blue: 0.92, opacity: 1), style: StrokeStyle(lineWidth: 1, lineCap: CGLineCap(rawValue: 0), lineJoin: CGLineJoin(rawValue: 0))))
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        stylist.addStyle(identifier: "transaction-details/title") {
            $0
                .styleText { text in
                    text
                        .tracking(0.2)
                }
                .font(Font.custom("Graphik-Regular", size: 28))
                .foregroundColor(Color(red: 0, green: 0, blue: 0, opacity: 1))
                .lineSpacing(10)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .withTextCase(.none)
        }
        stylist.addStyle(identifier: "widget/background") {
            $0
                .background(Color(red: 0.95, green: 0.95, blue: 0.95, opacity: 1))
        }
        return stylist
    }
}

extension UIKitStyleContainer {
    static func create(with stylist: Stylist) -> UIKitStyleContainer {
        let container = UIKitStyleContainer(stylist: stylist)
                container.addProperty(identifier: "accordion/body") {
                    return [
                            .textColor(UIColor(red: 0.1803921568627451, green: 0.1803921568627451, blue: 0.1803921568627451, alpha: 1)),
                            .font(UIFont(name: "Graphik-Regular", size: 14)!),
                            .textCase(.none),
                            .kerning(0.1866666666666667)
                    ]
                }
                container.addProperty(identifier: "accordion/title") {
                    return [
                            .textColor(UIColor(red: 0.1803921568627451, green: 0.1803921568627451, blue: 0.1803921568627451, alpha: 1)),
                            .font(UIFont(name: "Graphik-Semibold", size: 12)!),
                            .textCase(.uppercase),
                            .kerning(0.09230769230769233)
                    ]
                }
                container.addProperty(identifier: "alert/title") {
                    return [
                            .textColor(UIColor(red: 0.1803921568627451, green: 0.1803921568627451, blue: 0.1803921568627451, alpha: 1)),
                            .font(UIFont(name: "Graphik-Semibold", size: 14)!),
                            .textCase(.uppercase)
                    ]
                }
                container.addProperty(identifier: "background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "badge/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.8980392156862745, green: 0.1490196078431373, blue: 0.1803921568627451, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "badge/title") {
                    return [
                            .textColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1)),
                            .font(UIFont(name: "Graphik-Regular", size: 10)!),
                            .textCase(.uppercase),
                            .kerning(-0.4545454545454545)
                    ]
                }
                container.addProperty(identifier: "banners/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.9725490196078431, green: 0.9725490196078431, blue: 0.9725490196078431, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "banners/divider/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.9725490196078431, green: 0.9725490196078431, blue: 0.9725490196078431, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "banners/title") {
                    return [
                            .textColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1)),
                            .font(UIFont(name: "Graphik-Regular", size: 12.5)!),
                            .textCase(.none)
                    ]
                }
                container.addProperty(identifier: "block-stats/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.9725490196078431, green: 0.9725490196078431, blue: 0.9686274509803922, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "block-stats/body") {
                    return [
                            .textColor(UIColor(red: 0.1803921568627451, green: 0.1803921568627451, blue: 0.1803921568627451, alpha: 1)),
                            .font(UIFont(name: "Graphik-Semibold", size: 28)!),
                            .textCase(.none),
                            .kerning(-0.3888888888888888)
                    ]
                }
                container.addProperty(identifier: "block-stats/subtitle") {
                    return [
                            .textColor(UIColor(red: 0.1803921568627451, green: 0.1803921568627451, blue: 0.1803921568627451, alpha: 1)),
                            .font(UIFont(name: "Graphik-Regular", size: 8.5)!),
                            .textCase(.uppercase)
                    ]
                }
                container.addProperty(identifier: "block-stats/title") {
                    return [
                            .textColor(UIColor(red: 0.1803921568627451, green: 0.1803921568627451, blue: 0.1803921568627451, alpha: 1)),
                            .font(UIFont(name: "Graphik-Semibold", size: 10)!),
                            .textCase(.uppercase),
                            .kerning(-0.1)
                    ]
                }
                container.addProperty(identifier: "block-stats[circle-wide]/body") {
                    return [
                            .textColor(UIColor(red: 0.1803921568627451, green: 0.1803921568627451, blue: 0.1803921568627451, alpha: 1)),
                            .font(UIFont(name: "Graphik-Semibold", size: 26)!),
                            .textCase(.none),
                            .kerning(-0.3823529411764706)
                    ]
                }
                container.addProperty(identifier: "block-stats[circle-wide]/subtitle") {
                    return [
                            .textColor(UIColor(red: 0.1803921568627451, green: 0.1803921568627451, blue: 0.1803921568627451, alpha: 1)),
                            .font(UIFont(name: "Graphik-Regular", size: 15)!),
                            .textCase(.none)
                    ]
                }
                container.addProperty(identifier: "block-stats[circle3-wide]/body") {
                    return [
                            .textColor(UIColor(red: 0.1235505566000938, green: 0.1434680819511414, blue: 0.2327242195606232, alpha: 1)),
                            .font(UIFont(name: "Graphik-Semibold", size: 11.5)!),
                            .textCase(.none)
                    ]
                }
                container.addProperty(identifier: "block-stats[circle3-wide]/subtitle") {
                    return [
                            .textColor(UIColor(red: 0.1803921568627451, green: 0.1803921568627451, blue: 0.1803921568627451, alpha: 1)),
                            .font(UIFont(name: "Graphik-Regular", size: 11.5)!),
                            .textCase(.uppercase),
                            .kerning(0.1769230769230769)
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
                            .font(UIFont(name: "Graphik-Semibold", size: 17)!),
                            .textCase(.none),
                            .kerning(-0.17)
                    ]
                }
                container.addProperty(identifier: "block[available-hide]/subtitle") {
                    return [
                            .textColor(UIColor(red: 0.1803921568627451, green: 0.1803921568627451, blue: 0.1803921568627451, alpha: 1)),
                            .font(UIFont(name: "Graphik-Regular", size: 10)!),
                            .textCase(.uppercase)
                    ]
                }
                container.addProperty(identifier: "block[available]/subtitle") {
                    return [
                            .textColor(UIColor(red: 0.1803921568627451, green: 0.1803921568627451, blue: 0.1803921568627451, alpha: 1)),
                            .font(UIFont(name: "Graphik-Regular", size: 10)!),
                            .textCase(.uppercase),
                            .kerning(-0.2)
                    ]
                }
                container.addProperty(identifier: "block[available]/title") {
                    return [
                            .textColor(UIColor(red: 0.1803921568627451, green: 0.1803921568627451, blue: 0.1803921568627451, alpha: 1)),
                            .font(UIFont(name: "Graphik-Semibold", size: 20)!),
                            .textCase(.none),
                            .kerning(0.1333333333333332)
                    ]
                }
                container.addProperty(identifier: "block[out-of-stock-hide]/subtitle") {
                    return [
                            .textColor(UIColor(red: 0.7254901960784313, green: 0.7254901960784313, blue: 0.7254901960784313, alpha: 1)),
                            .font(UIFont(name: "Graphik-Regular", size: 10)!),
                            .textCase(.uppercase),
                            .kerning(-0.2)
                    ]
                }
                container.addProperty(identifier: "block[out-of-stock]/subtitle") {
                    return [
                            .textColor(UIColor(red: 0.1803921568627451, green: 0.1803921568627451, blue: 0.1803921568627451, alpha: 1)),
                            .font(UIFont(name: "Graphik-Regular", size: 10)!),
                            .textCase(.uppercase),
                            .kerning(-0.2)
                    ]
                }
                container.addProperty(identifier: "block[out-of-stock]/title") {
                    return [
                            .textColor(UIColor(red: 0.8980392156862745, green: 0.1490196078431373, blue: 0.1803921568627451, alpha: 1)),
                            .font(UIFont(name: "Graphik-Semibold", size: 20)!),
                            .textCase(.none),
                            .kerning(0.1333333333333332)
                    ]
                }
                container.addProperty(identifier: "body") {
                    return [
                            .textColor(UIColor(red: 0.1568627450980392, green: 0.1568627450980392, blue: 0.1568627450980392, alpha: 1)),
                            .font(UIFont(name: "Graphik-Regular", size: 12)!),
                            .textCase(.none),
                            .kerning(0.5)
                    ]
                }
                container.addProperty(identifier: "button-action-row/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.9686274509803922, green: 0.9686274509803922, blue: 0.9686274509803922, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "button-action-row/subtitle") {
                    return [
                            .textColor(UIColor(red: 0.1803921568627451, green: 0.1803921568627451, blue: 0.1803921568627451, alpha: 1)),
                            .font(UIFont(name: "Graphik-Regular", size: 12)!),
                            .textCase(.none),
                            .kerning(0.1714285714285715)
                    ]
                }
                container.addProperty(identifier: "button-action-row/tag-secondary/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.9529411764705882, green: 0.9529411764705882, blue: 0.9529411764705882, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "button-action-row/tag-secondary/title") {
                    return [
                            .textColor(UIColor(red: 0.7254901960784313, green: 0.7254901960784313, blue: 0.7254901960784313, alpha: 1)),
                            .font(UIFont(name: "Graphik-Regular", size: 10)!),
                            .textCase(.uppercase),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "button-action-row/title") {
                    return [
                            .textColor(UIColor(red: 0.1803921568627451, green: 0.1803921568627451, blue: 0.1803921568627451, alpha: 1)),
                            .font(UIFont(name: "Graphik-Semibold", size: 13)!),
                            .textCase(.none),
                            .kerning(0.1529411764705882)
                    ]
                }
                container.addProperty(identifier: "button-alert/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "button-alert/title") {
                    return [
                            .textColor(UIColor(red: 0.8980392156862745, green: 0.1490196078431373, blue: 0.1803921568627451, alpha: 1)),
                            .font(UIFont(name: "Graphik-Semibold", size: 14)!),
                            .textCase(.uppercase),
                            .kerning(0.16)
                    ]
                }
                container.addProperty(identifier: "button-filters-avatar/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.807843137254902, green: 0.807843137254902, blue: 0.807843137254902, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "button-filters-avatar/subtitle") {
                    return [
                            .textColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1)),
                            .font(UIFont(name: "Graphik-Semibold", size: 28)!),
                            .textCase(.uppercase)
                    ]
                }
                container.addProperty(identifier: "button-filters-avatar/title") {
                    return [
                            .textColor(UIColor(red: 0.1235505566000938, green: 0.1434680819511414, blue: 0.2327242195606232, alpha: 1)),
                            .font(UIFont(name: "Graphik-Regular", size: 14)!),
                            .textCase(.none),
                            .kerning(-0.2)
                    ]
                }
                container.addProperty(identifier: "button-filters-avatar[selected]/title") {
                    return [
                            .textColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1)),
                            .font(UIFont(name: "Graphik-Regular", size: 14)!),
                            .textCase(.none),
                            .kerning(-0.2)
                    ]
                }
                container.addProperty(identifier: "button-filters-multi/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "button-filters-multi/title") {
                    return [
                            .textColor(UIColor(red: 0.1803921568627451, green: 0.1803921568627451, blue: 0.1803921568627451, alpha: 1)),
                            .font(UIFont(name: "Graphik-Regular", size: 12)!),
                            .textCase(.none)
                    ]
                }
                container.addProperty(identifier: "button-filters-multi[selected]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.1803921568627451, green: 0.1803921568627451, blue: 0.1803921568627451, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "button-filters-multi[selected]/title") {
                    return [
                            .textColor(UIColor(red: 0.1803921568627451, green: 0.1803921568627451, blue: 0.1803921568627451, alpha: 1)),
                            .font(UIFont(name: "Graphik-Regular", size: 12)!),
                            .textCase(.uppercase)
                    ]
                }
                container.addProperty(identifier: "button-filters/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.9725490196078431, green: 0.9725490196078431, blue: 0.9686274509803922, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "button-filters/title") {
                    return [
                            .textColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1)),
                            .font(UIFont(name: "Graphik-Semibold", size: 11)!),
                            .textCase(.uppercase)
                    ]
                }
                container.addProperty(identifier: "button-filters[selected]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.1803921568627451, green: 0.1803921568627451, blue: 0.1803921568627451, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "button-filters[selected]/title") {
                    return [
                            .textColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1)),
                            .font(UIFont(name: "Graphik-Semibold", size: 11)!),
                            .textCase(.uppercase)
                    ]
                }
                container.addProperty(identifier: "button-icon-center/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0))
                    ]
                }
                container.addProperty(identifier: "button-icon-center/title") {
                    return [
                            .textColor(UIColor(red: 0.1803921568627451, green: 0.1803921568627451, blue: 0.1803921568627451, alpha: 1)),
                            .font(UIFont(name: "Graphik-Semibold", size: 12)!),
                            .textCase(.uppercase),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "button-icon-center[disabled]/title") {
                    return [
                            .textColor(UIColor(red: 0.7254901960784313, green: 0.7254901960784313, blue: 0.7254901960784313, alpha: 1)),
                            .font(UIFont(name: "Graphik-Regular", size: 12)!),
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
                            .textColor(UIColor(red: 0.1803921568627451, green: 0.1803921568627451, blue: 0.1803921568627451, alpha: 1)),
                            .font(UIFont(name: "Graphik-Regular", size: 15)!),
                            .textCase(.none),
                            .kerning(0.1764705882352941)
                    ]
                }
                container.addProperty(identifier: "button-icon-right/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0))
                    ]
                }
                container.addProperty(identifier: "button-icon-right/badge/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.8980392156862745, green: 0.1490196078431373, blue: 0.1803921568627451, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "button-icon-right/title") {
                    return [
                            .textColor(UIColor(red: 0.1803921568627451, green: 0.1803921568627451, blue: 0.1803921568627451, alpha: 1)),
                            .font(UIFont(name: "Graphik-Regular", size: 15)!),
                            .textCase(.none),
                            .kerning(0.1764705882352941)
                    ]
                }
                container.addProperty(identifier: "button-icon-right[disabled]/title") {
                    return [
                            .textColor(UIColor(red: 0.7254901960784313, green: 0.7254901960784313, blue: 0.7254901960784313, alpha: 1)),
                            .font(UIFont(name: "Graphik-Regular", size: 15)!),
                            .textCase(.none),
                            .kerning(0.1764705882352941)
                    ]
                }
                container.addProperty(identifier: "button-login /title") {
                    return [
                            .textColor(UIColor(red: 0.1803921568627451, green: 0.1803921568627451, blue: 0.1803921568627451, alpha: 1)),
                            .font(UIFont(name: "Graphik-Semibold", size: 14)!),
                            .textCase(.uppercase),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "button-primary/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "button-primary/title") {
                    return [
                            .textColor(UIColor(red: 0.1803921568627451, green: 0.1803921568627451, blue: 0.1803921568627451, alpha: 1)),
                            .font(UIFont(name: "Graphik-Semibold", size: 14)!),
                            .textCase(.uppercase)
                    ]
                }
                container.addProperty(identifier: "button-primary[disabled]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.9725490196078431, green: 0.9725490196078431, blue: 0.9725490196078431, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "button-primary[disabled]/title") {
                    return [
                            .textColor(UIColor(red: 0.7254901960784313, green: 0.7254901960784313, blue: 0.7254901960784313, alpha: 1)),
                            .font(UIFont(name: "Graphik-Semibold", size: 14)!),
                            .textCase(.uppercase)
                    ]
                }
                container.addProperty(identifier: "button-primary[highlighted]/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "button-secondary/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "button-secondary/title") {
                    return [
                            .textColor(UIColor(red: 0.1803921568627451, green: 0.1803921568627451, blue: 0.1803921568627451, alpha: 1)),
                            .font(UIFont(name: "Graphik-Semibold", size: 14)!),
                            .textCase(.uppercase)
                    ]
                }
                container.addProperty(identifier: "button-secondary[disabled]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.9725490196078431, green: 0.9725490196078431, blue: 0.9725490196078431, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "button-secondary[disabled]/title") {
                    return [
                            .textColor(UIColor(red: 0.7254901960784313, green: 0.7254901960784313, blue: 0.7254901960784313, alpha: 1)),
                            .font(UIFont(name: "Graphik-Semibold", size: 14)!),
                            .textCase(.uppercase)
                    ]
                }
                container.addProperty(identifier: "button-secondary[highlighted]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.1803921568627451, green: 0.1803921568627451, blue: 0.1803921568627451, alpha: 0.8))
                    ]
                }
                container.addProperty(identifier: "button-secondary[highlighted]/title") {
                    return [
                            .textColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1)),
                            .font(UIFont(name: "Graphik-Semibold", size: 14)!),
                            .textCase(.uppercase)
                    ]
                }
                container.addProperty(identifier: "button-swipe[alert]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.8980392156862745, green: 0.1490196078431373, blue: 0.1803921568627451, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "button-tabbar/badge/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.7333333333333333, green: 0.04705882352941176, blue: 0.04705882352941176, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "button-tabbar/title") {
                    return [
                            .textColor(UIColor(red: 0.1803921568627451, green: 0.1803921568627451, blue: 0.1803921568627451, alpha: 1)),
                            .font(UIFont(name: "Graphik-Semibold", size: 10)!),
                            .textCase(.uppercase)
                    ]
                }
                container.addProperty(identifier: "button-tabbar[disabled]/title") {
                    return [
                            .textColor(UIColor(red: 0.1803921568627451, green: 0.1803921568627451, blue: 0.1803921568627451, alpha: 1)),
                            .font(UIFont(name: "Graphik-Regular", size: 10)!),
                            .textCase(.uppercase)
                    ]
                }
                container.addProperty(identifier: "button-tabs/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "button-tabs/divider/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.9137254901960784, green: 0.9137254901960784, blue: 0.9215686274509803, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "button-tabs/subtitle") {
                    return [
                            .textColor(UIColor(red: 0, green: 0, blue: 0, alpha: 0.8)),
                            .font(UIFont(name: "Graphik-Regular", size: 10)!),
                            .textCase(.uppercase),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "button-tabs/title") {
                    return [
                            .textColor(UIColor(red: 0, green: 0, blue: 0, alpha: 0.8)),
                            .font(UIFont(name: "Graphik-Semibold", size: 20)!),
                            .textCase(.none),
                            .kerning(0.1333333333333333)
                    ]
                }
                container.addProperty(identifier: "button-tabs[selected]/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "button-tabs[selected]/divider/background") {
                    return [
                            .backgroundColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "button-tabs[selected]/subtitle") {
                    return [
                            .textColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1)),
                            .font(UIFont(name: "Graphik-Regular", size: 10)!),
                            .textCase(.uppercase),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "button-tabs[selected]/title") {
                    return [
                            .textColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1)),
                            .font(UIFont(name: "Graphik-Semibold", size: 20)!),
                            .textCase(.none),
                            .kerning(0.1333333333333333)
                    ]
                }
                container.addProperty(identifier: "button-tabswitch/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.9333333333333333, green: 0.9176470588235294, blue: 0.9137254901960784, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "button-tabswitch/title") {
                    return [
                            .textColor(UIColor(red: 0.1803921568627451, green: 0.1803921568627451, blue: 0.1803921568627451, alpha: 1)),
                            .font(UIFont(name: "Graphik-Regular", size: 12)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "button-tabswitch[selected]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "button-tabswitch[selected]/title") {
                    return [
                            .textColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1)),
                            .font(UIFont(name: "Graphik-Regular", size: 12)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "button-tertiary-center/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "button-tertiary/title") {
                    return [
                            .textColor(UIColor(red: 0.1803921568627451, green: 0.1803921568627451, blue: 0.1803921568627451, alpha: 1)),
                            .font(UIFont(name: "Graphik-Semibold", size: 11)!),
                            .textCase(.uppercase),
                            .kerning(0.1)
                    ]
                }
                container.addProperty(identifier: "button-tertiary[highlighted]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.2666666666666667, green: 0.5333333333333333, blue: 0.2470588235294118, alpha: 0.05))
                    ]
                }
                container.addProperty(identifier: "button-tertiary[highlighted]/title") {
                    return [
                            .textColor(UIColor(red: 0.2666666666666667, green: 0.5333333333333333, blue: 0.2470588235294118, alpha: 1)),
                            .font(UIFont(name: "Graphik-Semibold", size: 11)!),
                            .textCase(.uppercase),
                            .kerning(0.1)
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
                            .font(UIFont(name: "Graphik-Regular", size: 12)!),
                            .textCase(.uppercase),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "button-toolbar/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0))
                    ]
                }
                container.addProperty(identifier: "button-toolbar/title") {
                    return [
                            .textColor(UIColor(red: 0.1803921568627451, green: 0.1803921568627451, blue: 0.1803921568627451, alpha: 1)),
                            .font(UIFont(name: "Graphik-Semibold", size: 12.5)!),
                            .textCase(.none),
                            .kerning(0.1785714285714286)
                    ]
                }
                container.addProperty(identifier: "calendar-day/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "calendar-day/title") {
                    return [
                            .textColor(UIColor(red: 0.1803921568627451, green: 0.1803921568627451, blue: 0.1803921568627451, alpha: 1)),
                            .font(UIFont(name: "Graphik-Regular", size: 16)!),
                            .textCase(.uppercase),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "calendar-day[disabled]/title") {
                    return [
                            .textColor(UIColor(red: 0.7254901960784313, green: 0.7254901960784313, blue: 0.7254901960784313, alpha: 1)),
                            .font(UIFont(name: "Graphik-Regular", size: 16)!),
                            .textCase(.uppercase),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "calendar-day[selected]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.04705882352941176, green: 0.1372549019607843, blue: 0.2509803921568627, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "calendar-day[selected]/title") {
                    return [
                            .textColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1)),
                            .font(UIFont(name: "Graphik-Regular", size: 16)!),
                            .textCase(.uppercase),
                            .kerning(0.2)
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
                            .textColor(UIColor(red: 0.1803921568627451, green: 0.1803921568627451, blue: 0.1803921568627451, alpha: 1)),
                            .font(UIFont(name: "Graphik-Semibold", size: 13)!),
                            .textCase(.uppercase),
                            .kerning(0.1)
                    ]
                }
                container.addProperty(identifier: "calendar/title") {
                    return [
                            .textColor(UIColor(red: 0.1803921568627451, green: 0.1803921568627451, blue: 0.1803921568627451, alpha: 1)),
                            .font(UIFont(name: "Graphik-Regular", size: 15)!),
                            .textCase(.uppercase),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "camera-view/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.9411764705882353, green: 0.9411764705882353, blue: 0.9411764705882353, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "carousel/heading/divider/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "carousel/tile/title") {
                    return [
                            .textColor(UIColor(red: 0.1803921568627451, green: 0.1803921568627451, blue: 0.1803921568627451, alpha: 1)),
                            .font(UIFont(name: "Graphik-Semibold", size: 11.5)!),
                            .textCase(.uppercase)
                    ]
                }
                container.addProperty(identifier: "client-row/tag-secondary/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.9686274509803922, green: 0.9686274509803922, blue: 0.9686274509803922, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "client-row/tag-secondary/title") {
                    return [
                            .textColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1)),
                            .font(UIFont(name: "Graphik-Semibold", size: 9)!),
                            .textCase(.uppercase),
                            .kerning(-0.3272727272727273)
                    ]
                }
                container.addProperty(identifier: "client-row/title") {
                    return [
                            .textColor(UIColor(red: 0.1803921568627451, green: 0.1803921568627451, blue: 0.1803921568627451, alpha: 1)),
                            .font(UIFont(name: "Graphik-Semibold", size: 13)!),
                            .textCase(.none),
                            .kerning(0.1529411764705882)
                    ]
                }
                container.addProperty(identifier: "client-row[edit]/tag-secondary/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.9686274509803922, green: 0.9686274509803922, blue: 0.9686274509803922, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "clients[profile]/block/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.9686274509803922, green: 0.9686274509803922, blue: 0.9686274509803922, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "clients[profile]/navbar/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.9137254901960784, green: 0.9137254901960784, blue: 0.9137254901960784, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "clients[search]/navbar/title") {
                    return [
                            .textColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1)),
                            .font(UIFont(name: "Graphik-Semibold", size: 15)!),
                            .textCase(.uppercase),
                            .kerning(0.14)
                    ]
                }
                container.addProperty(identifier: "color-item/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.9411764705882353, green: 0.9411764705882353, blue: 0.9411764705882353, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "color/info/title") {
                    return [
                            .textColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1)),
                            .font(UIFont(name: "Graphik-Regular", size: 10)!),
                            .textCase(.none),
                            .kerning(0.14)
                    ]
                }
                container.addProperty(identifier: "dashboard/button-filters[selected]/title") {
                    return [
                            .textColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1)),
                            .font(UIFont(name: "Graphik-Semibold", size: 10)!),
                            .textCase(.uppercase)
                    ]
                }
                container.addProperty(identifier: "dashboard/subheading/title") {
                    return [
                            .textColor(UIColor(red: 0.1803921568627451, green: 0.1803921568627451, blue: 0.1803921568627451, alpha: 1)),
                            .font(UIFont(name: "Graphik-Regular", size: 15)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "date/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "date/subtitle") {
                    return [
                            .textColor(UIColor(red: 0.09022616523763408, green: 0.09039683372763942, blue: 0.09128471042798914, alpha: 1)),
                            .font(UIFont(name: "Graphik-Regular", size: 10)!),
                            .textCase(.uppercase),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "date/title") {
                    return [
                            .textColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1)),
                            .font(UIFont(name: "Graphik-Regular", size: 22)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "disabled-toggle/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.847, green: 0.847, blue: 0.847, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "divider/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.9137254901960784, green: 0.9137254901960784, blue: 0.9137254901960784, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "divider/overlay") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "divider/title") {
                    return [
                            .textColor(UIColor(red: 0.1803921568627451, green: 0.1803921568627451, blue: 0.1803921568627451, alpha: 1)),
                            .font(UIFont(name: "Graphik-Semibold", size: 11)!),
                            .textCase(.uppercase),
                            .kerning(1.2)
                    ]
                }
                container.addProperty(identifier: "fab/button-primary/title") {
                    return [
                            .textColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1)),
                            .font(UIFont(name: "Graphik-Semibold", size: 12)!),
                            .textCase(.uppercase)
                    ]
                }
                container.addProperty(identifier: "fab/button-secondary/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "fab/button-secondary/title") {
                    return [
                            .textColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1)),
                            .font(UIFont(name: "Graphik-Semibold", size: 12)!),
                            .textCase(.uppercase)
                    ]
                }
                container.addProperty(identifier: "fab/divider/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.9529411764705882, green: 0.9529411764705882, blue: 0.9529411764705882, alpha: 0))
                    ]
                }
                container.addProperty(identifier: "fab/info/title") {
                    return [
                            .textColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1)),
                            .font(UIFont(name: "Graphik-Semibold", size: 12)!),
                            .textCase(.none)
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
                            .font(UIFont(name: "Graphik-Semibold", size: 12)!),
                            .textCase(.uppercase)
                    ]
                }
                container.addProperty(identifier: "form-field-title/title") {
                    return [
                            .textColor(UIColor(red: 0.1333333333333333, green: 0.1333333333333333, blue: 0.1333333333333333, alpha: 1)),
                            .font(UIFont(name: "Graphik-Semibold", size: 11.5)!),
                            .textCase(.uppercase),
                            .kerning(0.1642857142857143)
                    ]
                }
                container.addProperty(identifier: "form-field/badge/title") {
                    return [
                            .textColor(UIColor(red: 0.4036762020452235, green: 0.4231074743449539, blue: 0.5086050724637681, alpha: 1)),
                            .font(UIFont(name: "Graphik-Regular", size: 12)!),
                            .textCase(.none),
                            .kerning(-0.2)
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
                            .font(UIFont(name: "Graphik-Regular", size: 12.5)!),
                            .textCase(.none),
                            .kerning(0.1666666666666667)
                    ]
                }
                container.addProperty(identifier: "form-field/title") {
                    return [
                            .textColor(UIColor(red: 0.1235505566000938, green: 0.1434680819511414, blue: 0.2327242195606232, alpha: 1)),
                            .font(UIFont(name: "Graphik-Regular", size: 14)!),
                            .textCase(.none),
                            .kerning(0.1647058823529412)
                    ]
                }
                container.addProperty(identifier: "form-type-image-sm/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.9764705882352941, green: 0.9764705882352941, blue: 0.9764705882352941, alpha: 1))
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
                            .font(UIFont(name: "Graphik-Semibold", size: 12)!),
                            .textCase(.uppercase),
                            .kerning(0.16)
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
                            .font(UIFont(name: "Graphik-Semibold", size: 12)!),
                            .textCase(.uppercase),
                            .kerning(0.16)
                    ]
                }
                container.addProperty(identifier: "form-type-image-sm[selected]/overlay") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0))
                    ]
                }
                container.addProperty(identifier: "graph-item/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "graph-item[accent]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.203921568627451, green: 0.2862745098039216, blue: 0.6196078431372549, alpha: 1))
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
                            .backgroundColor(UIColor(red: 0.04705882352941176, green: 0.1372549019607843, blue: 0.2509803921568627, alpha: 1))
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
                            .backgroundColor(UIColor(red: 0.9764705882352941, green: 0.4117647058823529, blue: 0.2431372549019608, alpha: 1))
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
                container.addProperty(identifier: "heading/title") {
                    return [
                            .textColor(UIColor(red: 0.1803921568627451, green: 0.1803921568627451, blue: 0.1803921568627451, alpha: 1)),
                            .font(UIFont(name: "Graphik-Semibold", size: 15)!),
                            .textCase(.uppercase),
                            .kerning(0.1578947368421053)
                    ]
                }
                container.addProperty(identifier: "heading[error]/divider/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.7333333333333333, green: 0.04705882352941176, blue: 0.04705882352941176, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "heading[error]/title") {
                    return [
                            .textColor(UIColor(red: 0.8980392156862745, green: 0.1490196078431373, blue: 0.1803921568627451, alpha: 1)),
                            .font(UIFont(name: "Graphik-Regular", size: 19)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "home-indicator/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.1803921568627451, green: 0.1803921568627451, blue: 0.1803921568627451, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "image/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.9686274509803922, green: 0.9686274509803922, blue: 0.9686274509803922, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "image[highlighted]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.9686274509803922, green: 0.9686274509803922, blue: 0.9686274509803922, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "image[icon-highlighted]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.9686274509803922, green: 0.9686274509803922, blue: 0.9686274509803922, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "image[loading]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.9686274509803922, green: 0.9686274509803922, blue: 0.9686274509803922, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "indicator/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.4156862745098039, green: 0.6039215686274509, blue: 0.04313725490196078, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "info/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.9529411764705882, green: 0.9529411764705882, blue: 0.9529411764705882, alpha: 0))
                    ]
                }
                container.addProperty(identifier: "info/subtitle") {
                    return [
                            .textColor(UIColor(red: 0.1803921568627451, green: 0.1803921568627451, blue: 0.1803921568627451, alpha: 1)),
                            .font(UIFont(name: "Graphik-Regular", size: 11)!),
                            .textCase(.uppercase),
                            .kerning(-0.4)
                    ]
                }
                container.addProperty(identifier: "info/title") {
                    return [
                            .textColor(UIColor(red: 0.1803921568627451, green: 0.1803921568627451, blue: 0.1803921568627451, alpha: 1)),
                            .font(UIFont(name: "Graphik-Semibold", size: 11)!),
                            .textCase(.none),
                            .kerning(0.1466666666666667)
                    ]
                }
                container.addProperty(identifier: "info[label-highlighted]/title") {
                    return [
                            .textColor(UIColor(red: 0.1803921568627451, green: 0.1803921568627451, blue: 0.1803921568627451, alpha: 1)),
                            .font(UIFont(name: "Graphik-Semibold", size: 15)!),
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
                container.addProperty(identifier: "input/body") {
                    return [
                            .textColor(UIColor(red: 0.6510528922080994, green: 0.6585400104522705, blue: 0.6951061487197876, alpha: 1)),
                            .font(UIFont(name: "Graphik-Regular", size: 12.5)!),
                            .textCase(.none),
                            .kerning(0.1666666666666667)
                    ]
                }
                container.addProperty(identifier: "input/button-tertiary/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "input/carousel/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.9764705882352941, green: 0.9764705882352941, blue: 0.9764705882352941, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "input/carousel/indicator/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.2980392156862746, green: 0.8156862745098039, blue: 0, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "input/carousel[disabled]/overlay") {
                    return [
                            .backgroundColor(UIColor(red: 0.9764705882352941, green: 0.9764705882352941, blue: 0.9764705882352941, alpha: 0.900197))
                    ]
                }
                container.addProperty(identifier: "input/carousel[disabled]/title") {
                    return [
                            .textColor(UIColor(red: 0.5647058823529412, green: 0.5647058823529412, blue: 0.5647058823529412, alpha: 1)),
                            .font(UIFont(name: "Graphik-Semibold", size: 11)!),
                            .textCase(.uppercase),
                            .kerning(0.1294117647058823)
                    ]
                }
                container.addProperty(identifier: "input/subtitle") {
                    return [
                            .textColor(UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)),
                            .font(UIFont(name: "Graphik-Regular", size: 12)!),
                            .textCase(.none),
                            .kerning(0.2016)
                    ]
                }
                container.addProperty(identifier: "input/tag-status/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0))
                    ]
                }
                container.addProperty(identifier: "input/title") {
                    return [
                            .textColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1)),
                            .font(UIFont(name: "Graphik-Regular", size: 13)!),
                            .textCase(.none),
                            .kerning(0.1529411764705882)
                    ]
                }
                container.addProperty(identifier: "input[blurred]/title") {
                    return [
                            .textColor(UIColor(red: 0.7254901960784313, green: 0.7254901960784313, blue: 0.7254901960784313, alpha: 1)),
                            .font(UIFont(name: "Graphik-Regular", size: 12.5)!),
                            .textCase(.none),
                            .kerning(0.17)
                    ]
                }
                container.addProperty(identifier: "input[carousel]/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0))
                    ]
                }
                container.addProperty(identifier: "input[carousel]/title") {
                    return [
                            .textColor(UIColor(red: 0.1333333333333333, green: 0.1333333333333333, blue: 0.1333333333333333, alpha: 1)),
                            .font(UIFont(name: "Graphik-Semibold", size: 11)!),
                            .textCase(.uppercase)
                    ]
                }
                container.addProperty(identifier: "input[compact]/subtitle") {
                    return [
                            .textColor(UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)),
                            .font(UIFont(name: "Graphik-Regular", size: 12.5)!),
                            .textCase(.none),
                            .kerning(0.2083333333333333)
                    ]
                }
                container.addProperty(identifier: "input[compact]/title") {
                    return [
                            .textColor(UIColor(red: 0.1803921568627451, green: 0.1803921568627451, blue: 0.1803921568627451, alpha: 1)),
                            .font(UIFont(name: "Graphik-Regular", size: 14)!),
                            .textCase(.none),
                            .kerning(0.19)
                    ]
                }
                container.addProperty(identifier: "input[date-time]/button-secondary/title") {
                    return [
                            .textColor(UIColor(red: 0.1803921568627451, green: 0.1803921568627451, blue: 0.1803921568627451, alpha: 1)),
                            .font(UIFont(name: "Graphik-Semibold", size: 10.5)!),
                            .textCase(.uppercase)
                    ]
                }
                container.addProperty(identifier: "input[disabled]/subtitle") {
                    return [
                            .textColor(UIColor(red: 0.1803921568627451, green: 0.1803921568627451, blue: 0.1803921568627451, alpha: 1)),
                            .font(UIFont(name: "Graphik-Regular", size: 14)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "input[disabled]/title") {
                    return [
                            .textColor(UIColor(red: 0.1803921568627451, green: 0.1803921568627451, blue: 0.1803921568627451, alpha: 1)),
                            .font(UIFont(name: "Graphik-Regular", size: 16)!),
                            .textCase(.none),
                            .kerning(0.1882352941176471)
                    ]
                }
                container.addProperty(identifier: "input[error]/divider/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.7333333333333333, green: 0.04705882352941176, blue: 0.04705882352941176, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "input[error]/title") {
                    return [
                            .textColor(UIColor(red: 0.8980392156862745, green: 0.1490196078431373, blue: 0.1803921568627451, alpha: 1)),
                            .font(UIFont(name: "Graphik-Regular", size: 16)!),
                            .textCase(.none),
                            .kerning(0.1882352941176471)
                    ]
                }
                container.addProperty(identifier: "input[radio-box-stock]/tag-status/title") {
                    return [
                            .textColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1)),
                            .font(UIFont(name: "Graphik-Regular", size: 11)!),
                            .textCase(.uppercase),
                            .kerning(-0.09565217391304348)
                    ]
                }
                container.addProperty(identifier: "input[radio-box]/body") {
                    return [
                            .textColor(UIColor(red: 0.1803921568627451, green: 0.1803921568627451, blue: 0.1803921568627451, alpha: 1)),
                            .font(UIFont(name: "Graphik-Regular", size: 15)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "input[tag]/tag-secondary/title") {
                    return [
                            .textColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1)),
                            .font(UIFont(name: "Graphik-Regular", size: 13)!),
                            .textCase(.none),
                            .kerning(0.17)
                    ]
                }
                container.addProperty(identifier: "line") {
                    return [
                            .backgroundColor(UIColor(red: 0.847, green: 0.847, blue: 0.847, alpha: 0.35))
                    ]
                }
                container.addProperty(identifier: "list-row/body") {
                    return [
                            .textColor(UIColor(red: 0.1803921568627451, green: 0.1803921568627451, blue: 0.1803921568627451, alpha: 1)),
                            .font(UIFont(name: "Graphik-Regular", size: 12.5)!),
                            .textCase(.none),
                            .kerning(0.15625)
                    ]
                }
                container.addProperty(identifier: "list-row/title") {
                    return [
                            .textColor(UIColor(red: 0.1803921568627451, green: 0.1803921568627451, blue: 0.1803921568627451, alpha: 1)),
                            .font(UIFont(name: "Graphik-Semibold", size: 11.5)!),
                            .textCase(.uppercase),
                            .kerning(0.1277777777777778)
                    ]
                }
                container.addProperty(identifier: "list-row[double-edit]/body") {
                    return [
                            .textColor(UIColor(red: 0.1803921568627451, green: 0.1803921568627451, blue: 0.1803921568627451, alpha: 1)),
                            .font(UIFont(name: "Graphik-Regular", size: 16)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "list-row[highlighted]/title") {
                    return [
                            .textColor(UIColor(red: 0.8980392156862745, green: 0.1490196078431373, blue: 0.1803921568627451, alpha: 1)),
                            .font(UIFont(name: "Graphik-Semibold", size: 12)!),
                            .textCase(.uppercase),
                            .kerning(0.1333333333333334)
                    ]
                }
                container.addProperty(identifier: "list-row[stacked]/body") {
                    return [
                            .textColor(UIColor(red: 0.7254901960784313, green: 0.7254901960784313, blue: 0.7254901960784313, alpha: 1)),
                            .font(UIFont(name: "Graphik-Regular", size: 16)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "list/heading/title") {
                    return [
                            .textColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1)),
                            .font(UIFont(name: "Graphik-Semibold", size: 17)!),
                            .textCase(.none),
                            .kerning(0.1821428571428571)
                    ]
                }
                container.addProperty(identifier: "list/list-row/title") {
                    return [
                            .textColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1)),
                            .font(UIFont(name: "Graphik-Regular", size: 12)!),
                            .textCase(.uppercase),
                            .kerning(0.1356521739130435)
                    ]
                }
                container.addProperty(identifier: "login/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "login/button-primary/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "login/button-primary/title") {
                    return [
                            .textColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1)),
                            .font(UIFont(name: "Graphik-Semibold", size: 14)!),
                            .textCase(.uppercase),
                            .kerning(0.1555555555555556)
                    ]
                }
                container.addProperty(identifier: "login/subtitle") {
                    return [
                            .textColor(UIColor(red: 0.1803921568627451, green: 0.1803921568627451, blue: 0.1803921568627451, alpha: 1)),
                            .font(UIFont(name: "Graphik-Regular", size: 14)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "login/title") {
                    return [
                            .textColor(UIColor(red: 0.1803921568627451, green: 0.1803921568627451, blue: 0.1803921568627451, alpha: 1)),
                            .font(UIFont(name: "Graphik-Semibold", size: 14)!),
                            .textCase(.none),
                            .kerning(0.1555555555555556)
                    ]
                }
                container.addProperty(identifier: "login[keycloak]/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "login[keycloak]/overlay") {
                    return [
                            .backgroundColor(UIColor(red: 0.04705882352941176, green: 0.1372549019607843, blue: 0.2509803921568627, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "message-view/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "message-view/subtitle") {
                    return [
                            .textColor(UIColor(red: 0.1803921568627451, green: 0.1803921568627451, blue: 0.1803921568627451, alpha: 1)),
                            .font(UIFont(name: "Graphik-Regular", size: 12)!),
                            .textCase(.none),
                            .kerning(0.16)
                    ]
                }
                container.addProperty(identifier: "message-view/title") {
                    return [
                            .textColor(UIColor(red: 0.1803921568627451, green: 0.1803921568627451, blue: 0.1803921568627451, alpha: 1)),
                            .font(UIFont(name: "Graphik-Semibold", size: 16)!),
                            .textCase(.uppercase),
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
                            .textColor(UIColor(red: 0.1803921568627451, green: 0.1803921568627451, blue: 0.1803921568627451, alpha: 1)),
                            .font(UIFont(name: "Graphik-Regular", size: 15)!),
                            .textCase(.none),
                            .kerning(0.1764705882352941)
                    ]
                }
                container.addProperty(identifier: "modal/button-icon-right/title") {
                    return [
                            .textColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1)),
                            .font(UIFont(name: "Graphik-Regular", size: 15)!),
                            .textCase(.none),
                            .kerning(0.1764705882352941)
                    ]
                }
                container.addProperty(identifier: "modal/button-icon-right[disabled]/title") {
                    return [
                            .textColor(UIColor(red: 0.7254901960784313, green: 0.7254901960784313, blue: 0.7254901960784313, alpha: 1)),
                            .font(UIFont(name: "Graphik-Regular", size: 15)!),
                            .textCase(.none),
                            .kerning(0.1764705882352941)
                    ]
                }
                container.addProperty(identifier: "modal/heading/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "modal/navbar/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.9764705882352941, green: 0.9764705882352941, blue: 0.9764705882352941, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "modal/navbar/divider/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.9764705882352941, green: 0.9764705882352941, blue: 0.9764705882352941, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "modal/navbar/title") {
                    return [
                            .textColor(UIColor(red: 0.1803921568627451, green: 0.1803921568627451, blue: 0.1803921568627451, alpha: 1)),
                            .font(UIFont(name: "Graphik-Semibold", size: 13.5)!),
                            .textCase(.uppercase),
                            .kerning(0.15)
                    ]
                }
                container.addProperty(identifier: "modal/search/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.9686274509803922, green: 0.9686274509803922, blue: 0.9686274509803922, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "modal/search[highlighted]/title") {
                    return [
                            .textColor(UIColor(red: 0.1235505566000938, green: 0.1434680819511414, blue: 0.2327242195606232, alpha: 1)),
                            .font(UIFont(name: "Graphik-Regular", size: 16)!),
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
                            .textColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1)),
                            .font(UIFont(name: "Graphik-Regular", size: 13)!),
                            .textCase(.none),
                            .kerning(0.1733333333333333)
                    ]
                }
                container.addProperty(identifier: "modal/title") {
                    return [
                            .textColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1)),
                            .font(UIFont(name: "Graphik-Semibold", size: 14)!),
                            .textCase(.uppercase),
                            .kerning(0.14)
                    ]
                }
                container.addProperty(identifier: "navbar-list/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "navbar-list/body") {
                    return [
                            .textColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1)),
                            .font(UIFont(name: "Graphik-Regular", size: 14)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "navbar-list/divider/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "navbar-list/overlay") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0.50098))
                    ]
                }
                container.addProperty(identifier: "navbar-list/subtitle") {
                    return [
                            .textColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1)),
                            .font(UIFont(name: "Graphik-Regular", size: 16)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "navbar-list/title") {
                    return [
                            .textColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1)),
                            .font(UIFont(name: "Graphik-Semibold", size: 20)!),
                            .textCase(.none),
                            .kerning(0.2222222222222223)
                    ]
                }
                container.addProperty(identifier: "navbar-list[short]/overlay") {
                    return [
                            .backgroundColor(UIColor(red: 0, green: 0.1568627450980392, blue: 0.3333333333333333, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "navbar-profile/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.9137254901960784, green: 0.9137254901960784, blue: 0.9137254901960784, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "navbar-profile/block/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0))
                    ]
                }
                container.addProperty(identifier: "navbar-profile/block/subtitle") {
                    return [
                            .textColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1)),
                            .font(UIFont(name: "Graphik-Regular", size: 9)!),
                            .textCase(.uppercase),
                            .kerning(0.36)
                    ]
                }
                container.addProperty(identifier: "navbar-profile/block/title") {
                    return [
                            .textColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1)),
                            .font(UIFont(name: "Graphik-Semibold", size: 15)!),
                            .textCase(.none),
                            .kerning(0.1)
                    ]
                }
                container.addProperty(identifier: "navbar-profile/body") {
                    return [
                            .textColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1)),
                            .font(UIFont(name: "Graphik-Regular", size: 18)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "navbar-profile/button-tertiary/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0.2))
                    ]
                }
                container.addProperty(identifier: "navbar-profile/button-tertiary/title") {
                    return [
                            .textColor(UIColor(red: 0.1686274509803922, green: 0.1686274509803922, blue: 0.1686274509803922, alpha: 1)),
                            .font(UIFont(name: "Graphik-Regular", size: 15)!),
                            .textCase(.uppercase),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "navbar-profile/divider/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.9137254901960784, green: 0.9137254901960784, blue: 0.9137254901960784, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "navbar-profile/subtitle") {
                    return [
                            .textColor(UIColor(red: 0.1686274509803922, green: 0.1686274509803922, blue: 0.1686274509803922, alpha: 1)),
                            .font(UIFont(name: "Graphik-Semibold", size: 16)!),
                            .textCase(.uppercase),
                            .kerning(0.2285714285714285)
                    ]
                }
                container.addProperty(identifier: "navbar-profile/tag-primary/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.8980392156862745, green: 0.1490196078431373, blue: 0.1803921568627451, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "navbar-profile/tag-primary/title") {
                    return [
                            .textColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1)),
                            .font(UIFont(name: "Graphik-Semibold", size: 10)!),
                            .textCase(.uppercase),
                            .kerning(0.1818181818181818)
                    ]
                }
                container.addProperty(identifier: "navbar-profile/tag-secondary/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "navbar-profile/tag-secondary/title") {
                    return [
                            .textColor(UIColor(red: 0.1803921568627451, green: 0.1803921568627451, blue: 0.1803921568627451, alpha: 1)),
                            .font(UIFont(name: "Graphik-Semibold", size: 10)!),
                            .textCase(.uppercase),
                            .kerning(0.1818181818181818)
                    ]
                }
                container.addProperty(identifier: "navbar-profile/title") {
                    return [
                            .textColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1)),
                            .font(UIFont(name: "Graphik-Semibold", size: 18)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "navbar/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "navbar/divider/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.9137254901960784, green: 0.9137254901960784, blue: 0.9137254901960784, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "navbar/subtitle") {
                    return [
                            .textColor(UIColor(red: 0.5637555248790429, green: 0.5747846262623333, blue: 0.6351902173913043, alpha: 1)),
                            .font(UIFont(name: "Graphik-Regular", size: 13)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "navbar/title") {
                    return [
                            .textColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1)),
                            .font(UIFont(name: "Graphik-Semibold", size: 15)!),
                            .textCase(.uppercase),
                            .kerning(-0.14)
                    ]
                }
                container.addProperty(identifier: "navbar[image-search]/button-icon-right/title") {
                    return [
                            .textColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1)),
                            .font(UIFont(name: "Graphik-Regular", size: 15)!),
                            .textCase(.none),
                            .kerning(0.18)
                    ]
                }
                container.addProperty(identifier: "navbar[image]/search/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0.95))
                    ]
                }
                container.addProperty(identifier: "navbar[image]/search/title") {
                    return [
                            .textColor(UIColor(red: 0.1803921568627451, green: 0.1803921568627451, blue: 0.1803921568627451, alpha: 1)),
                            .font(UIFont(name: "Graphik-Semibold", size: 14)!),
                            .textCase(.none),
                            .kerning(0.25)
                    ]
                }
                container.addProperty(identifier: "navbar[image]/title") {
                    return [
                            .textColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1)),
                            .font(UIFont(name: "Graphik-Semibold", size: 15)!),
                            .textCase(.uppercase),
                            .kerning(-0.14)
                    ]
                }
                container.addProperty(identifier: "note-info/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0))
                    ]
                }
                container.addProperty(identifier: "note-instructions/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.9725490196078431, green: 0.9725490196078431, blue: 0.9725490196078431, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "note-instructions/body") {
                    return [
                            .textColor(UIColor(red: 0.1803921568627451, green: 0.1803921568627451, blue: 0.1803921568627451, alpha: 1)),
                            .font(UIFont(name: "Graphik-Regular", size: 14)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "note-instructions/subtitle") {
                    return [
                            .textColor(UIColor(red: 0.1803921568627451, green: 0.1803921568627451, blue: 0.1803921568627451, alpha: 1)),
                            .font(UIFont(name: "Graphik-Semibold", size: 14)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "note-instructions/title") {
                    return [
                            .textColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1)),
                            .font(UIFont(name: "Graphik-Regular", size: 16)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "note/body") {
                    return [
                            .textColor(UIColor(red: 0.1803921568627451, green: 0.1803921568627451, blue: 0.1803921568627451, alpha: 1)),
                            .font(UIFont(name: "Graphik-Regular", size: 11)!),
                            .textCase(.none)
                    ]
                }
                container.addProperty(identifier: "note/title") {
                    return [
                            .textColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1)),
                            .font(UIFont(name: "Graphik-Semibold", size: 14)!),
                            .textCase(.uppercase),
                            .kerning(0.4946666666666666)
                    ]
                }
                container.addProperty(identifier: "note[alert]/body") {
                    return [
                            .textColor(UIColor(red: 0.7333333333333333, green: 0.04705882352941176, blue: 0.04705882352941176, alpha: 1)),
                            .font(UIFont(name: "Graphik-Regular", size: 15)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "note[alert]/title") {
                    return [
                            .textColor(UIColor(red: 0.7333333333333333, green: 0.04705882352941176, blue: 0.04705882352941176, alpha: 1)),
                            .font(UIFont(name: "Graphik-Semibold", size: 14)!),
                            .textCase(.uppercase),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "note[rating]/title") {
                    return [
                            .textColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1)),
                            .font(UIFont(name: "Graphik-Semibold", size: 11)!),
                            .textCase(.uppercase)
                    ]
                }
                container.addProperty(identifier: "notification/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "notification/title") {
                    return [
                            .textColor(UIColor(red: 0.1803921568627451, green: 0.1803921568627451, blue: 0.1803921568627451, alpha: 1)),
                            .font(UIFont(name: "Graphik-Regular", size: 16)!),
                            .textCase(.none),
                            .kerning(0.15)
                    ]
                }
                container.addProperty(identifier: "overlay") {
                    return [
                            .backgroundColor(UIColor(red: 0, green: 0, blue: 0, alpha: 0.35))
                    ]
                }
                container.addProperty(identifier: "product/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "product/body") {
                    return [
                            .textColor(UIColor(red: 0.1803921568627451, green: 0.1803921568627451, blue: 0.1803921568627451, alpha: 1)),
                            .font(UIFont(name: "Graphik-Regular", size: 13.5)!),
                            .textCase(.none),
                            .kerning(0.18)
                    ]
                }
                container.addProperty(identifier: "product/subtitle") {
                    return [
                            .textColor(UIColor(red: 0.1803921568627451, green: 0.1803921568627451, blue: 0.1803921568627451, alpha: 1)),
                            .font(UIFont(name: "Graphik-Semibold", size: 10)!),
                            .textCase(.uppercase),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "product/tag-primary/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0))
                    ]
                }
                container.addProperty(identifier: "product/tag-primary/title") {
                    return [
                            .textColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1)),
                            .font(UIFont(name: "Graphik-Regular", size: 13)!),
                            .textCase(.uppercase),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "product/tag-secondary/title") {
                    return [
                            .textColor(UIColor(red: 0.3294117647058823, green: 0.3294117647058823, blue: 0.3294117647058823, alpha: 1)),
                            .font(UIFont(name: "Graphik-Regular", size: 13)!),
                            .textCase(.uppercase),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "product/title") {
                    return [
                            .textColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1)),
                            .font(UIFont(name: "Graphik-Semibold", size: 14)!),
                            .textCase(.none),
                            .kerning(0.1647058823529412)
                    ]
                }
                container.addProperty(identifier: "product[image]/image[loading]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.9686274509803922, green: 0.9686274509803922, blue: 0.9686274509803922, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "product[info]/button-tertiary/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0))
                    ]
                }
                container.addProperty(identifier: "product[info]/button-tertiary/title") {
                    return [
                            .textColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1)),
                            .font(UIFont(name: "Graphik-Regular", size: 10)!),
                            .textCase(.uppercase),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "product[info]/title") {
                    return [
                            .textColor(UIColor(red: 0.1803921568627451, green: 0.1803921568627451, blue: 0.1803921568627451, alpha: 1)),
                            .font(UIFont(name: "Graphik-Semibold", size: 14.5)!),
                            .textCase(.uppercase)
                    ]
                }
                container.addProperty(identifier: "product[row]/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "product[row]/divider/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.9764705882352941, green: 0.9764705882352941, blue: 0.9764705882352941, alpha: 0))
                    ]
                }
                container.addProperty(identifier: "product[row]/info/subtitle") {
                    return [
                            .textColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1)),
                            .font(UIFont(name: "Graphik-Regular", size: 11)!),
                            .textCase(.none)
                    ]
                }
                container.addProperty(identifier: "product[row]/info/title") {
                    return [
                            .textColor(UIColor(red: 0.1803921568627451, green: 0.1803921568627451, blue: 0.1803921568627451, alpha: 1)),
                            .font(UIFont(name: "Graphik-Regular", size: 11)!),
                            .textCase(.none)
                    ]
                }
                container.addProperty(identifier: "product[row]/product/title") {
                    return [
                            .textColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1)),
                            .font(UIFont(name: "Graphik-Semibold", size: 11)!),
                            .textCase(.uppercase)
                    ]
                }
                container.addProperty(identifier: "product[row]/title") {
                    return [
                            .textColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1)),
                            .font(UIFont(name: "Graphik-Semibold", size: 12)!),
                            .textCase(.uppercase)
                    ]
                }
                container.addProperty(identifier: "products/button-filters[selected]/title") {
                    return [
                            .textColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1)),
                            .font(UIFont(name: "Graphik-Semibold", size: 10)!),
                            .textCase(.uppercase)
                    ]
                }
                container.addProperty(identifier: "products/subtitle") {
                    return [
                            .textColor(UIColor(red: 0.1803921568627451, green: 0.1803921568627451, blue: 0.1803921568627451, alpha: 1)),
                            .font(UIFont(name: "Graphik-Semibold", size: 10)!),
                            .textCase(.uppercase),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "products/title") {
                    return [
                            .textColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1)),
                            .font(UIFont(name: "Graphik-Semibold", size: 18)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "progress-item/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.1803921568627451, green: 0.1803921568627451, blue: 0.1803921568627451, alpha: 1))
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
                            .backgroundColor(UIColor(red: 0.9411764705882353, green: 0.9411764705882353, blue: 0.9411764705882353, alpha: 1))
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
                            .textColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1)),
                            .font(UIFont(name: "Graphik-Semibold", size: 12)!),
                            .textCase(.none)
                    ]
                }
                container.addProperty(identifier: "pulldown-item[disabled]/title") {
                    return [
                            .textColor(UIColor(red: 0.7254901960784313, green: 0.7254901960784313, blue: 0.7254901960784313, alpha: 1)),
                            .font(UIFont(name: "Graphik-Semibold", size: 12)!),
                            .textCase(.none)
                    ]
                }
                container.addProperty(identifier: "pulldown/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "rating-details/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "rating-details/title") {
                    return [
                            .textColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1)),
                            .font(UIFont(name: "Graphik-Regular", size: 13)!),
                            .textCase(.none)
                    ]
                }
                container.addProperty(identifier: "search/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.9686274509803922, green: 0.9686274509803922, blue: 0.9686274509803922, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "search/title") {
                    return [
                            .textColor(UIColor(red: 0.1803921568627451, green: 0.1803921568627451, blue: 0.1803921568627451, alpha: 1)),
                            .font(UIFont(name: "Graphik-Semibold", size: 14)!),
                            .textCase(.none),
                            .kerning(0.25)
                    ]
                }
                container.addProperty(identifier: "search[highlighted]/title") {
                    return [
                            .textColor(UIColor(red: 0.1803921568627451, green: 0.1803921568627451, blue: 0.1803921568627451, alpha: 1)),
                            .font(UIFont(name: "Graphik-Regular", size: 14)!),
                            .textCase(.none),
                            .kerning(0.5)
                    ]
                }
                container.addProperty(identifier: "searchbar/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.04705882352941176, green: 0.1372549019607843, blue: 0.2509803921568627, alpha: 0))
                    ]
                }
                container.addProperty(identifier: "searchbar/divider/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "stat-item/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0))
                    ]
                }
                container.addProperty(identifier: "stat-item/subtitle") {
                    return [
                            .textColor(UIColor(red: 0.1803921568627451, green: 0.1803921568627451, blue: 0.1803921568627451, alpha: 1)),
                            .font(UIFont(name: "Graphik-Regular", size: 13)!),
                            .textCase(.none)
                    ]
                }
                container.addProperty(identifier: "stat-item/title") {
                    return [
                            .textColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1)),
                            .font(UIFont(name: "Graphik-Semibold", size: 10)!),
                            .textCase(.uppercase)
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
                            .textColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1)),
                            .font(UIFont(name: "Graphik-Semibold", size: 14)!),
                            .textCase(.uppercase),
                            .kerning(0.1866666666666667)
                    ]
                }
                container.addProperty(identifier: "subheading[error]/divider/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.7333333333333333, green: 0.04705882352941176, blue: 0.04705882352941176, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "subheading[error]/title") {
                    return [
                            .textColor(UIColor(red: 0.8980392156862745, green: 0.1490196078431373, blue: 0.1803921568627451, alpha: 1)),
                            .font(UIFont(name: "Graphik-Semibold", size: 15)!),
                            .textCase(.uppercase),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "subtitle") {
                    return [
                            .textColor(UIColor(red: 0.1803921568627451, green: 0.1803921568627451, blue: 0.1803921568627451, alpha: 1)),
                            .font(UIFont(name: "Graphik-Regular", size: 14)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "tabbar/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.9764705882352941, green: 0.9764705882352941, blue: 0.9764705882352941, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "tabbar/divider/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.9137254901960784, green: 0.9137254901960784, blue: 0.9137254901960784, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "tabswitch/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.9146190881729126, green: 0.9147508144378662, blue: 0.9214738011360168, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "tag-primary-icon/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.8980392156862745, green: 0.1490196078431373, blue: 0.1803921568627451, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "tag-primary/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.8980392156862745, green: 0.1490196078431373, blue: 0.1803921568627451, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "tag-primary/title") {
                    return [
                            .textColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1)),
                            .font(UIFont(name: "Graphik-Semibold", size: 9)!),
                            .textCase(.uppercase),
                            .kerning(0.18)
                    ]
                }
                container.addProperty(identifier: "tag-secondary/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0))
                    ]
                }
                container.addProperty(identifier: "tag-secondary/title") {
                    return [
                            .textColor(UIColor(red: 0.1803921568627451, green: 0.1803921568627451, blue: 0.1803921568627451, alpha: 1)),
                            .font(UIFont(name: "Graphik-Regular", size: 13)!),
                            .textCase(.uppercase),
                            .kerning(0.4)
                    ]
                }
                container.addProperty(identifier: "tag-secondary[discount]/title") {
                    return [
                            .textColor(UIColor(red: 0.8470588235294118, green: 0.8470588235294118, blue: 0.8470588235294118, alpha: 1)),
                            .font(UIFont(name: "Graphik-Regular", size: 13)!),
                            .textCase(.none),
                            .kerning(0.08666666666666667)
                    ]
                }
                container.addProperty(identifier: "tag-status/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0.75))
                    ]
                }
                container.addProperty(identifier: "tag-status/title") {
                    return [
                            .textColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1)),
                            .font(UIFont(name: "Graphik-Regular", size: 10)!),
                            .textCase(.uppercase),
                            .kerning(-0.09090909090909091)
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
                container.addProperty(identifier: "tile/subtitle") {
                    return [
                            .textColor(UIColor(red: 0.1803921568627451, green: 0.1803921568627451, blue: 0.1803921568627451, alpha: 1)),
                            .font(UIFont(name: "Graphik-Regular", size: 14)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "tile/title") {
                    return [
                            .textColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1)),
                            .font(UIFont(name: "Graphik-Regular", size: 14)!),
                            .textCase(.none),
                            .kerning(0.1647058823529412)
                    ]
                }
                container.addProperty(identifier: "timeline-date/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "timeline-date/subtitle") {
                    return [
                            .textColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1)),
                            .font(UIFont(name: "Graphik-Regular", size: 11)!),
                            .textCase(.uppercase),
                            .kerning(0.25)
                    ]
                }
                container.addProperty(identifier: "timeline-date/title") {
                    return [
                            .textColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1)),
                            .font(UIFont(name: "Graphik-Semibold", size: 19)!),
                            .textCase(.uppercase),
                            .kerning(0.2192307692307692)
                    ]
                }
                container.addProperty(identifier: "timeline-heading/title") {
                    return [
                            .textColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1)),
                            .font(UIFont(name: "Graphik-Regular", size: 12)!),
                            .textCase(.uppercase),
                            .kerning(0.1542857142857143)
                    ]
                }
                container.addProperty(identifier: "timeline-row/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.9764705882352941, green: 0.9764705882352941, blue: 0.9764705882352941, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "timeline-row/info/title") {
                    return [
                            .textColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1)),
                            .font(UIFont(name: "Graphik-Regular", size: 11)!),
                            .textCase(.none)
                    ]
                }
                container.addProperty(identifier: "timeline-row/info[label]/subtitle") {
                    return [
                            .textColor(UIColor(red: 0.6509803921568628, green: 0.6588235294117647, blue: 0.6941176470588235, alpha: 1)),
                            .font(UIFont(name: "Graphik-Regular", size: 10.5)!),
                            .textCase(.uppercase),
                            .kerning(0.1615384615384616)
                    ]
                }
                container.addProperty(identifier: "timeline-row/subtitle") {
                    return [
                            .textColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1)),
                            .font(UIFont(name: "Graphik-Regular", size: 10)!),
                            .textCase(.uppercase),
                            .kerning(0.1538461538461539)
                    ]
                }
                container.addProperty(identifier: "timeline-row/tag-status/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0.5))
                    ]
                }
                container.addProperty(identifier: "timeline-row/title") {
                    return [
                            .textColor(UIColor(red: 0.1803921568627451, green: 0.1803921568627451, blue: 0.1803921568627451, alpha: 1)),
                            .font(UIFont(name: "Graphik-Semibold", size: 13)!),
                            .textCase(.uppercase),
                            .kerning(0.1529411764705882)
                    ]
                }
                container.addProperty(identifier: "timeline-row[future]/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "title") {
                    return [
                            .textColor(UIColor(red: 0.1803921568627451, green: 0.1803921568627451, blue: 0.1803921568627451, alpha: 1)),
                            .font(UIFont(name: "Graphik-Semibold", size: 15)!),
                            .textCase(.none),
                            .kerning(0.1764705882352941)
                    ]
                }
                container.addProperty(identifier: "toast/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "toast/title") {
                    return [
                            .textColor(UIColor(red: 0.1803921568627451, green: 0.1803921568627451, blue: 0.1803921568627451, alpha: 1)),
                            .font(UIFont(name: "Graphik-Regular", size: 16)!),
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
                            .textColor(UIColor(red: 0.8980392156862745, green: 0.1490196078431373, blue: 0.1803921568627451, alpha: 1)),
                            .font(UIFont(name: "Graphik-Regular", size: 16)!),
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
                            .textColor(UIColor(red: 0.2666666666666667, green: 0.5333333333333333, blue: 0.2470588235294118, alpha: 1)),
                            .font(UIFont(name: "Graphik-Regular", size: 16)!),
                            .textCase(.none),
                            .kerning(0.15)
                    ]
                }
                container.addProperty(identifier: "toggle/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.1803921568627451, green: 0.1803921568627451, blue: 0.1803921568627451, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "toggle[off]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.9411764705882353, green: 0.9372549019607843, blue: 0.9294117647058824, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "toolbar/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.9529411764705882, green: 0.9529411764705882, blue: 0.9529411764705882, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "toolbar/button-icon-left/title") {
                    return [
                            .textColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1)),
                            .font(UIFont(name: "Graphik-Semibold", size: 17)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "toolbar/button-icon-right/title") {
                    return [
                            .textColor(UIColor(red: 0.1803921568627451, green: 0.1803921568627451, blue: 0.1803921568627451, alpha: 1)),
                            .font(UIFont(name: "Graphik-Regular", size: 15)!),
                            .textCase(.uppercase),
                            .kerning(0.1764705882352941)
                    ]
                }
                container.addProperty(identifier: "toolbar/title") {
                    return [
                            .textColor(UIColor(red: 0.1803921568627451, green: 0.1803921568627451, blue: 0.1803921568627451, alpha: 1)),
                            .font(UIFont(name: "Graphik-Semibold", size: 11)!),
                            .textCase(.uppercase),
                            .kerning(0.165)
                    ]
                }
                container.addProperty(identifier: "toolbar[search]/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.9137254901960784, green: 0.9137254901960784, blue: 0.9137254901960784, alpha: 0.3))
                    ]
                }
                container.addProperty(identifier: "toolbar[search]/divider/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.9764705882352941, green: 0.9764705882352941, blue: 0.9764705882352941, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "toolbar[tabs]/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "totals/info/title") {
                    return [
                            .textColor(UIColor(red: 0.1803921568627451, green: 0.1803921568627451, blue: 0.1803921568627451, alpha: 1)),
                            .font(UIFont(name: "Graphik-Regular", size: 13)!),
                            .textCase(.none),
                            .kerning(0.1733333333333333)
                    ]
                }
                container.addProperty(identifier: "totals/info[label-highlighted]/title") {
                    return [
                            .textColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1)),
                            .font(UIFont(name: "Graphik-Semibold", size: 16)!),
                            .textCase(.none),
                            .kerning(0.2133333333333333)
                    ]
                }
                container.addProperty(identifier: "transaction-details/body") {
                    return [
                            .textColor(UIColor(red: 0.1803921568627451, green: 0.1803921568627451, blue: 0.1803921568627451, alpha: 1)),
                            .font(UIFont(name: "Graphik-Regular", size: 13)!),
                            .textCase(.none),
                            .kerning(0.1733333333333333)
                    ]
                }
                container.addProperty(identifier: "transaction-details/button-tertiary/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "transaction-details/button-tertiary/title") {
                    return [
                            .textColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1)),
                            .font(UIFont(name: "Graphik-Regular", size: 11)!),
                            .textCase(.uppercase),
                            .kerning(0.18)
                    ]
                }
                container.addProperty(identifier: "transaction-details/divider/background") {
                    return [
                            .backgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1))
                    ]
                }
                container.addProperty(identifier: "transaction-details/subtitle") {
                    return [
                            .textColor(UIColor(red: 0.1803921568627451, green: 0.1803921568627451, blue: 0.1803921568627451, alpha: 1)),
                            .font(UIFont(name: "Graphik-Regular", size: 12)!),
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
                            .textColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1)),
                            .font(UIFont(name: "Graphik-Regular", size: 28)!),
                            .textCase(.none),
                            .kerning(0.2)
                    ]
                }
                container.addProperty(identifier: "widget/background") {
                    return [
                            .backgroundColor(UIColor(red: 0.9529411764705882, green: 0.9529411764705882, blue: 0.9529411764705882, alpha: 1))
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

// swiftlint:enable all