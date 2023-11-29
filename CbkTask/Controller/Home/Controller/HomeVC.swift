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

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: IBActiond
    // action method on Add Photos button click
    /// - Parameter sender: object of button
    @IBAction func btnAddTapped(_ sender: Any) {
    }
    
}
