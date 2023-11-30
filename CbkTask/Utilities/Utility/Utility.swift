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
    /// This method will return a Top Most View Controller of the application's window which you wan use.
    ///
    /// - Returns: Object of the UIViewController
    static func topMostController() -> UIViewController {
        let arrWind = APPLICATION.windows
        if arrWind.count > 0 {
            if let keyWndw = APPLICATION.windows.filter({$0.isKeyWindow}).first {
                var topController: UIViewController = keyWndw.rootViewController!
                while topController.presentedViewController != nil {
                    topController = topController.presentedViewController!
                }
                return topController
            }
        }
        return UIViewController()
    }
    
    static var timestamp: String {
        return "\(Int(Date().timeIntervalSince1970 * 1000))"
    }
    
    /// function takes a closed range of integers and returns a random number within that range. The arc4random_uniform function is used to generate a random unsigned integer within the specified range, and then it's converted to an Int and adjusted to match the desired range.
    static  func generateRandomNumber(inRange range: ClosedRange<Int>) -> Int {
        return Int(arc4random_uniform(UInt32(range.upperBound - range.lowerBound + 1))) + range.lowerBound
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
