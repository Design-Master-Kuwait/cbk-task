//
//  LoginVC.swift
//  CbkTask
//
//  Created by bhikhu on 28/11/23.
//

import UIKit

/// Login Vc contain all logic and Ui  for login funcation which is perfom in google sign in
class LoginVC: BaseViewController, StoryboardSceneBased {
    
    /// Storyboard variable
    static let sceneStoryboard = UIStoryboard(name: StoryboardName.onboarding.rawValue, bundle: nil)

    // MARK: Variable
    private lazy var authVM: AuthVM = {
        return AuthVM()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    // MARK: IBActiond
    // action method on google login button click
    /// - Parameter sender: object of button
    @IBAction func btnLoginTaped(_ sender: Any) {
        Connectivity.shared.isConnected ? authenticateWithGoogle()  : AlertMesage.showInternetNotConnected(message: Localizable.Message.noNetwork)  // checked is netowork connected or not
    }
    
    /// Authenticate using google login account
    func  authenticateWithGoogle() {
        GoogleManager.shared.signIn(from: self) { [weak self] (result) in
                    guard let self = self else { return }
                    switch result {
                    case .success(let response):
                        // ✅ Successfully logged-in.
                        AlertMesage.show(.success, message: Localizable.Message.loginSucess)
                        print( "Auth Code==", response.authCode ?? "")
                        GoogleManager.shared.logout()
                        if response.authCode?.isBlank == false {
                            authVM.saveUserData(user: response)
                            checkFireStoreUserData()
                        }
                    case .failure(let error):
                        // 🚨 Display an error message to the user.
                        AlertMesage.show(.error, message: error.localizedDescription)
                        print(error)
                    }
                }
    }
    
    /// Fetch data from fire store if user already exist
    func checkFireStoreUserData()  {
        authVM.handleSuccess {
            FirebaseDatabaseManager.shared.getUserData {
                FirebaseDatabaseManager.shared.insertUserData() // for storing user data in firebase
                Utility.setRootScreen(isShowAnimation: true)
            }
            
        }
    }
}
