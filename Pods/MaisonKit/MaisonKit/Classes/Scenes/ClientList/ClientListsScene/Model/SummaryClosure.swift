// Copyright © 2023 LVMH. All rights reserved.

import Foundation

/// A closure that takes one parameter `ClientListDisplayable` and returns a summary representation of
/// that list to be displayed. This is used when deciding what information from a client list to display in a summary.
/// An example of a summary scenario is when a client list is displayed in a list alongside other client lists.
public typealias SummaryClosure = (ClientListDisplayable) -> ClientListDisplayable.SummaryDisplayable
