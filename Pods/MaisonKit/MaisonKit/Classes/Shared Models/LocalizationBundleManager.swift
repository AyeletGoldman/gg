// Copyright © 2022 LVMH. All rights reserved.

import Foundation

struct LocalizationBundleManager {
    private let fileManager: FileManager
    private let appGroup: String
    private let coordinator = NSFileCoordinator()

    private enum Constants {
        static let bundleName = "Localization.bundle"
    }

    init(fileManager: FileManager = .default, appGroup: String) {
        self.fileManager = fileManager
        self.appGroup = appGroup
    }

    func copyBundle() {
        guard let container = self.fileManager.containerURL(forSecurityApplicationGroupIdentifier: self.appGroup) else { return }
        guard let destination = self.buildDestinationURL(container: container) else { return }

        let bundle = Bundle.sdkLocalization

        let errorPtr: NSErrorPointer = nil
        self.coordinator.coordinate(writingItemAt: destination,
                                    error: errorPtr) { newURL in
            try? self.copyBundle(from: bundle.bundleURL, to: newURL)
        }
    }

    func getBundleURL() -> URL? {
        guard let container = self.fileManager
            .containerURL(forSecurityApplicationGroupIdentifier: self.appGroup) else { return nil }
        return self.buildDestinationURL(container: container)
    }

    private func buildDestinationURL(container: URL) -> URL? {
        if #available(iOS 16.0, *) {
            return container.appending(path: Constants.bundleName)
        } else {
            var components = URLComponents(url: container, resolvingAgainstBaseURL: false)
            var path = components?.path
            path = (path ?? "") + Constants.bundleName
            components?.path = path ?? ""
            return components?.url
        }
    }

    private func copyBundle(from source: URL, to destination: URL) throws {
        let path: String
        if #available(iOS 16, *) {
            path = destination.path()
        } else {
            path = destination.path
        }
        if self.fileManager.fileExists(atPath: path) {
            try self.fileManager.removeItem(at: destination)
        }
        try self.fileManager.copyItem(at: source, to: destination)
    }
}
