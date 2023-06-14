// Copyright © 2021 LVMH. All rights reserved.

import UIKit

/// The router for generic form screen.
/// Its main responsibility is to allow navigation outside of this screen
public protocol GenericFormRouter: ActionScenePresenterRouter { }

/// The default generic form router
public final class DefaultGenericFormRouter: Router<UIViewController>, DefaultGenericFormPresenterRouter { }

/// A protocol to implement the default generic form router
public protocol DefaultGenericFormPresenterRouter: GenericFormRouter, DefaultActionScenePresenterRouter { }
