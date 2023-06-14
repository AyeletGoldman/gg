// Copyright © 2022 LVMH. All rights reserved.

import Foundation
import Combine

/// A closure that takes no parameters and returns a publisher with a result that will resolve to an error or a `TemplatesDisplayable`
public typealias GetTemplatesMethod = () -> AnyPublisher<Result<TemplatesDisplayable, ErrorDisplayable>, Error>
