// Copyright © 2022 LVMH. All rights reserved.

import Foundation

/// A variant for the stylist. Variants are modifiers for styles.
/// Using variants, you can model different statuses for specific components.
public protocol Variant: ExpressibleByStringLiteral, RawRepresentable { }
