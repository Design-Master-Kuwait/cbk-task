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
    
    // MARK: IB Outlets
    @IBOutlet weak var tblPost: UITableView!
    
    // MARK: Variable
    private lazy var homeVM: HomeVM = {
        return HomeVM()
    }()
    var arrFeed = [Feed]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureOnViewDidLoad()
    }
    
    // MARK: - Private Methods
    private func configureOnViewDidLoad() {
        tblPost.register(cellType: PostCell.self)
        tblPost.estimatedRowHeight = 140
        tblPost.rowHeight = UITableView.automaticDimension
        tblPost.reloadData()
        getUserProfileAndPost()
    }
    
    // MARK: Private Methods
    ///  fetch user profile and user post
    private func getUserProfileAndPost(){
        homeVM.getUserProfileAPI {
            self.getAllPostAPI()
        }
    }
    
    /// Get all post API which is uploded by users
    func getAllPostAPI() {
        self.homeVM.getAllPostAPI { feed in
            if let objFeeed = feed {
                self.arrFeed = objFeeed.feed ?? []
            }
            self.tblPost.reloadData()
        }
    }
    
    // MARK: IBActiond
    // action method on Profile button click
    /// - Parameter sender: object of button
    @IBAction func btnProfileTappped(_ sender: Any) {
        let controller = ProfileVC.instantiate()
        self.pushVC(controller: controller)
    }
    
    // action method on add post button click
    /// - Parameter sender: object of button
    @IBAction func btnAddPostTapped(_ sender: Any) {
        let controller = CreatePostVC.instantiate()
        controller.createBlock = {
            self.getAllPostAPI()
        }
        self.present(controller, animated: true)
    }
   
    // action method on logout button click
    /// - Parameter sender: object of button
    @IBAction func logoutTapped(_ sender: Any) {
        showLogoutAlert()
    }
    
}
