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
        FirebaseDeepLinkManager.shared.uploadImagetoServer(img: img) { sucess in
            completion(true)
        }
    }
    
}
