// Copyright © 2022 LVMH. All rights reserved.

import Foundation
import Photos

/// An asset that can be uploaded
public struct UploadableAsset {

    /// An identifier for this asset
    public let id: String

    /// The type of this asset e.g. video or image
    /// Constants identifying the general type of an asset, such as image or video.
    public let mediaType: PHAssetMediaType

    /// The subtype of this asset
    /// Constants identifying specific variations of asset media, such as panorama or screenshot photos and time lapse or high frame rate video.
    /// Media subtypes are OptionSet values, so you can combine them using set literal syntax to test for multiple subtypes.
    public let mediaSubtypes: PHAssetMediaSubtype

    /// The size of the asset
    public let size: CGSize

    /// The data that represents the asset
    public let data: Data
}
