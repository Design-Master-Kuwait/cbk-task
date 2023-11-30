//
//  AppDelegate.swift
//  CbkTask
//
//  Created by bhikhu on 28/11/23.
//

import UIKit
import Firebase
import GoogleSignIn
@UIApplicationMain
class AppDelegate: UIResponder , UIApplicationDelegate{

    var window:UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        // Google + Firebase Setup
        Utility.applyTheme()

        FirebaseApp.configure()
        if UDManager.isUserLogin {
            Utility.setRootScreen()
        }
        return true
    }



}

