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
import FirebaseDatabase
import SwiftyJSON

/// Perform all firebase file uplded task
class FirebaseDatabaseManager {
    
    // Get a reference to the storage service using the default Firebase App
    private let storage = Storage.storage()

    // Get a database reference to the Firestore storage service using the default Firebase firstore
    private let database = Firestore.firestore()

    static let shared = FirebaseDatabaseManager()
    
    /// get a Firebase Database refrence to the firebase live database storage
    private let firedatabase = Database.database().reference()
    
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
            param[FirbaseKeys.photos]  = UDManager.userPhotos ?? [String]()
            let refrance = database.document("\(FirbaseKeys.users)/\(curruntUser.id ?? "")")
            refrance.setData(param)
        }
    }
    
    /// Fetch all firebase store feeds value
    /// - Parameter completion: completion handle it  will return Boo and Feed Data Model
    func fetchAllFeeds(completion: @escaping (( Bool, FeedData?) -> Void)) {
        firedatabase.child(FirbaseKeys.data).observeSingleEvent(of: .value) { snapshot, _  in
            ProgressHUD.hide()
            if let value  = snapshot.value as? [String : Any] {
                let objFeed = FeedData(object: value)
                completion(true, objFeed)
            } else {
                completion(false, nil)
            }
            
        }
    }
    /// Insert Data into Firestore Databse
    func insertFeed(photoUrl: String, title: String, completion: @escaping (() -> Void)) {
        if let curruntUser = UserManager.shared.current {
            ProgressHUD.show()

            var param = [String: Any]()
            
            var feedArray = [[String: Any]]()
            
            var feedDic = [String: Any]()
            feedDic[FirbaseKeys.images]  = photoUrl
            feedDic[FirbaseKeys.like]  = 0
            feedDic[FirbaseKeys.title]  = title
            feedDic[FirbaseKeys.postid]  = Utility.generateRandomNumber(inRange: 1...100)
            feedDic[FirbaseKeys.postid]  = curruntUser.id ?? ""
            
            var comentArray = [[String: Any]]()
            var commentDic = [String: Any]()

            commentDic[FirbaseKeys.comment]  = "comments not added"
            comentArray.append(commentDic)
            feedDic[FirbaseKeys.comments]  = comentArray
            feedArray.append(feedDic)
            
            param[FirbaseKeys.feed]  = feedArray
            
            // The path to your array in the database
            let arrayPath = FirbaseKeys.dataFeed

            //This code first retrieves the current array from the database, adds the new object to it, and then updates the array in the database.
            // Get a reference to the array
            let arrayRef = firedatabase.child(arrayPath) 

            // Add the new object to the array
            arrayRef.observeSingleEvent(of: .value) { snapshot in
                
                ProgressHUD.hide()
                
                if var array = snapshot.value as? [[String: Any]] {
                    array.append(feedDic)
                    arrayRef.setValue(array)
                } else {
                    // If the array doesn't exist yet, create it with the new object
                    arrayRef.setValue([feedDic])
                }
                completion()
            }
        }
    }
    
    /// Fetch  all user details from fire store
    /// - Parameter completion: completion handler
    func getUserData(isShowLoader: Bool = false,completion: @escaping (() -> Void)) {
        if let curruntUser = UserManager.shared.current {
            if isShowLoader {
                ProgressHUD.show()
            }
            let def = database.document("\(FirbaseKeys.users)/\(curruntUser.id ?? "")")
            def.getDocument { snap, error  in
                if let data = snap?.data() {
                        let userModel = User(object: data)
                        if let photos = data[FirbaseKeys.photos] as? [String] {
                            UDManager.userPhotos = photos
                        }
                        UserManager.shared.sync(user: userModel)
                        completion()
                } else {
                    completion()
                }
            }
        }
    }
    
    /// For Updating user data to firestore
    /// - Parameter photoUrl: Phtoto Url in String
    func updateUserModel(photoUrl: String)  {
        if let curruntUser = UserManager.shared.current {
            UDManager.userPhotos?.append(photoUrl)
            var param: [String: Any] = [:]
            param[FirbaseKeys.photos]  = UDManager.userPhotos ?? []
            let refrance = database.document("\(FirbaseKeys.users)/\(curruntUser.id ?? "")")
            refrance.updateData(param)
        }
    }
    
    /// Foe getting all uploed image in  firebase storage
    func getAllPhotos()  {
        let storageReference = storage.reference().child(FirbaseKeys.images)
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
