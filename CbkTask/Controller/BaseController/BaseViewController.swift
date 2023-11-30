//
//  BaseViewController.swift
//  CbkTask
//
//  Created by bhikhu on 28/11/23.
//

import UIKit

// Base viewcontroller class , will use for all ciew controler as base controller
class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
    }
    
    // MARK: Private Methods
    /// Show alert action
    func showLogoutAlert()  {
        UIAlertController.showAlert(controller: self, title: Localizable.info.appName, message: Localizable.Message.logout, style: .alert, cancelButton: Localizable.AlertButton.no, distrutiveButton: Localizable.AlertButton.yes, otherButtons: nil) { (_, btnStr) in
            if btnStr == Localizable.AlertButton.yes {
                UserManager.shared.removeUser()
                Utility.setRootScreen(isShowAnimation: true)
            }
        }
    }
    
}
