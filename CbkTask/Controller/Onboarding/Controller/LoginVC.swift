//
//  LoginVC.swift
//  CbkTask
//
//  Created by bhikhu on 28/11/23.
//

import UIKit
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth
import FirebaseStorage

class LoginVC: BaseViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: IBActiond
    // action method on google login button click
    /// - Parameter sender: object of button
    @IBAction func btnLoginTaped(_ sender: Any) {
        if !Connectivity.shared.isConnected {
            AlertMesage.showInternetNotConnected(message: Localizable.Message.noNetwork)
            return
        }
        authneticateWithGoogle()
    }
    
    func authneticateWithGoogle() {
        GoogleManager.shared.signIn(from: self) { [weak self] (result) in
                    guard let self = self else { return }
                    switch result {
                    case .success(let response):
                        // ✅ Successfully logged-in.
                        AlertMesage.show(.success, message: Localizable.Message.loginSucess)

                        print( "Auth Code==", response.authCode ?? "")
                        if response.authCode?.isBlank == false {
                            
                        }
                        GoogleManager.shared.logout()
                        
                    case .failure(let error):
                        // 🚨 Display an error message to the user.
                        AlertMesage.show(.error, message: error.localizedDescription)
                        print(error)
                    }
                }
    }
}
