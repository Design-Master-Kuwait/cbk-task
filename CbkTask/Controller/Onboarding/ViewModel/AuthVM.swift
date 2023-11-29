//
//  AuthVM.swift
//  CbkTask
//
//  Created by bhikhu on 29/11/23.
//

import Foundation
import Foundation
import UIKit

class AuthVM {
    
    
    /// Handle Auth Sucess
    /// - Parameters:
    ///   - data: Any
    ///   - completion: Void
    func handleSuccess(data: Any, completion: @escaping (() -> Void)) {
        let aUser = User(object: data)
        UserManager.shared.sync(user: aUser)
        completion()
    }
    
    
}
