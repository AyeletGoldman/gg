// Copyright © 2022 LVMH. All rights reserved.

import Foundation
import UIKit

/// WARNING: `UIImagePickerController` is not designed for subclassing, so we are stepping around the boundaries of safety here.
/// The actual implementation of this controller is extremely simple, so I am confident that this is not a problem.
final class CameraViewController: UIImagePickerController, UINavigationControllerDelegate {

    private enum Labels {
        static let noAvailableSources = MKLocalizedString("camera.error.no-available-sources.title",
                                                          comment: "An error to show when the device we are using does not have a camera but we are trying to show the camera feed")
    }

    var viewModel: CameraViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        if !UIImagePickerController.isSourceTypeAvailable(.camera) {
            self.showNoAvailableSourceButton()
        }
        self.delegate = self
    }

    func configure() {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            self.sourceType = .camera
            let availableTypes = UIImagePickerController.availableMediaTypes(for: .camera) ?? []
            self.mediaTypes = availableTypes
        }
    }

    private func showNoAvailableSourceButton() {
        let button = UIButton(frame: self.view.bounds, primaryAction: UIAction(handler: { [weak self] _ in
            self?.viewModel.didTapClose()
        }))
        button.backgroundColor = .black
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.numberOfLines = 0
        button.setTitle(Labels.noAvailableSources, for: .normal)
        button.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.view.addSubview(button)
        self.view.bringSubviewToFront(button)
    }
}

extension CameraViewController: UIImagePickerControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.viewModel.didTapClose()
    }

    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        self.viewModel.didFinishTakingMedia(info: info)
    }
}
