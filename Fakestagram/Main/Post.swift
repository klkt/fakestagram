//
//  User.swift
//  Fakestagram
//
//  Created by Jacob Schantz on 11/14/17.
//  Copyright © 2017 Kenny Lim. All rights reserved.
//

import Foundation
import FirebaseDatabase


class Post {
    var postId : String = ""
    var ownerId : String = ""
    var pictureUrl : String = ""
    var caption : String = ""
    var timeStamp : Double = 0.0
    var likers : [String] = []
    var comments : [Comment] = []
    
    init(postId: String,ownerId: String, pictureUrl: String, timeStamp: Double){
        self.postId = postId
        self.ownerId = ownerId
        self.pictureUrl = pictureUrl
        self.timeStamp = timeStamp
    }
    
    func saveToDatabase(){
        let ref = Database.database().reference()

        // store in posts
        let posts = ref.child("posts")
        let thisPost = posts.child(self.postId)
        let dict = ["owner" : self.ownerId, "timeStamp" : self.timeStamp] as [String : Any]
        thisPost.setValue(dict)
        if self.caption != "" {
            thisPost.updateChildValues(["caption" : self.caption])
        }
        
        // store postId in owner
        let users = ref.child("users")
        let owner = users.child(self.ownerId)
        let ownedPosts = owner.child("posts")
        ownedPosts.updateChildValues(["\(postId)" : true])
    }
}


class Comment {
    var commentId : String = ""
    var uid : String = ""
    var text : String = ""
    var timeStamp : Double = 0.0

    init(commentId: String, uid: String, text: String, timeStamp: Double){
        self.commentId = commentId
        self.uid = uid
        self.text = text
        self.timeStamp = timeStamp
    }
}
