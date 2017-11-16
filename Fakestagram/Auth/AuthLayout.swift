//
//  File.swift
//  Fakestagram
//
//  Created by Jacob Schantz on 11/15/17.
//  Copyright © 2017 Kenny Lim. All rights reserved.
//

import Foundation
import UIKit


class AuthLayout : UIViewController {
    
    
    // Generic creation functions
    func createTextField() -> UITextField {
        let textField = UITextField()
        textField.backgroundColor = .lightGray
        textField.textAlignment = .center
        textField.layer.cornerRadius = 5
        textField.autocapitalizationType = .none
        textField.addConstraint(NSLayoutConstraint(item: textField, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 300))
        return textField
    }
    
    
    func createButton() -> UIButton {
        let button = UIButton()
        button.layer.cornerRadius = 5
        button.backgroundColor = .lightGray
        button.addConstraint(NSLayoutConstraint(item: button, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 100))
        return button
    }
    
    
    // Specific creation functions
    func createEmailTextField() -> UITextField {
        let textField = createTextField()
        textField.placeholder = "email"
        return textField
    }
    
    
    func createPasswordTextField() -> UITextField {
        let textField = createTextField()
        textField.placeholder = "password"
        return textField
    }
    
    
    func createLoginButton() -> UIButton {
        let button = createButton()
        button.setTitle("Login", for: .normal)
        return button
    }
    
    
    func createSignUpButton() -> UIButton {
        let button = createButton()
        button.setTitle("Sign Up", for: .normal)
        return button
    }
    

}
