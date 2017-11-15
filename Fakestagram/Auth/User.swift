//
//  User.swift
//  Fakestagram
//
//  Created by Jacob Schantz on 11/14/17.
//  Copyright © 2017 Kenny Lim. All rights reserved.
//

import Foundation

class User {
    var uid : String = ""
    var email : String = ""
    var bio : String = ""
    var profilePicUrl : String = ""
    var following : [String] = []
    var followers : [String] = []
    
    init(uid: String, email: String, bio: String, profilePicUrl: String ){
        self.uid = uid
        self.email = email
        self.bio = bio
        self.profilePicUrl = profilePicUrl
    }
}
