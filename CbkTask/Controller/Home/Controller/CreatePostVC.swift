//
//  CreatePostVC.swift
//  CbkTask
//
//  Created by Hetu on 30/11/23.
//

import UIKit
/// Create post   used to create post uploed photos and store datas
class CreatePostVC: BaseViewController, StoryboardSceneBased {
    
    /// Storyboard variable
    static let sceneStoryboard = UIStoryboard(name: StoryboardName.home.rawValue, bundle: nil)
    
    // MARK: IB Outles
    @IBOutlet weak var txtTitle: UITextField!
    @IBOutlet weak var imgCreate: UIImageView!
    var imgPost: UIImage?
    
    // MARK: Variable
    private lazy var homeVM: HomeVM = {
        return HomeVM()
    }()
    
    var createBlock: (() -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: Private Methods
    /// Image Uploaded API
    /// - Parameter img: UIimage
    private  func uploadImage(img: UIImage) {
        homeVM.uploadImage(img: img) { status , url in
            if status {
                self.createPostAPI(imgUrl: url ?? "")
            }
        }
    }
    
    /// createPost API
    /// - Parameter imgUrl: Image Url
    func createPostAPI(imgUrl: String)  {
        homeVM.createpostAPI(photoUrl: imgUrl, title: txtTitle.text ?? "") {
            self.dismiss(animated: true, completion: {
                AlertMesage.show(.success, message: Localizable.Message.postCreated)
                self.createBlock?()
            })
        }
    }
    
    // MARK: IBActiond
    // action method on Add Photos button click
    /// - Parameter sender: object of button
    @IBAction func btnAddPhotoTapped(_ sender: Any) {
        ImagePicker.shared.showImagePicker(Utility.topMostController(), isIcloud: false, completion: { _, info in
            if info != nil {
                if let pickedImage = info![UIImagePickerController.InfoKey.editedImage] as? UIImage {
                    self.imgPost = pickedImage
                    self.imgCreate.image = pickedImage
                }
            }
        }) { _ in
        }
    }

    // action method on create post button click
    /// - Parameter sender: object of button
    @IBAction func btncreateTaped(_ sender: Any) {
        if validateData() {
            self.uploadImage(img: imgCreate.image!)
        }
    }
    
}

/// Validate Value
/// - Returns: Bool
extension CreatePostVC {
    /// Validate Value
    /// - Returns: Bool
    private func validateData() -> Bool {
        if (txtTitle.text ?? "").isBlank{
            // 🚨 Blank Email
            AlertMesage.show(.error, message: Localizable.Message.title)
            return false
        } else if imgPost == nil  {
            // 🚨 Blank Email
            AlertMesage.show(.error, message: Localizable.Message.image)
            return false
        }
        return true
    }
}
