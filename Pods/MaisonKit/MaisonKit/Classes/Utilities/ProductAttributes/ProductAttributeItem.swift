// Copyright © 2023 LVMH. All rights reserved.

import Foundation

/// A dictionary to hold lists of attribute possible values items base on the product attribute ID.
public typealias ProductAttributeItems = [ProductAttributeID: [ProductAttributeItem]]

/// The product attribute possible value item.
/// To be in use in product details select attribute screen.
public typealias ProductAttributeItem = SelectionListItem
