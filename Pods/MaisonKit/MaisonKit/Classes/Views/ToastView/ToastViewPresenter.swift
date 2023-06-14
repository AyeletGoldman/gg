// Copyright © 2021 LVMH. All rights reserved.

import Foundation
import UIKit
import SwiftUI
import StylableSwiftUI
import Combine

/// A utility class to handle presentation of a `ToastView`. This class
/// listens for notifications to display a `ToastView`, retrieves the details of the toast from the user info dictionary
/// in the notification and creates the view to display. It then animates the new view from the required edge.
/// If you want to display toasts created by MaisonKit in your application, you should create a `ToastViewPresenter` instance in your
/// scene delegate (or anywhere else you want) and call `listenToToasts()`.
/// Do not release the instance of the presenter until your app exists.
public final class ToastViewPresenter {

    private enum Constants {
        static let animationDuration: TimeInterval = 0.35
        static let dismissalDelay: TimeInterval = 1.5
    }

    private let window: UIWindow
    private let windowScene: UIWindowScene
    private var overlayWindow: UIWindow?
    private let stylist: Stylist
    private let sceneFactory: SceneFactory
    private let notificationCenter: NotificationCenter
    private var cancellables = Set<AnyCancellable>()

    /// Creates a new `ToastViewPresenter`
    /// - Parameters:
    ///   - window: the application's main window, or another window in which to present the toasts on.
    ///   - windowScene: the application's main window scene. This is required to be able to present a new window for any overlays.
    ///   - stylist: a `Stylist` instance to use when stylist the toast messages.
    ///   - sceneFactory: a factory for scenes that is used when a toast message wants to present a new `Scene`.
    ///   - notificationCenter: the notification center that should be used to listen to notifications. Defaults to `NotificationCenter.default`.
    public init(window: UIWindow, windowScene: UIWindowScene, stylist: Stylist, sceneFactory: SceneFactory, notificationCenter: NotificationCenter = .default) {
        self.window = window
        self.windowScene = windowScene
        self.stylist = stylist
        self.sceneFactory = sceneFactory
        self.notificationCenter = notificationCenter
    }

    /// Listens for the `.showToastNotification` and presents a `ToastView` when it receives a valid notification.
    public func listenToToasts() {
        _ = self.notificationCenter.addObserver(forName: .showToastNotification, object: nil, queue: nil) { [weak self] notification in
            guard let self = self else { return }

            guard let titleSubject = notification.userInfo?[NotificationKey.toastMessage] as? CurrentValueSubject<String, Never>,
                  let style = notification.userInfo?[NotificationKey.toastStyle] as? AnyToastViewStyle,
                  let edge = notification.userInfo?[NotificationKey.toastEntryEdge] as? ToastViewPresenter.Edge else {
                return
            }

            let imageSource = notification.userInfo?[NotificationKey.toastImageSource] as? ImageSource

            let action = self.buildActionHandler(originalAction: notification.userInfo?[NotificationKey.toastAction] as? ActionType)

            let view = self.buildHostingView(titlePublisher: titleSubject.eraseToAnyPublisher(),
                                             imageSource: imageSource,
                                             onTap: action,
                                             toastViewStyle: style,
                                             edge: edge)
            self.window.addSubview(view)
            NSLayoutConstraint.activate([
                self.window.topAnchor.constraint(equalTo: view.topAnchor, constant: edge.isTop ? self.window.safeAreaInsets.top : 0),
                self.window.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: edge.isBottom ? self.window.safeAreaInsets.bottom : 0),
                self.window.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                self.window.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            ])

            self.window.bringSubviewToFront(view)

            let closeSubject = notification.userInfo?[NotificationKey.toastCloseSubject] as? PassthroughSubject<DispatchTime, Never>
            if let closeSubject = closeSubject {
                closeSubject.sink { deadline in
                    DispatchQueue.main.asyncAfter(deadline: deadline) {
                        self.animate(view: view, outOf: self.window, to: edge)
                    }
                }.store(in: &self.cancellables)
            }

            self.animate(view: view, into: self.window, from: edge, autoClose: closeSubject == nil)
        }
    }

    private func buildActionHandler(originalAction: ActionType?) -> (() -> Void)? {
        guard let originalAction = originalAction else { return nil }

        return { [weak self] in
            switch originalAction {
            case .routeDescriptorProvider(let sceneFactory, _):
                guard let self = self else { return }
                self.presentScene { closure in
                    let routeDescriptor = sceneFactory(closure)
                    return AnyScene(scene: self.sceneFactory.retrieveScene(with: routeDescriptor))
                }
            case .actionExecutor(let action):
                action()
            case .sceneProvider(let sceneFactory, _):
                self?.presentScene(factory: { return sceneFactory($0) })
            }
        }
    }

    private func presentScene(factory sceneFactory: (OnDoneClosure) -> AnyScene) {
        let onDone: OnDoneClosure = { controller in
            controller.dismiss(animated: true, completion: { [weak self] in
                self?.overlayWindow = nil
            })
        }
        let controller = self.sceneFactory.createViewController(sceneFactory(onDone))
        self.overlayWindow = UIWindow(windowScene: self.windowScene)
        self.overlayWindow?.overlayNewController(controller)
    }

    private func buildHostingView<TVS: ToastViewStyle>(titlePublisher: AnyPublisher<String, Never>,
                                                       imageSource: ImageSource?,
                                                       onTap: (() -> Void)?,
                                                       toastViewStyle: TVS,
                                                       edge: ToastViewPresenter.Edge) -> UIView {
        let rootView = ToastViewWrapper(titlePublisher: titlePublisher, imageSource: imageSource, edge: edge, onTap: onTap)
            .toastViewStyle(toastViewStyle)
            .environmentObject(self.stylist)
        let view = UIHostingController(rootView: rootView).view!
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        let parentView = TouchesIgnoringView(frame: view.bounds)
        parentView.translatesAutoresizingMaskIntoConstraints = false
        parentView.addSubview(view)
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: parentView.topAnchor),
            view.bottomAnchor.constraint(equalTo: parentView.bottomAnchor),
            view.leadingAnchor.constraint(equalTo: parentView.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: parentView.trailingAnchor)
        ])
        return parentView
    }

    private func animate(view: UIView, into window: UIWindow, from edge: ToastViewPresenter.Edge, autoClose: Bool = true) {
        view.transform = CGAffineTransform(translationX: 0, y: edge.isBottom ? window.frame.height : -window.frame.height)
        self.animate(options: [.curveEaseOut, .allowUserInteraction],
                     animations: {
            view.transform = .identity
        }, completion: { _ in
            if autoClose {
                DispatchQueue.main.asyncAfter(deadline: .now() + Constants.dismissalDelay) {
                    self.animate(view: view, outOf: window, to: edge)
                }
            }
        })
    }

    private func animate(view: UIView, outOf window: UIWindow, to edge: ToastViewPresenter.Edge) {
        self.animate(options: [.curveEaseIn, .allowUserInteraction],
                     animations: {
            view.transform = CGAffineTransform(translationX: 0, y: edge.isBottom ? window.frame.height : -window.frame.height)
        }, completion: { _ in
            view.removeFromSuperview()
        })
    }

    private func animate(duration: TimeInterval = Constants.animationDuration,
                         delay: TimeInterval = 0,
                         options: UIView.AnimationOptions = .curveEaseInOut,
                         animations: @escaping () -> Void,
                         completion: ((Bool) -> Void)?) {
        UIView.animate(withDuration: duration,
                       delay: delay,
                       options: options,
                       animations: animations,
                       completion: completion)
    }
}

private final class TouchesIgnoringView: UIView {

    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        let hitView = super.hitTest(point, with: event)
        if hitView == self || hitView == self.subviews.first {
            return nil
        }
        return hitView
    }
}
