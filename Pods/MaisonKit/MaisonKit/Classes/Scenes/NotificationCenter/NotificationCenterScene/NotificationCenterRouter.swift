// Copyright © 2022 LVMH. All rights reserved.

import Foundation

public protocol NotificationCenterRouter: ActionScenePresenterRouter { }

final class DefaultNotificationCenterRouter: Router<NotificationCenterViewController>, NotificationCenterRouter, DefaultActionScenePresenterRouter { }
