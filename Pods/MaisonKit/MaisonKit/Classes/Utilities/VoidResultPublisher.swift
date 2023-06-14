// Copyright © 2022 LVMH. All rights reserved.

import Foundation
import Combine

/// A publisher that can finish with either a `Result<Void, ErrorDisplayable>` or `Error`.
/// This is useful when you have an operation that can fail but doesn't return any results, like deleting an item from a list
public typealias VoidResultPublisher = AnyPublisher<Result<Void, ErrorDisplayable>, Error>
