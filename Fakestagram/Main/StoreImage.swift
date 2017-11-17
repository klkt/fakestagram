//
//  StoreImage.swift
//  Fakestagram
//
//  Created by Jacob Schantz on 11/16/17.
//  Copyright © 2017 Kenny Lim. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
import FirebaseStorage


class StoreImage {
    static func uploadImageToStorage(image : UIImage, postId : String, completion : @escaping ((_ error : String?,_ url : URL?) -> ())) {
        
        let storageRef = Storage.storage().reference()

        guard let data = UIImagePNGRepresentation(image)
            else {
                print("Invalid image data")
                completion("Invalid image data", nil)
                return
        }
        // Create a reference to the file you want to upload
        let imgRef = storageRef.child("posts/\(postId).jpg")
        
        let metadata = StorageMetadata()
        metadata.contentType = "image/jpeg"
        
        // Upload the file to the path "images/rivers.jpg"
        let uploadTask = imgRef.putData(data, metadata: metadata) { (metadata, error) in
            
            if let error = error {
                //something wrong when uploading to storage
                print("Error : \(error.localizedDescription)")
                completion(error.localizedDescription, nil)
                return
            }
            
            guard let metadata = metadata else {
                // Uh-oh, an error occurred!
                completion("No Metadata Return", nil)
                return
            }
            // Metadata contains file metadata such as size, content-type, and download URL.
            let downloadURL = metadata.downloadURL()
            
            completion(nil, downloadURL)
        }
        uploadTask.resume()
    }
    
}
