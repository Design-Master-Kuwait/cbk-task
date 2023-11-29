//
//  LoginVC.swift
//  CbkTask
//
//  Created by bhikhu on 28/11/23.
//

import UIKit

class LoginVC: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func btnLoginTaped(_ sender: Any) {
        GoogleManager.shared.signIn(from: self) { [weak self] (result) in
                    guard let self = self else { return }
                    switch result {
                    case .success(let response):
                        // ✅ Successfully logged-in.
                        print( "Auth Code==", response.authCode ?? "")
                        if response.authCode?.isBlank == false {
                            
                        }
                        GoogleManager.shared.logout()
                        
                    case .failure(let error):
                        // 🚨 Display an error message to the user.
                        print(error)
                    }
                }
    }
    
}
