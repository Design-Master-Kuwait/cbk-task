//
//  AuthVM.swift
//  CbkTask
//
//  Created by bhikhu on 29/11/23.
//

import Foundation
import Foundation
import UIKit

/// Auth View Model contain all logic and method related to user flow
class AuthVM {
    var objUser: User?
    
    /// save User Details
    /// - Parameters:
    ///   - user: SocialUser
    public func saveUserData(user: SocialUser) {
        objUser = User(json: [:])
        objUser?.name = user.firstName
        objUser?.id = user.socialID
        objUser?.email = user.email
        objUser?.image = user.imageURL?.absoluteString
    }
    
    /// Handle Auth Sucess
    /// - Parameters:
    ///   - data: Any
    ///   - completion: Void
    func handleSuccess(completion: @escaping (() -> Void)) {
        UserManager.shared.sync(user: objUser!) // synch data with key chain
        completion()
    }
    
    
}
