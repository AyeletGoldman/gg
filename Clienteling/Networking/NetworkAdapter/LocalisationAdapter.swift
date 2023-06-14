// Copyright © 2020 LVMH. All rights reserved.

import Foundation
import MaisonKit
import Combine

extension NetworkAdapter: LocalizationAdapter {
    func fetchLocalization() -> AnyPublisher<[MaisonKit.LocalizationFiles],  MaisonKit.ErrorDisplayable> {
        // TODO: New architecture does not support localization yet.
//        return [
//            self.networking.translationsControllerFindOne(fileName: .common, language: .en),
//            self.networking.translationsControllerFindOne(fileName: .common, language: .fr)
//        ].zip()
//        .mapToViewModel { translations -> [LocalizationFile] in
//            return translations.enumerated().compactMap { offset, element in
//                element.data.result.dictionary.map { (offset == 0 ? "en" : "fr", $0) }
//            }.map { language, dict in
//                LocalizationFile(languageCode: language,
//                                 localizedValues: dict.compactMapValues { value in value.string })
//            }
//        }
        return Just([LocalizationFiles()]).setFailureType(to: ErrorDisplayable.self).eraseToAnyPublisher()
    }
}
