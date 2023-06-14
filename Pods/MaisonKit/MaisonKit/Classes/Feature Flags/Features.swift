// Copyright © 2021 LVMH. All rights reserved.

import Foundation

private extension String {
    /// MaisonKit's feature flags user defaults key
    static let featureFlagsUserDefaultsKey = "fr.lvmh.featureFlagsUserDefaultsKey"
}

/// The feature flag manager for feature flags in MaisonKit.
public final class Features {

    /// The default `Features` manager.
    public static let manager = Features()

    private static let defaultFeaturesManagerName = "MKDefaultFeatureFlags"

    private let name: String
    private var features: [FlagName: Bool] = [:] {
        didSet {
            UserDefaults.standard.saveValue(self.features, forKey: self.userDefaultsKey)
        }
    }

    private var userDefaultsKey: String {
        return "\(self.name)_\(String.featureFlagsUserDefaultsKey)"
    }

    private init() {
        self.name = Features.defaultFeaturesManagerName
        self.populateInitialFeatures()
    }

    /// Creates a new `Features` instance to manage feature flags.
    /// - Parameter name: The name to use for this manager. This value is used when saving to user defaults, so it should be unique
    /// for each of the feature managers you are creating. Do **not** use the literal value `MKDefaultFeatureFlags`, as it is reserved.
    public init(name: String) {
        assert(name != Features.defaultFeaturesManagerName, "`name` must not be `\(Features.defaultFeaturesManagerName)`")
        self.name = name
        self.populateInitialFeatures()
    }

    private func populateInitialFeatures() {
        let flags: [FlagName: Bool]? = UserDefaults.standard.retrieveValue(forKey: self.userDefaultsKey)
        self.features = flags ?? [:]
    }

    /// Adds a new feature flag to the list of features.
    /// The new flag will override any value of a previously-created flag with the same `name`.
    /// - Parameter flag: the flag to add.
    public func addFeatureFlag(_ flag: Flag) {
        self.features[flag.name] = flag.isEnabled
    }

    /// Adds a new array of feature flags to the list of features.
    /// Each new flag will override any value of a previously-created flag with the same `name`.
    /// - Parameter flags: the array of flags ot add to the features.
    public func addFeatureFlags(_ flags: [Flag]) {
        self.features.merge(flags.asDictionary(), uniquingKeysWith: { _, second in return second })
    }

    /// Fetches whether a flag is enabled or not.
    /// - Parameters:
    ///   - flag: the name of the flag.
    ///   - defaultValue: a default value to return if the flag has not been registered before. Defaults to `false`.
    /// - Returns: A boolean indicating whether the flag is enabled or not, or the default value if the flag has not been registered.
    public func isEnabled(_ flag: FlagName, defaultValue: Bool = false) -> Bool {
        return self.features[flag] ?? defaultValue
    }
}

#if DEBUG
extension Features {
    var allFeatureFlags: [Flag] {
        self.features.map { Flag(name: $0, isEnabled: $1) }
    }
}
#endif
