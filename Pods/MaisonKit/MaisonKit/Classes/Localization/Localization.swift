// Copyright © 2020 LVMH. All rights reserved.

import Foundation
import Combine
import Biodag

/// Localization manager to retrieve and store translated key-value pairs.
public final class Localization {

    /// The adapter to interface with clients of MaisonKit. This is used to retrieve the localizations from a data source.
    @Inject private var localizationAdapter: LocalizationAdapter
    /// A file manager to write files to disk.
    private let fileManager: FileManager
    /// Stores any subscriptions.
    private var cancellables = Set<AnyCancellable>()

    /// The standard localization entrypoint
    fileprivate static let standard: Localization? = {
        return try? Localization()
    }()

    /// The path to the bundle used to store the translations
    static let localizationBundleFilePath: URL = {
        let paths = FileManager.default.urls(for: .applicationSupportDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0]
        return documentsDirectory.appendingPathComponent("Localizations.bundle")
    }()

    /// Creates a new Localization object. This initializer is marked with `throws` and will throw an error if it is unable to create
    /// a directory for the bundle.
    /// - Parameter fileManager: a file manager to use to check and build for folders and files in the bundle.
    public init(fileManager: FileManager = .default) throws {
        self.fileManager = fileManager
        // Create the directories we need to support localisation
        try self.createLocalizationBundleIfNeeded()
    }

    /// Creates the directory for the localisation bundle if it doesn't already exist.
    private func createLocalizationBundleIfNeeded() throws {
        let bundlePath = Self.localizationBundleFilePath
        if self.fileManager.fileExists(atPath: bundlePath.path) {
            return
        }
        try self.fileManager.createDirectory(at: bundlePath, withIntermediateDirectories: true, attributes: nil)
    }

    // Creates `.strings` files for each of the translations in the given array of `StringsLocalizationFile`
    // and places them in a folder named `{LANGUAGE_CODE}.lproj`.
    private func createLocalizationBundleIfNecessary(for translations: [StringsLocalizationFile]) {
        let builder = StringsFileBuilder()

        for translation in translations {
            let filePath = self.createFolderIfDoesntExist(for: translation.languageCode).appendingPathComponent("Localizable.strings")

            let contents = builder.buildStringsFile(from: translation)
            self.createLocalizationFile(contents: contents, filePath: filePath)
        }
    }

    // Creates `.stringsdict` files for each of the translations in the given array of `StringsDictLocalizationFile`
    // and places them in a folder named `{LANGUAGE_CODE}.lproj`.
    private func createLocalizationBundleIfNecessary(for translations: [StringsDictLocalizationFile]) {
        let builder = StringsDictFileBuilder()

        for translation in translations {
            let filePath = self.createFolderIfDoesntExist(for: translation.languageCode).appendingPathComponent("Localizable.stringsdict")

            let contents = builder.buildStringsFile(from: translation)
            self.createLocalizationFile(contents: contents, filePath: filePath)
        }
    }

    private func createLocalizationFile(contents: String, filePath: URL) {
        let data = contents.data(using: .utf8)
        self.fileManager.createFile(atPath: filePath.path, contents: data, attributes: nil)
    }

    private func createFolderIfDoesntExist(for languageCode: String) -> URL {
        let bundlePath = Self.localizationBundleFilePath.appendingPathComponent("\(languageCode).lproj",
                                                                                isDirectory: true)
        if !self.fileManager.fileExists(atPath: bundlePath.path) {
            try? self.fileManager.createDirectory(at: bundlePath, withIntermediateDirectories: true)
        }

        return bundlePath
    }
}

// MARK: - Public interface

public extension Localization {

    /// Sets up the localization to automatically refresh every time the user logs in.
    /// This function may be called from from outside MaisonKit, and we don't know if the user
    /// will have a valid authorization token, so we always check before requesting the localization.
    static func setup() {
        Localization.standard?.listenToLogin()
        Localization.standard?.listenToForegroundNotification()
    }

    /// Requests from the localization that it updates its localization files.
    /// This is usually done by requesting new localizations from the adapter and
    /// storing the result in the bundle.
    static func updateLocalizationFiles() {
        Localization.standard?.updateLocalizationFiles()
    }

    private func listenToLogin() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(handleNotificationToFetchLocalizationFiles),
                                               name: .userDidLoginNotificationName,
                                               object: nil)
    }

    private func listenToForegroundNotification() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(handleNotificationToFetchLocalizationFiles),
                                               name: UIApplication.willEnterForegroundNotification,
                                               object: nil)
    }

    @objc private func handleNotificationToFetchLocalizationFiles() {
        self.updateLocalizationFiles()
    }

    internal func updateLocalizationFiles() {
        guard Features.manager.isEnabled(.realtimeLocalizations, defaultValue: false) else {
            return
        }
        self.localizationAdapter.fetchLocalization().sink { _ in
            // Do nothing?
        } receiveValue: { [weak self] localizations in
            // create the respective files for the received translations
            for localization in localizations {
                let singularFile = StringsLocalizationFile(languageCode: localization.languageCode, localizationValues: localization.singularDict)
                self?.createLocalizationBundleIfNecessary(for: [singularFile])

                let pluralFile = StringsDictLocalizationFile(languageCode: localization.languageCode, localizationValues: localization.pluralDict)
                self?.createLocalizationBundleIfNecessary(for: [pluralFile])
            }
        }.store(in: &self.cancellables)
    }
}

// MARK: - Bundle

extension Bundle {
    /// The bundle for localization strings
    static var localization: Bundle? {
        return Bundle(url: Localization.localizationBundleFilePath)
    }

    static let sdkLocalization: Bundle = {
        let frameworkBundle = Bundle.maisonKit
        let bundleURL = frameworkBundle.resourceURL?.appendingPathComponent("Localization.bundle")
        return Bundle(url: bundleURL!)!
    }()
}

public extension Localization {
    /// A namespace for keys exported from MaisonKit that can be used as utilities
    enum Keys { }
}
