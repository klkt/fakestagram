//
//  User.swift
//  Fakestagram
//
//  Created by Jacob Schantz on 11/14/17.
//  Copyright © 2017 Kenny Lim. All rights reserved.
//

import Foundation


class Post {
    var postId : String = ""
    var ownerId : String = ""
    var pictureUrl : String = ""
    var timeStamp : Double = 0.0
    var likers : [String] = []
    var comments : [Comment] = []
    
    init(postId: String, ownerId: String, pictureUrl: String, timeStamp: Double ){
        self.postId = postId
        self.ownerId = ownerId
        self.pictureUrl = pictureUrl
        self.timeStamp = timeStamp
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
