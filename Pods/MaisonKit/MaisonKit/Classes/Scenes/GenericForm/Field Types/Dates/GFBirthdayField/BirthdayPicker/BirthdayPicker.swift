// Copyright © 2022 LVMH. All rights reserved.

import SwiftUI

struct BirthdayPicker: UIViewRepresentable {
    @Binding var selection: Birthday

    let labelOptions: [[String]] = BirthdayPickerField.fields.map { $0.getLabelOptions() }

    func makeCoordinator() -> BirthdayPicker.Coordinator {
        Coordinator(self)
    }

    func makeUIView(context: UIViewRepresentableContext<BirthdayPicker>) -> UIPickerView {
        let picker = UIPickerView(frame: .zero)
        picker.dataSource = context.coordinator
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIView(_ view: UIPickerView, context: UIViewRepresentableContext<BirthdayPicker>) {
        if !self.selection.isValid {
            let newValidValue = self.selection.getEarliestClosestValidValue()
            let currentPickerIndex = view.selectedRow(inComponent: BirthdayPickerField.day.getFieldIndex())
            let newPickerIndex = currentPickerIndex - (self.selection.day - newValidValue.day)
            view.selectRow(newPickerIndex, inComponent: BirthdayPickerField.day.getFieldIndex(), animated: true)
            self.selection = newValidValue
        } else if !context.coordinator.needsUpdate {
            context.coordinator.needsUpdate = true
            return
        } else {
            BirthdayPickerField.fields.enumerated().forEach { (index, field) in
                let newPickerIndex = field.getPickerIndex(birthday: self.selection)
                view.selectRow(newPickerIndex, inComponent: index, animated: false)
            }
        }
    }

    final class Coordinator: NSObject, UIPickerViewDataSource, UIPickerViewDelegate {
        var parent: BirthdayPicker
        var needsUpdate = true

        init(_ pickerView: BirthdayPicker) {
            self.parent = pickerView
        }

        func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return self.parent.labelOptions.count
        }

        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return self.parent.labelOptions[component].count
        }

        func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
            let pickerWidth = pickerView.frame.width
            switch BirthdayPickerField.fields[component] {
            case .day:
                return floor(pickerWidth * 0.16)
            case .month:
                return floor(pickerWidth * 0.44)
            case .year:
                return floor(pickerWidth * 0.37)
            }
        }

        func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
            let paragraphStyle = NSMutableParagraphStyle()
            var stringAttributes: [NSAttributedString.Key: Any] = [
                .font: UIFont.systemFont(ofSize: 22)
            ]
            // Set the alignment to mimic the birthday component in the Contacts app
            switch BirthdayPickerField.fields[component] {
            case .day:
                let birthdayForRow = Birthday(day: BirthdayPickerField.day.getFieldValue(pickerIndex: row)!,
                                              month: self.parent.selection.month,
                                              year: self.parent.selection.year)
                if !birthdayForRow.isValid {
                    stringAttributes[.foregroundColor] = UIColor.gray
                }
                paragraphStyle.alignment = .right
            case .month:
                paragraphStyle.alignment = .left
            case .year:
                paragraphStyle.alignment = .center
            }
            stringAttributes[.paragraphStyle] = paragraphStyle
            return NSAttributedString(string: "\(self.parent.labelOptions[component][row])",
                                      attributes: stringAttributes)
        }

        func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            return self.parent.labelOptions[component][row]
        }

        func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            // TODO: Handle the availiable days by the selected month and year
            self.needsUpdate = false
            switch BirthdayPickerField.fields[component] {
            case .day:
                self.parent.selection.day = BirthdayPickerField.day.getFieldValue(pickerIndex: row)!
            case .month:
                self.parent.selection.month = BirthdayPickerField.month.getFieldValue(pickerIndex: row)!
                pickerView.reloadComponent(BirthdayPickerField.day.getFieldIndex())
            case .year:
                self.parent.selection.year = BirthdayPickerField.year.getFieldValue(pickerIndex: row)
                pickerView.reloadComponent(BirthdayPickerField.day.getFieldIndex())
            }
        }
    }
}
