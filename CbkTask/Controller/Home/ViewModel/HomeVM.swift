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
    func uploadImage(img: UIImage, completion: @escaping ((Bool) -> Void)) {
        FirebaseDatabaseManager.shared.uploadImagetoServer(img: img) { sucess , url in
            if let finlaUrl = url {
                FirebaseDatabaseManager.shared.updateUserModel(photoUrl: finlaUrl)
            }
            
            completion(true)
        }
    }
    
}
