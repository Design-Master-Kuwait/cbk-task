//
//  AppDelegate + GoogleSignin.swift
//  CbkTask
//
//  Created by Hetu on 29/11/23.
//

import Foundation
import UIKit
import Firebase
import UserNotifications
import GoogleSignIn

extension AppDelegate {
    
    @available(iOS 9.0, *)
        func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey: Any]) -> Bool {
            
            // Handle Google URL
            if GIDSignIn.sharedInstance().handle(url) {
                return true
            }
            
            return false
            
        }
        
        func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
            
            // Handle Google URL
            if GIDSignIn.sharedInstance().handle(url) {
                return true
            }
            
          return false
            
        }
    
}
