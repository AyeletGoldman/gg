// Copyright © 2022 LVMH. All rights reserved.

/// A closure that is used when the user has finished saving media.
/// The first parameter is the view controller that was used to capture the media
/// The second parameter is the `localIdentifier` of the newly-created `PHAsset` that
/// has been saved to the user's library.
public typealias CameraMediaSavedClosure = (UIViewController, String) -> Void

/// The route descriptor that is used when you want to present a scene that captures images and videos.
/// This scene will show the camera user interface and, when a picture is taken or a video is recorded, save the
/// new media to the user's library and call the `onMediaSaved` closure with the new `localIdentifier`
/// for the asset (which should be a `PHAsset`)
public struct CameraRouteDescriptor: RouteDescriptor {
    public static let identifier: Identifier = "CameraRouteDescriptor"

    /// A closure called when the media that has been newly created has been succesfully saved to the user's library.
    public let onMediaSaved: CameraMediaSavedClosure

    /// A closure invoked when the user has cancelled the media creation.
    public let onCancel: (UIViewController) -> Void

    /// Creates a new `CameraRouteDescriptor`
    /// - Parameters:
    ///   - onMediaSaved: A closure called when the media that has been newly created has been succesfully saved to the user's library.
    ///   - onCancel: A closure invoked when the user has cancelled the media creation.
    public init(onMediaSaved: @escaping CameraMediaSavedClosure,
                onCancel: @escaping (UIViewController) -> Void) {
        self.onMediaSaved = onMediaSaved
        self.onCancel = onCancel
    }
}
