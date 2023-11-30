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
    static let like                                = "like"
    
    static let title                                = "title"
    static let postid                                = "id"
    static let userid                                = "userid"
    static let comment                                = "comment"
    static let comments                                = "Comment"
    static let dataFeed                                = "Data/Feed"
    static let data                                = "Data"
    
    
    
}

/// Image constant used for show static icons
struct ImageConstant {
    static let placeholder                                 = UIImage(named: "ic_placeholder")
 
}
