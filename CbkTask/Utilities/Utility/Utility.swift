//
//  Utility.swift
//  CbkTask
//
//  Created by bhikhu on 29/11/23.
//

import Foundation
import  AVKit
/// Utility class for application
public class Utility {
    
    // MARK: - singleton sharedInstance
    static var sharedInstance = Utility()
 
    /// This method will set root root view controller
    static func setRootScreen(isShowAnimation: Bool = false) {
        let controller =  HomeVC.instantiate()
        let navigationController = BaseNavigationController(rootViewController: controller)
        if isShowAnimation {
            UIView.transition(with: ROOT_FIRST_VC!,
                              duration: 0.5, options: .transitionFlipFromLeft,
                              animations: {
                                ROOT_FIRST_VC?.rootViewController = navigationController
                                ROOT_FIRST_VC?.makeKeyAndVisible()

                              }, completion: { _ in

                              })
        } else {
            ROOT_FIRST_VC?.rootViewController = navigationController
            ROOT_FIRST_VC?.makeKeyAndVisible()
        }

         
    }
    static var timestamp: String {
        return "\(Int(Date().timeIntervalSince1970 * 1000))"
    }
    
}
