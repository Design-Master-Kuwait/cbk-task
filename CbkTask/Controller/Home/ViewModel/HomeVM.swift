//
//  HomeVM.swift
//  CbkTask
//
//  Created by Hetu on 29/11/23.
//

import Foundation
import UIKit
/// Handle all task perfomre in home view controler like photo uploed and list of display images
class HomeVM {
    
    /// Upload image to firebase storage
    /// - Parameters:
    ///   - img: UIimage
    ///   - completion: completion hadle
    func uploadImage(img: UIImage, completion: @escaping ((Bool, String?) -> Void)) {
        FirebaseDatabaseManager.shared.uploadImagetoServer(img: img) { sucess , url in
            if let finlaUrl = url {
                FirebaseDatabaseManager.shared.updateUserModel(photoUrl: finlaUrl)
            }
            completion(true, url)
        }
    }
    /// Get  user detail  from firebase firestore
     func getUserProfileAPI(completion: @escaping (() -> Void))  {
        FirebaseDatabaseManager.shared.getUserData(isShowLoader: true) { // for fetching latest user data from fire store
            completion()
        }
    }
    
    /// Get all post which is posted by User
    func getAllPostAPI(completion: @escaping ((FeedData?) -> Void)) {
        FirebaseDatabaseManager.shared.fetchAllFeeds { sucess, feeds in
            completion(feeds)
        }
    }

    /// Create post APi
    /// - Parameters:
    ///   - photoUrl: Uploded photo url
    ///   - comment: comment wiich user had entred
    ///   - completion:completion  block
    func createpostAPI(photoUrl: String, title: String, completion: @escaping (() -> Void)) {
        FirebaseDatabaseManager.shared.insertFeed(photoUrl: photoUrl, title: title) {
            completion()
        }
    }
}
