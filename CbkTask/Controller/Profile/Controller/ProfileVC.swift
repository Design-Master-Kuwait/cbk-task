//
//  ProfileVC.swift
//  CbkTask
//
//  Created by Hetu on 30/11/23.
//

import UIKit

/// Profile vc containe show basic information about login user like name email and photo and uploed feed photos
class ProfileVC: BaseViewController , StoryboardSceneBased {
    
    /// Storyboard variable
    static let sceneStoryboard = UIStoryboard(name: StoryboardName.profile.rawValue, bundle: nil)

    // MARK: IB Outlets
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var tblPhotos: UITableView!
    @IBOutlet weak var lblNoAnyPhoto: UILabel!
    @IBOutlet weak var imgProfile: UIImageView!
    
    // MARK: Variable
    override func viewDidLoad() {
        super.viewDidLoad()
        configureOnViewDidLoad()
        
    }
    // MARK: - Private Methods
    private func configureOnViewDidLoad() {
        setUserData()
        lblNoAnyPhoto.isHidden = UDManager.userPhotos?.count ?? 0 > 0 ?  true : false
        tblPhotos.register(cellType: PhotoCell.self)
        tblPhotos.rowHeight = 140
        tblPhotos.reloadData()
        
    }
    /// Set user pfofile data into lable and image
    func setUserData()  {
        if let currentUser = UserManager.shared.current {
            lblName.text = currentUser.name ?? ""
            lblEmail.text = currentUser.email ?? ""
            imgProfile.setImageUsingKF(imgPath: currentUser.image ?? "")
        }
    }
}
