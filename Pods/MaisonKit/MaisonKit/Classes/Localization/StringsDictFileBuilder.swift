// Copyright © 2021 LVMH. All rights reserved.

import Foundation

/// Creates the XML string in the form a `.stringsdict` file expects from a StringsDictLocalizationFile
struct StringsDictFileBuilder {

    private static let template = """
    <?xml version="1.0" encoding="UTF-8"?>
        <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
        <plist version="1.0">
        <dict>
            __CONTENT__
        </dict>
    </plist>
    """

    static let variablesPlaceholder = "__VARIABLES__"

    func buildStringsFile(from localization: StringsDictLocalizationFile) -> String {
        let contents = localization.localizationValues.reduce("") { acc, next -> String in
            var entry = """
                <key>\(next.key)</key>
                <dict>
                    <key>NSStringLocalizedFormatKey</key>
                    <string>\(next.format)</string>
                    \(Self.variablesPlaceholder)
                </dict>
                """
            if next.variables.isEmpty {
                entry = entry.replacingOccurrences(of: Self.variablesPlaceholder,
                                                   with: "")
            } else {
                let variablesXML = next.variables.reduce("") { acc, next -> String in
                    return acc.appending(self.buildVariablesXML(from: next))
                }
                entry = entry.replacingOccurrences(of: Self.variablesPlaceholder,
                                                   with: variablesXML)
            }

            return acc.appending(entry)
        }
        return Self.template.replacingOccurrences(of: "__CONTENT__", with: contents)
    }

    private func buildVariablesXML(from: LocalizationVariable) -> String {
        var variable = """
             <key>\(from.key)</key>
             <dict>
                <key>NSStringFormatSpecTypeKey</key>
                <string>NSStringPluralRuleType</string>
                <key>NSStringFormatValueTypeKey</key>
                <string>\(from.valueType.rawValue)</string>
        """

        if let zero = from.zero {
            variable.append("""
                <key>zero</key>
                <string>\(zero)</string>
            """)
        }
        if let one = from.one {
            variable.append("""
                <key>one</key>
                <string>\(one)</string>
            """)
        }
        if let two = from.two {
            variable.append("""
                <key>two</key>
                <string>\(two)</string>
            """)
        }
        if let few = from.few {
            variable.append("""
                <key>few</key>
                <string>\(few)</string>
            """)
        }
        if let many = from.many {
            variable.append("""
                <key>many</key>
                <string>\(many)</string>
            """)
        }

        variable.append("""
            <key>other</key>
            <string>\(from.other)</string>
        </dict>
        """)

        return variable
    }
}
