// Copyright © 2022 LVMH. All rights reserved.

import Combine
import Foundation
import Photos

/// A closure to get a publisher with assets to choose in Choose Assets screen
public typealias GetAssetsClosure = () -> AnyPublisher<Result<ChooseAssetsDisplayable, ErrorDisplayable>, Error>

/// A closure for saving the selected assets in Choose Assets screen
public typealias SaveSelectedAssetsClosure = ([ChooseAssetsItemID], [UploadableAsset]) -> VoidResultPublisher

final class ChooseAssetsViewModel: ObservableObject {

    private enum Labels {
        static let saveErrorAlertTitle = MKLocalizedString("choose-assets.save.error.title",
                                                           comment: "Title for alert shown when saving the selected assets fails")
        static let saveErrorAlertMessageFormat = MKLocalizedString("choose-assets.save.error.message",
                                                                   comment: "Message for alert shown when saving the selected assets fails")
        static let settingsAlertTitle = MKLocalizedString("choose-assets.alert.settings.title",
                                                          comment: "The title for the alert when a user has denied access to his photo but still want to save some in it")
        static let settingsAlertMessage = MKLocalizedString("choose-assets.alert.settings.message",
                                                            comment: "The message for the alert when a user has denied access to his photo but still want to save some in it")
        static let settingsAlertActionTitle = MKLocalizedString("choose-assets.alert.settings.action",
                                                                comment: "The action for the alert when a user has denied access to his photo but still want to save some in it")
    }

    @Published private(set) var assetsDisplayable: ResultState<ChooseAssetsDisplayable, ErrorDisplayable> = .waiting
    @Published private(set) var authorisationState: PersonalAssetsAuthorisationState = .unknown
    @Published private(set) var selectedAssetIds: [ChooseAssetsItemID] = []
    private let getAssetsClosure: GetAssetsClosure
    private let saveSelectedAssetsClosure: SaveSelectedAssetsClosure
    private let onClose: () -> Void

    private let urlOpener: URLOpener
    @Published private(set) var isSaving: Bool = false
    @Published var alertContext: AlertContext?
    private var cancellables = Set<AnyCancellable>()

    private let assetManager = PHCachingImageManager()
    private var fetchOptions: PHFetchOptions {
        let options = PHFetchOptions()
        let predicates = [
            NSPredicate(format: "mediaType == %i", PHAssetMediaType.image.rawValue),
            NSPredicate(format: "mediaType == %i", PHAssetMediaType.video.rawValue)
        ]
        options.predicate = NSCompoundPredicate(orPredicateWithSubpredicates: predicates)
        options.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
        options.includeAssetSourceTypes = [.typeUserLibrary, .typeCloudShared, .typeiTunesSynced]
        return options
    }

    private var _fetchedAssets: PHFetchResult<PHAsset>?
    private var fetchedAssets: PHFetchResult<PHAsset> {
        get {
            if let assets = self._fetchedAssets {
                return assets
            }
            let assets = PHAsset.fetchAssets(with: self.fetchOptions)
            self._fetchedAssets = assets
            return assets
        }
        set {
            self._fetchedAssets = newValue
        }
    }

    var shouldShowCameraPreview: Bool {
        return VideoSessionHandler.canShowCameraFeed
    }

    private let router: ChooseAssetsRouter
    private let photoLibraryObserver: PhotoLibraryObserver

    init(router: ChooseAssetsRouter,
         urlOpener: URLOpener = UIApplication.shared,
         getAssetsClosure: @escaping GetAssetsClosure,
         saveSelectedAssetsClosure: @escaping SaveSelectedAssetsClosure,
         onClose: @escaping () -> Void) {
        self.urlOpener = urlOpener
        self.getAssetsClosure = getAssetsClosure
        self.saveSelectedAssetsClosure = saveSelectedAssetsClosure
        self.onClose = onClose
        self.router = router
        self.photoLibraryObserver = PhotoLibraryObserver()
        self.photoLibraryObserver.onChanged = { [weak self] in
            self?.reloadAssets()
        }
    }

    func fetchAssets() {
        self.assetsDisplayable = .loading(nil)
        self.getAssetsClosure()
            .catch { error in
                return Just(.failure(ErrorDisplayable(error)))
            }
            .sink(receiveValue: { [weak self] result in
                switch result {
                case .failure(let error):
                    self?.assetsDisplayable = .failed(error)
                case .success(let displayable):
                    self?.assetsDisplayable = .found(displayable)
                    self?.selectedAssetIds = displayable.selectedAssetsIds
                }
            })
            .store(in: &self.cancellables)
        self.determineInitialPermissions()
    }

    func didTapClose() {
        self.onClose()
    }

    func didTapDone() {
        self.isSaving = true
        self.getSelectedLocalAssets()
            .flatMap { [weak self] uploadableAssets -> AnyPublisher<Result<[String], ErrorDisplayable>, Error> in
                guard let self = self else { return Fail(error: ReleasedSelfError()).eraseToAnyPublisher() }
                return self.buildSaveSelectedAssetsPublisher(from: uploadableAssets)
            }
            .catch { error in
                return Just(.failure(ErrorDisplayable(error)))
            }
            .sink(receiveValue: { [weak self] result in
                self?.isSaving = false
                switch result {
                case .failure(let error):
                    self?.showSavingError(error)
                case .success(let localIds):
                    for id in localIds {
                        if let index = self?.selectedAssetIds.firstIndex(of: id) {
                            self?.selectedAssetIds.remove(at: index)
                        }
                    }
                    self?.onClose()
                }
            })
            .store(in: &self.cancellables)
    }

    private func getSelectedLocalAssets() -> AnyPublisher<[UploadableAsset], Never> {
        guard [.authorized, .limited].contains(PHPhotoLibrary.authorizationStatus(for: .readWrite)) else {
            return Just([]).eraseToAnyPublisher()
        }
        let result = PHAsset.fetchAssets(withLocalIdentifiers: self.selectedAssetIds, options: self.fetchOptions)
        var publishers: [AnyPublisher<UploadableAsset, Never>] = []
        result.enumerateObjects { asset, _, _ in
            let request: AnyPublisher<Data?, Never> = {
                if asset.mediaType == .image {
                    return self.assetManager.requestImage(for: asset)
                } else {
                    return self.assetManager.requestVideoData(forVideo: asset)
                }
            }()
            let publisher = request
                .compactMap { $0 }
                .map {
                    return UploadableAsset(id: asset.localIdentifier,
                                           mediaType: asset.mediaType,
                                           mediaSubtypes: asset.mediaSubtypes,
                                           size: CGSize(width: asset.pixelWidth, height: asset.pixelHeight),
                                           data: $0)
                }
                .eraseToAnyPublisher()
            publishers.append(publisher)
        }
        return Publishers.MergeMany(publishers).collect()
            .eraseToAnyPublisher()
    }

    func didTapItem(item: ChooseAssetsItem) {
        if let selectedIndex = self.selectedAssetIds.firstIndex(of: item.id) {
            self.selectedAssetIds.remove(at: selectedIndex)
        } else {
            self.selectedAssetIds.append(item.id)
        }
    }

    func getItem(for asset: PHAsset, size: CGSize) -> ChooseAssetsItem {
        if asset.mediaType == .video {
            let source = VideoSource.closure { [assetManager] videoClosure in
                let options = PHVideoRequestOptions()
                options.isNetworkAccessAllowed = true
                options.deliveryMode = .fastFormat
                assetManager.requestPlayerItem(forVideo: asset,
                                               options: options) { playerItem, _ in
                    videoClosure(playerItem)
                }
            }
            return ChooseAssetsItem(id: asset.localIdentifier,
                                    asset: .video(source: source, preview: nil))
        } else {
            let scaledSize = size.applying(CGAffineTransform(scaleX: UIScreen.main.scale,
                                                             y: UIScreen.main.scale))
            let source = ImageSource.closure({ [assetManager] imageClosure in
                assetManager.requestImage(for: asset,
                                          targetSize: scaledSize,
                                          contentMode: .aspectFit,
                                          options: nil) { image, _ in
                    imageClosure(image)
                }
            }, asset.localIdentifier)

            return ChooseAssetsItem(id: asset.localIdentifier,
                                    asset: .image(source: source))
        }
    }

    func didTapCameraPreview() {
        self.router.presentMediaScreen { [weak self] mediaIdentifier in
            self?.selectedAssetIds.append(mediaIdentifier)
        }
    }

    private func reloadAssets() {
        self.fetchedAssets = PHAsset.fetchAssets(with: self.fetchOptions)
        self.authorisationState = .permitted(self.getAllAssets())
    }

    private func getAllAssets() -> [PHAsset] {
        return self.fetchedAssets.objects(at: IndexSet((0..<self.fetchedAssets.count)))
    }

    private func buildSaveSelectedAssetsPublisher(from uploadableAssets: [UploadableAsset]) -> AnyPublisher<Result<[String], ErrorDisplayable>, Error> {
        let assetIds = uploadableAssets.map { $0.id }
        let filteredSelectedAssets = self.selectedAssetIds.filter { !assetIds.contains($0) }
        return self.saveSelectedAssetsClosure(filteredSelectedAssets, uploadableAssets).map { result in
            switch result {
            case .success:
                return .success(assetIds)
            case .failure(let error):
                return .failure(error)
            }
        }.eraseToAnyPublisher()
    }
}

// MARK: Errors
private extension ChooseAssetsViewModel {
    func showSavingError(_ error: ErrorDisplayable) {
        let format = Labels.saveErrorAlertMessageFormat
        self.alertContext = AlertContext(
            title: Labels.saveErrorAlertTitle,
            message: String(format: format, error.localizedDescription)
        )
    }
}

// MARK: Permissions
extension ChooseAssetsViewModel {

    fileprivate func determineInitialPermissions() {
        let libraryStatus = PHPhotoLibrary.authorizationStatus(for: .readWrite)
        let cameraStatus = AVCaptureDevice.authorizationStatus(for: .video)

        switch (libraryStatus, cameraStatus) {
        case (.authorized, .authorized), (.limited, .authorized):
            self.handlePermissionGranted()
        default:
            self.authorisationState = .denied
        }
    }

    func handlePermissionsRequest() {
        let libraryStatus = PHPhotoLibrary.authorizationStatus(for: .readWrite)
        let cameraStatus = AVCaptureDevice.authorizationStatus(for: .video)

        switch (libraryStatus, cameraStatus) {
        case (.authorized, .authorized), (.limited, .authorized):
            self.handlePermissionGranted()
        case (_, .notDetermined), (.notDetermined, _):
            self.requestAuthorizationForCameraAndLibrary()
        case (.denied, _), (_, .denied):
            self.authorisationState = .denied
            self.presentOpenSettingsAlert()
        default:
            self.authorisationState = .denied
        }
    }

    private func requestAuthorizationForCameraAndLibrary() {
        Publishers.Zip(PHPhotoLibrary.requestAuthorization(for: .readWrite), AVCaptureDevice.requestAccess(for: .video))
            .receive(on: DispatchQueue.main)
            .sink { [weak self] newLibraryStatus, newCameraStatus in
                let hasPermissions = newCameraStatus && newLibraryStatus == .authorized || newLibraryStatus == .limited
                if hasPermissions {
                    self?.handlePermissionGranted()
                } else {
                    self?.authorisationState = .denied
                }
            }.store(in: &self.cancellables)
    }

    private func presentOpenSettingsAlert() {
        let button = AlertContext.Button(title: Labels.settingsAlertActionTitle,
                                         style: .default(action: { [weak self] in
            self?.urlOpener.openAppSettingsURL()
        }))
        self.alertContext = AlertContext(title: Labels.settingsAlertTitle,
                                         message: Labels.settingsAlertMessage,
                                         primaryButton: button,
                                         secondaryButton: .cancel())
    }

    private func handlePermissionGranted() {
        self.authorisationState = .permitted(self.getAllAssets())
        self.photoLibraryObserver.register()
    }
}

private final class PhotoLibraryObserver: NSObject, PHPhotoLibraryChangeObserver {
    var onChanged: (() -> Void)?

    deinit {
        PHPhotoLibrary.shared().unregisterChangeObserver(self)
    }

    func register() {
        PHPhotoLibrary.shared().register(self)
    }

    func photoLibraryDidChange(_ changeInstance: PHChange) {
        DispatchQueue.main.async {
            self.onChanged?()
        }
    }
}
