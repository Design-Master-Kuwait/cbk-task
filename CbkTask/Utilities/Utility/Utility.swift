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
        let controller =  UDManager.isUserLogin ? HomeVC.instantiate() :  LoginVC.instantiate()
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
    
    /// set navigation bar theame
    static func applyTheme() {
        if #available(iOS 15, *) {
                        let navigationBarAppearance = UINavigationBarAppearance()
                        navigationBarAppearance.configureWithOpaqueBackground()
                        navigationBarAppearance.shadowColor = .clear
                        navigationBarAppearance.shadowImage = UIImage()

                        navigationBarAppearance.titleTextAttributes = [
                            NSAttributedString.Key.foregroundColor : UIColor.clear
                        ]
                        navigationBarAppearance.backgroundColor = UIColor.Color.green
            
                        UINavigationBar.appearance().standardAppearance = navigationBarAppearance
                        UINavigationBar.appearance().compactAppearance = navigationBarAppearance
                        UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
                    
            } else {
            
                    UINavigationBar.appearance().barStyle = UIBarStyle.black
                    UINavigationBar.appearance().tintColor =  UIColor.Color.green
                    UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
                UINavigationBar.appearance().backgroundColor = UIColor.Color.green
                    UINavigationBar.appearance().isTranslucent = false
                    UINavigationBar.appearance().barTintColor = UIColor.black
            
                    let buttonAttrs = [NSAttributedString.Key.font: (UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.light), color: UIColor.white)]
                    UIBarButtonItem.appearance().setTitleTextAttributes(buttonAttrs, for: .normal)
                    UIBarButtonItem.appearance().setTitleTextAttributes(buttonAttrs, for: .highlighted)
            
                    let attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.light), NSAttributedString.Key.foregroundColor: UIColor.Color.green]
                    UINavigationBar.appearance().titleTextAttributes = attributes as [NSAttributedString.Key: Any]
            
                
        }
        


    }
    
}
