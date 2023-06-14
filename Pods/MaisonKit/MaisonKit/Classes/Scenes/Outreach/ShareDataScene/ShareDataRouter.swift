// Copyright © 2022 LVMH. All rights reserved.

import Foundation

/// The router used for the share data scene
public protocol ShareDataRouter: OutreachSelectionPresentingRouter, TemplateSelectionPresentingRouter { }

final class DefaultShareDataRouter: Router<ShareDataViewController>, ShareDataRouter { }
