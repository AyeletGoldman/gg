// Copyright © 2022 LVMH. All rights reserved.

import Foundation

/// A convenience to use when you are strongifying `self` inside a closure
/// and you need to return an error in the case that `self` has been released already
struct ReleasedSelfError: Error { }
