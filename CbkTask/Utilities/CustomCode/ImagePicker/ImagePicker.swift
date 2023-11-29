//
//  ImagePicker.swift
//  VidVersity
//
//  Created By: Bhikhu Vaja Vaja, My Chronicle Infotech Ltd
//  Created on: 22/12/17 11:51 AM - (My Chronicle)
//
//  Copyright © 2017 My Chronicle Infotech Ltd. All rights reserved.
//
//

import Foundation
import MobileCoreServices
import Photos
import UIKit

class ImagePicker: NSObject, UINavigationControllerDelegate {
    // MARK: - Shared Instance

    /// Shared instance of the ImagePicker class
    public static let shared = ImagePicker()

    // MARK: - Private Properties

    /// typealias block of the conpletion. which has the param of UIImagePickerController and selected info dictionary which can be null.
    typealias imagePickerCompletionBlock = (UIImagePickerController, [UIImagePickerController.InfoKey: Any]?) -> Void

    typealias iCloudCompletion = (_ isSelectedFromiCloud: Bool) -> Void

    /// Property of the Completion Block
    fileprivate var didCompletePicking: imagePickerCompletionBlock?

    /// Object of the ImagePicker Controller
    fileprivate var imagePicker: UIImagePickerController // = UIImagePickerController()

    override init() {
        imagePicker = UIImagePickerController()
        super.init()
        imagePicker.modalPresentationStyle = UIModalPresentationStyle.currentContext
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        imagePicker.videoQuality = .type640x480
        if #available(iOS 11.0, *) {
            imagePicker.videoExportPreset = AVAssetExportPreset640x480
        }
        imagePicker.videoMaximumDuration = (60 * 30) // Max duration = 30 mins
        imagePicker.mediaTypes = [kUTTypeImage as String]
    }

    // MARK: - Public Method

    /// This method will use to select image form native gallery or to capture using camera. ActionSheet will be displayed with these two options and further operation will be execured based on user's selection.
    ///
    ///     ImagePicker.shared.showImagePicker(self, sender: sender) { (imagePicker, info) -> (Void) in <YOUR CODE GOES HERE> }
    ///
    /// - Parameters:
    ///   - controller: Object of controller from which you need to display Image Picker
    ///   - completion: Completion block will be called when user has selected image or operation will be completed.
    public func showImagePicker(_ controller: UIViewController, isIcloud: Bool, sender: UIView? = nil, completion: @escaping imagePickerCompletionBlock, isiCloudOpen: @escaping iCloudCompletion) {
        // Assign the Block
        didCompletePicking = completion

        // Set Message
        let strMessage = Localizable.info.appName // appName.localized

        // Create Objectc of the UIAlertController
        let alert = UIAlertController(title: nil, message: strMessage, preferredStyle: .actionSheet)

        // Add Cancel Action
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))

        // Add Use Camera Option
        alert.addAction(UIAlertAction(title: "Select Camera", style: .default, handler: { _ in

            self.useCamera(controller)

        }))

        // Add Use Gallery Option
        alert.addAction(UIAlertAction(title: "Select From Gallery", style: .default, handler: { _ in

            self.usePhotoLibrary(controller)

        }))

        if isIcloud {
            // Add Use iCloud Option
            alert.addAction(UIAlertAction(title: "iCloud", style: .default, handler: { _ in

                isiCloudOpen(true)

            }))
        }

        // Display Action Sheet
        DispatchQueue.main.async {
            // This will display in PopOver.
            if let popoverController = alert.popoverPresentationController, let view = sender {
                popoverController.sourceView = view.superview
                popoverController.sourceRect = view.frame
                popoverController.permittedArrowDirections = .any
            }
            controller.present(alert, animated: true, completion: nil)
        }
    }
}

// MARK: - Private Methods

extension ImagePicker {
    /// This method will display an Alert on the Screen.
    ///
    /// - Parameters:
    ///   - controller: Object of the controller form which you need to show alert.
    ///   - message: Message which you need to display.
    fileprivate func showAlert(_: UIViewController, message: String) {
        AlertMesage.show(.info, message: message)
    }

    /// This method will use to display an Alert related to Access permission.
    ///
    /// - Parameters:
    ///   - controller: Object of the controller
    ///   - message: Message which you need to display
    fileprivate func showAlertForEnableAccessPermission(_: UIViewController, message: String) {
        AlertMesage.show(.info, message: message)
//        UIAlertController.showAlert(controller: controller, message: message, cancelButton: "Cancel", otherButtons: ["Settings"]) { (index, title) in
//            if index == 0 {
//                // Settings button click
//                if let appSettings = URL(string: UIApplication.openSettingsURLString), UIApplication.shared.canOpenURL(appSettings) {
//                    if #available(iOS 10.0, *) {
//                        UIApplication.shared.open(appSettings, options: [:], completionHandler: nil)
//                    } else {
//                        // Fallback on earlier versions
//                        UIApplication.shared.openURL(appSettings)
//                    }
//
//                }
//            }
//        }
    }

    /// This method will use to check Photo Library Access permission and display Photos
    ///
    /// - Parameter controller: Object of the controller
    public func usePhotoLibrary(_ controller: UIViewController) {
        handlePhotoLibraryStatus(PHPhotoLibrary.authorizationStatus(), controller: controller)
    }

    /// This method will handle the Photo Library's "PHAuthorizationStatus" and displa
    ///
    /// - Parameters:
    ///   - status: PHAuthorizationStatus
    ///   - controller: Object of the controller on which you wanted to display ImagePicker
    fileprivate func handlePhotoLibraryStatus(_ status: PHAuthorizationStatus, controller: UIViewController) {
        
        if #available(iOS 14.0, *) {
            DispatchQueue.main.async {
                self.imagePicker.delegate = self
//                self.imagePicker.allowsEditing = isEditing
                //self.imagePicker.videoQuality = .type640x480
//                self.imagePicker.videoMaximumDuration = 60
//                self.imagePicker.mediaTypes = type // Pass this value  // kUTTypeImage // kUTTypeMovie
                self.imagePicker.sourceType = .photoLibrary

                controller.present(self.imagePicker, animated: true, completion: nil)

            }
        } else {
            switch status {
            case .authorized:
                print("Photos Authorized")
                DispatchQueue.main.async {
                    self.imagePicker.delegate = self
//                    self.imagePicker.allowsEditing = isEditing
                    //self.imagePicker.videoQuality = .type640x480
//                    self.imagePicker.videoMaximumDuration = 60
//                    self.imagePicker.mediaTypes = type // Pass this value  // kUTTypeImage // kUTTypeMovie
                    self.imagePicker.sourceType = .photoLibrary

                    controller.present(self.imagePicker, animated: true, completion: nil)

                }

            case .denied:
                print("Photos Denied")
                DispatchQueue.main.async {
                    self.showAlertForEnableAccessPermission(controller, message: "You need to enable Photos access from the settings.")
                    self.didCompletePicking?(self.imagePicker, nil)
                }
            case .restricted:
                print("Photos restricted")
                DispatchQueue.main.async {
                    self.didCompletePicking?(self.imagePicker, nil)
                }
            case .notDetermined:
                print("Photos notDetermined")
                DispatchQueue.main.async {
                    PHPhotoLibrary.requestAuthorization({ (status) in
                        self.handlePhotoLibraryStatus(status, controller: controller)
                    })
                }
            @unknown default: break

            }
        }
    }

    /// This method will check if Camera is available or not and is the permission is granted to access it or not and then display the Camera for capturing video or photos.
    ///
    /// - Parameter controller: Object of the controller
    public func useCamera(_ controller: UIViewController) {
        if !UIImagePickerController.isSourceTypeAvailable(.camera) {
//            MessageBar.show(.error, message: "Camera is not supported in this device.")
            didCompletePicking?(imagePicker, nil)
            return
        }

        // Check for the authorisation status.
        if AVCaptureDevice.authorizationStatus(for: .video) == .authorized {
            // Already authorized
            openNativeCamera(controller)
        } else {
            AVCaptureDevice.requestAccess(for: .video, completionHandler: { (granted: Bool) in
                if granted {
                    // Access allowed
                    self.openNativeCamera(controller)
                } else {
                    // Access denied
                    self.showAlertForEnableAccessPermission(controller, message: "You need to enable Camera access from the settings.")
                    self.didCompletePicking?(self.imagePicker, nil)
                }
            })
        }
    }

    /// This method will open a Native Camera.
    ///
    /// - Parameter controller: Object of the controller
    fileprivate func openNativeCamera(_ controller: UIViewController) {
        DispatchQueue.main.async {
//            self.imagePicker.modalPresentationStyle = UIModalPresentationStyle.currentContext
//            self.imagePicker.delegate = self
//            self.imagePicker.allowsEditing = true
//            self.imagePicker.videoQuality = .type640x480
//            self.imagePicker.videoMaximumDuration = 60
//            self.imagePicker.mediaTypes = [kUTTypeMovie as String] // Pass this value  // kUTTypeImage // kUTTypeMovie
            self.imagePicker.sourceType = .camera
            controller.present(self.imagePicker, animated: true, completion: nil)
        }
    }
}

// MARK: - UIImagePickerControllerDelegate Methods

extension ImagePicker: UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        imagePicker.dismiss(animated: true) {
            self.didCompletePicking?(picker, info)
        }
    }

    func imagePickerControllerDidCancel(_: UIImagePickerController) {
        imagePicker.dismiss(animated: true) {
            self.didCompletePicking?(self.imagePicker, nil)
        }
    }
}
