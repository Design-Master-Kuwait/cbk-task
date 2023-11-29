//
//  FirebaseFileManager.swift
//  CbkTask
//
//  Created by Hetu on 29/11/23.
//

import Foundation
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth
import FirebaseStorage

/// Perform all firebase file uplded task
class FirebaseDeepLinkManager {
    
    // Get a reference to the storage service using the default Firebase App
    let storage = Storage.storage()

    static let shared = FirebaseDeepLinkManager()
  
    func uploadImagetoServer( img: UIImage, completion: @escaping ((Bool) -> Void)) {
        if !Connectivity.shared.isConnected {
            AlertMesage.showInternetNotConnected(message: Localizable.Message.noNetwork)
            completion(false)
            return
        }
        ProgressHUD.show()
        
        // Create a storage reference from our storage service
        let storageRef = storage.reference()
        
        // Data in memory
        let data = img.pngData() ?? Data()

        // Create a reference to the file you want to upload
        
        let riversRef = storageRef.child("images/\(Utility.timestamp).jpeg")
            
        // Upload the file to the path "images/rivers.jpg"
        let uploadTask = riversRef.putData(data, metadata: nil) { (metadata, error) in
            ProgressHUD.hide()
            guard let metadata = metadata else {
            // Uh-oh, an error occurred!
              completion(false)
            return
          }
          // You can also access to download URL after upload.
          riversRef.downloadURL { (url, error) in
            guard let downloadURL = url else {
              // Uh-oh, an error occurred!
                completion(false)
              return
            }
            
              completion(true)
            
          }
        }

    }
}
