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
class FirebaseDatabaseManager {
    
    // Get a reference to the storage service using the default Firebase App
    let storage = Storage.storage()

    // Get a database reference to the Firestore storage service using the default Firebase firstore
    let database = Firestore.firestore()

    static let shared = FirebaseDatabaseManager()
    
    /// Upload image into firebase storage
    /// - Parameters:
    ///   - img: Uiimage
    ///   - completion: completion  handler
    func uploadImagetoServer( img: UIImage, completion: @escaping ((Bool, String?) -> Void)) {
        if !Connectivity.shared.isConnected {
            AlertMesage.showInternetNotConnected(message: Localizable.Message.noNetwork)
            completion(false, nil)
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
                completion(false, nil)
            return
          }
          // You can also access to download URL after upload.
          riversRef.downloadURL { (url, error) in
            guard let downloadURL = url else {
              // Uh-oh, an error occurred!
                completion(false, nil)
              return
            }
              completion(true, downloadURL.absoluteString)
            
          }
        }
    }
    
    /// Insert Data into Firestore Databse
    func insertUserData() {
        if let curruntUser = UserManager.shared.current {
            var param: [String: Any] = [:]
            param[FirbaseKeys.name]  = curruntUser.name ?? ""
            param[FirbaseKeys.email]  = curruntUser.email ?? ""
            param[FirbaseKeys.profile]  = curruntUser.image ?? ""
            param[FirbaseKeys.id]  = curruntUser.id ?? ""
            param[FirbaseKeys.photos]  = [String]()
            let refrance = database.document("\(FirbaseKeys.users)/\(curruntUser.id ?? "")")
            refrance.setData(param)
        }
    }
    
    /// Get User Data from fire store
    func getUserData() {
        if let curruntUser = UserManager.shared.current {
            let def = database.document("\(FirbaseKeys.users)/\(curruntUser.id ?? "")")
            def.addSnapshotListener { snap, error  in
                if let data = snap?.data() {
                    let userModel = User(object: data)
                    UserManager.shared.sync(user: userModel)
                    
                }
            }
        }
    }
    func updateUserModel(photoUrl: String)  {
        if let curruntUser = UserManager.shared.current {
            curruntUser.photos?.append(photoUrl)
            UserManager.shared.sync(user: curruntUser)
            var param: [String: Any] = [:]
            param[FirbaseKeys.photos]  = curruntUser.photos ?? []
            let refrance = database.document("\(FirbaseKeys.users)/\(curruntUser.id ?? "")")
            refrance.updateData(param)
        }
    }

    func getAllPhotos()  {
        let storageReference = storage.reference().child("images")
        storageReference.listAll { (result, error) in
            if let resultobj  = result {
                for prefix in resultobj.items {
                    let ref2 = Storage.storage().reference(forURL: prefix.description)
                    print(ref2)
                }
            }
        }
    }
    
}
