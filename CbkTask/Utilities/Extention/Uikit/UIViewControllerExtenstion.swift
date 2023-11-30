//
//  UIViewControllerExtenstion.swift
//  CbkTask
//
//  Created by Hetu on 30/11/23.
//

import UIKit
import AVFoundation

// Extemtion used to hanle commin method and variable used in every controller
extension UIViewController {
    
    /// pop controller
    /// - Parameter controller: UIViewController
    func popVC(animated: Bool = true) {
        self.navigationController?.popViewController(animated: animated)
    }
    
    // MARK: Push to view controller
    /// push controller
    /// - Parameter controller: UIViewController
    func pushVC(controller: UIViewController, animated: Bool = true) {
        self.navigationController?.pushViewController(controller, animated: animated)
    }
    
    // MARK: Back to view controller
    
    // action method on back button click
    /// - Parameter sender: object of button
    @IBAction func btnBackPopTappe(_ sender: Any) {
        self.popVC()
    }
    
    // action method on sigup button click
    /// - Parameter sender: object of button
    @IBAction func btnDismisTapped(_ sender: Any) {
        self.dismiss(animated: true,completion: nil)
    }
    
}

