// Copyright © 2020 LVMH. All rights reserved.

import Foundation

/// Creates the String in the form a `.strings` file expects from a StringsLocalizationFile
struct StringsFileBuilder {
    func buildStringsFile(from localization: StringsLocalizationFile) -> String {
        let contents = localization.localizationValues.reduce("") { acc, next -> String in
            let line = "\"\(next.key)\" = \"\(next.value)\";\n"
            return acc.appending(line)
        }
        return contents
    }
}
