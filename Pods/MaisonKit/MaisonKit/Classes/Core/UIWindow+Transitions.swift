// Copyright © 2020 LVMH. All rights reserved.

import Foundation
import UIKit

extension UIWindow {

    /// Transition Options
    struct TransitionOptions {

        static let presenting = TransitionOptions()
        static let dismissing = TransitionOptions(presenting: false)

        /// Duration of the animation (default is 0.20s)
        let duration: TimeInterval
        /// The function to use for animating, default is `.easeOut`
        let function: CAMediaTimingFunction
        /// Whether we're presenting or not in the animation
        let isPresenting: Bool

        init(duration: TimeInterval = 0.20,
             timingFunction: CAMediaTimingFunction = CAMediaTimingFunction(name: .easeOut),
             presenting: Bool = true) {
            self.function = timingFunction
            self.isPresenting = presenting
            self.duration = duration
        }

        /// Return the animation to perform for given options object
        internal var animation: CATransition {
            let transition: CATransition = {
                let transition = CATransition()
                transition.type = CATransitionType.moveIn
                transition.subtype = CATransitionSubtype.fromTop
                return transition
            }()
            transition.duration = self.duration
            transition.timingFunction = self.function
            return transition
        }
    }

    /// Change the root view controller of the window using a modal-like animation.
    /// - Parameters:
    ///   - controller: the new controller to present
    ///   - options: a set of transition options; this controls whether the animation is a presenting or dismiss animation, the duration and the timing
    ///   - done: a closure to invoke when the animation has finished.
    func setRootViewController(_ controller: UIViewController, options: TransitionOptions = .presenting, done: (() -> Void)? = nil) {
        if options.isPresenting {
            // We're presenting, so the  order of operations is:
            // 1. Create a new window that will be used during transition
            // 2. Set the transition window's root controller to a "screenshot" of the controller we're presenting onto
            // 3. Make the transition window the visible window
            // 4. Animate the window (`self`) in.
            // 5. Make the window that was just animated in the root controller and make it visible
            // 6. Clean up by removing the transition window and calling the completion handler

            // 1.
            let transitionWindow = UIWindow(frame: UIScreen.main.bounds)
            if let currentView = snapshotView(afterScreenUpdates: true) {
                // 2.
                transitionWindow.rootViewController = UIViewController.newController(withView: currentView,
                                                                                     frame: transitionWindow.bounds)
            }
            // 3.
            transitionWindow.makeKeyAndVisible()

            // 4.
            CATransaction.begin()
            CATransaction.setCompletionBlock {
                // 6.
                transitionWindow.removeFromSuperview()
                done?()
            }
            self.layer.add(options.animation, forKey: nil)
            CATransaction.commit()

            // 5.
            self.rootViewController = controller
            self.makeKeyAndVisible()
        } else {
            // We're dismissing, so the  order of operations is:
            // 1. Create a snapshot of the current view so we can move it out of the picture
            // 2. Update the root view controller to the controller we're presenting (but not make it visible yet)
            // 3. Add the snapshot as a subview so we can animate it out of view
            // 4. Make this window key and visible
            // 5. Animate by moving the snapshot out of view.
            // 6. Clean up by removing the transition snapshot

            // 1.
            guard let currentView = snapshotView(afterScreenUpdates: true) else {
                return
            }

            // 2.
            self.rootViewController = controller
            // 3.
            self.addSubview(currentView)
            self.bringSubviewToFront(currentView)
            // 4.
            self.makeKeyAndVisible()
            // 5.
            UIView.animate(withDuration: options.duration,
                           delay: 0,
                           options: .curveEaseOut,
                           animations: {
                            currentView.frame = CGRect(x: 0,
                                                       y: controller.view.bounds.maxY,
                                                       width: currentView.frame.width,
                                                       height: currentView.frame.height)
            }, completion: { finished in
                // 6.
                if finished {
                    currentView.removeFromSuperview()
                    done?()
                }
            })
        }
    }
}

private extension UIViewController {

    /// Create a new empty controller instance with given view
    ///
    /// - Parameters:
    ///   - view: view
    ///   - frame: frame
    /// - Returns: instance
    static func newController(withView view: UIView, frame: CGRect) -> UIViewController {
        view.frame = frame
        let controller = UIViewController()
        controller.view = view
        return controller
    }

}
