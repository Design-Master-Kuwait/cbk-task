//
//  HomeVC.swift
//  CbkTask
//
//  Created by bhikhu on 29/11/23.
//

import UIKit

/// Question VC display all images which is users has uploded
class HomeVC: BaseViewController, StoryboardSceneBased {

    /// Storyboard variable
    static let sceneStoryboard = UIStoryboard(name: StoryboardName.home.rawValue, bundle: nil)

    // MARK: Variable
    private lazy var homeVM: HomeVM = {
        return HomeVM()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // MARK: IBActiond
    // action method on Add Photos button click
    /// - Parameter sender: object of button
    @IBAction func btnAddTapped(_ sender: Any) {
        ImagePicker.shared.showImagePicker((ROOT_FIRST_VC?.rootViewController)!, isIcloud: false, completion: { _, info in
            if info != nil {
                if let pickedImage = info![UIImagePickerController.InfoKey.editedImage] as? UIImage {
                    self.uploadImage(img: pickedImage)
                }
            }
        }) { _ in
        }

    }
    
    /// Image Uploaded API
    /// - Parameter img: UIimage
    func uploadImage(img: UIImage) {
        homeVM.uploadImage(img: img) { status in
            if status {
                AlertMesage.show(.success, message: Localizable.Message.imuploaded)

            }
        }
        
    }
    
}
