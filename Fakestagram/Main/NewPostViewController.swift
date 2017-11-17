//
//  NewPostViewController.swift
//  Fakestagram
//
//  Created by Jacob Schantz on 11/14/17.
//  Copyright © 2017 Kenny Lim. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
import FirebaseStorage

class NewPostViewController: UIViewController {

    let placeHolderImage = UIImage(named: "placeHolder")
    @IBOutlet weak var postImageView: UIImageView! {
        didSet{
            postImageView.contentMode = .scaleAspectFit
            addTapRecognizer()
        }
    }
    @IBOutlet weak var captionTextView: UITextView!
    @IBAction func postButtonTapped(_ sender: Any) {
        
        guard let postImage = postImageView.image
            else{return}
        if postImage == placeHolderImage {
            self.alert("Must upload an image", "")
        }
        
        let ref = Database.database().reference()
        let posts = ref.child("posts")
        let selectedPost = posts.childByAutoId()
        
        StoreImage.uploadImageToStorage(image: postImage, postId: selectedPost.key) { (error, url) in
            if let validError = error {
               self.alert("upload image error", validError)
            }

            if let validURL = url?.absoluteString {
                let newPost = Post(postId: selectedPost.key, ownerId: User.loggedInUser.uid, pictureUrl: validURL, timeStamp: Date().timeIntervalSince1970)
                if let caption = self.captionTextView.text{
                    if caption != "" {
                        newPost.caption = caption
                    }
                }
                newPost.saveToDatabase()
                self.tabBarController?.selectedIndex = 0
            }
            
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        postImageView.image = placeHolderImage
    }
    

}



extension NewPostViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate  {
    
    
    func addTapRecognizer(){
        let tap = UITapGestureRecognizer(target: self, action: #selector(presentImagePicker(_:)))
        postImageView?.isUserInteractionEnabled = true
        postImageView?.addGestureRecognizer(tap)
    }
    @objc func presentImagePicker(_ gesture: UITapGestureRecognizer) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary),
            let mediaType = UIImagePickerController.availableMediaTypes(for: .photoLibrary)
        {
            imagePicker.mediaTypes = mediaType
            present(imagePicker, animated: true, completion: nil)
            
        }
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            postImageView.image = selectedImage
        }
        dismiss(animated: true, completion: nil)
    }
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}

