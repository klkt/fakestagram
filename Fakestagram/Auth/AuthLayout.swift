//
//  File.swift
//  Fakestagram
//
//  Created by Jacob Schantz on 11/15/17.
//  Copyright © 2017 Kenny Lim. All rights reserved.
//

import Foundation
import UIKit


extension AuthViewController {
    
    
    func generateTextField() -> UITextField {
        let textField = UITextField()
        textField.backgroundColor = .lightGray
        textField.textAlignment = .center
        textField.layer.cornerRadius = 5
        textField.addConstraint(NSLayoutConstraint(item: textField, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 200))
        return textField
    }
    
    
    func generateButton() -> UIButton{
        let button = UIButton()
        button.layer.cornerRadius = 5
        button.backgroundColor = .lightGray
        return button
    }
    
    
    func generateStackView(){
        emailTextField = generateTextField()
        emailTextField.placeholder = "Email"
        passwordTextField = generateTextField()
        passwordTextField.placeholder = "Password"
        loginButton = generateButton()
        loginButton.setTitle("Login", for: .normal)
        signUpButton = generateButton()
        signUpButton.setTitle("Sign Up", for: .normal)

        let loginItems : [UIView] = [emailTextField, passwordTextField, loginButton, signUpButton]
        var loginView = UIStackView()
        loginView = UIStackView(arrangedSubviews: loginItems)
        loginView.axis = .vertical
        loginView.distribution = .fillEqually
        loginView.alignment = .fill
        loginView.spacing = 50
        loginView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(loginView)
        loginView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    
//    func stack(_ grid: UIStackView){
//        let viewsDictionary = ["grid":grid]
//        let stackView_H = NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[grid]-0-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDictionary)
//        let stackView_V = NSLayoutConstraint.constraints(withVisualFormat: "V:|-150-[grid]-150-|", options: NSLayoutFormatOptions(rawValue:0), metrics: nil, views: viewsDictionary)
//        view.addConstraints(stackView_H)
//        view.addConstraints(stackView_V)
//    }
    
    
}
