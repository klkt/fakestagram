//
//  Notification.swift
//  FirebaseChatApp
//
//  Created by Jacob Schantz on 11/13/17.
//  Copyright © 2017 Max Jala. All rights reserved.
//

import Foundation



extension NotificationCenter {
    
    static func appLogin() {
        let authNotification = Notification(name: Notification.Name(rawValue: "AuthLogin"), object: nil, userInfo: nil)
        self.default.post(authNotification)
    }
    static func appLogout() {
        let authNotification = Notification(name: Notification.Name(rawValue: "AuthLogout"), object: nil, userInfo: nil)
        self.default.post(authNotification)
    }
}
