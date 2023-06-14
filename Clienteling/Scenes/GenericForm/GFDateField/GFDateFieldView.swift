// Zenith Clienteling
// 23/01/2022

import SwiftUI
import MaisonKit
import Combine

struct GFDateFieldView: View {
    
    @Binding private var selectedDate: Date?
    private let config: GFFieldConfiguration
    private let shouldDisableDate: ((Date) -> Bool)?
    @State private var isExpanded: Bool = false
    @State private var calendarHeight: CGFloat = 300
    
    init(selectedDate: Binding<Date?>, config: GFFieldConfiguration, shouldDisableDate: ((Date) -> Bool)? = nil) {
        self._selectedDate = selectedDate
        self.shouldDisableDate = shouldDisableDate
        self.config = config
    }
    
    private var selectedDateString : String? {
        let dateFormatter = DateFormatter.default
        if let date = self.selectedDate {
            return dateFormatter.string(from: date)
        }
        return nil
    }

    private var showClearButton: Bool {
        self.config.isEditable && !self.config.showRequiredSymbol
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            GFFieldView(title: self.config.title, isRequired: self.config.showRequiredSymbol, content: {
                Button(action: { withAnimation {
                    self.isExpanded.toggle()
                    self.calendarHeight = 300
                }}) {
                    Text(verbatim: self.selectedDateString ?? "")
                        .placeHolder(Text(self.config.placeholder), shouldShow: self.selectedDate == nil)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .style("title")
                }
                .disabled(!self.config.isEditable)
            }, accessory: {
                // If we are in editing mode, we show an clear button
                AccessoryViewFactory.clearButton(action: { self.selectedDate = nil },
                                                 isHidden: !self.showClearButton)
                // If the field is locked, we show the lock indicator
                AccessoryViewFactory.lockIcon(isHidden: !self.config.shouldShowLockIcon)
            })
            .wrapToGFField(variant: self.config.getInputVariant(isEmpty: self.selectedDate == nil))

            if self.isExpanded {
                self.buildExpandedContent()
            }
        }
    }
    
    @ViewBuilder
    func buildExpandedContent() -> some View {
        CalendarView(selectedDate: self.$selectedDate,
                     calendarHeight: self.$calendarHeight,
                     shouldDisableDate: self.shouldDisableDate)
        .padding(.top, 10)
        .padding(.horizontal)
        .addStyledRowDivider()
    }
}

private extension AccessoryViewFactory {
    private enum Labels {
        static let clearButtonTitle = MKLocalizedString("generic-form.field.date.clear-button.title",
                                                        comment: "The title for clear button in date generic form field")
    }

    @ViewBuilder
    static func clearButton(action: @escaping () -> Void, isHidden: Bool) -> some View {
        Button(action: action, label: {
            Text(verbatim: Labels.clearButtonTitle)
        })
        .disabled(isHidden)
        .opacity(isHidden ? 0 : 1)
    }
}
