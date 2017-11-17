//
//  User.swift
//  Fakestagram
//
//  Created by Jacob Schantz on 11/14/17.
//  Copyright © 2017 Kenny Lim. All rights reserved.
//

import Foundation
import FirebaseDatabase

class User {
    static var loggedInUser : User = User()
    var uid : String = ""
    var email : String = ""
    var bio : String = ""
    var profilePicUrl : String = ""
    var following : [String] = []
    var followers : [String] = []
    var posts : [String] = []
    
    init(){
        
    }
    
    init(uid: String, email: String){
        self.uid = uid
        self.email = email
    }
}
