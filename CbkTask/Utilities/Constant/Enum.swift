//
//  Enum.swift
//  CbkTask
//
//  Created by bhikhu on 28/11/23.
//

import Foundation
import UIKit
/// Register login type normal and social for identify
public enum RegistationType: String {
    case normal
    case google
}

/// Firebase Firestore Keys
struct FirbaseKeys {
    static let feed                                 = "Feed"
    static let users                                 = "Users"
    static let name                                 = "name"
    static let email                                 = "email"
    static let profile                                = "image"
    static let id                                = "id"
    static let photos                                = "photos"
    static let images                                = "images"
    static let user                                = "user"
}

/// Image constant used for show static icons
struct ImageConstant {
    static let placeholder                                 = UIImage(named: "ic_placeholder")
 
}
