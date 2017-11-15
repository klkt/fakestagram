//
//  SignUpViewController.swift
//  Fakestagram
//
//  Created by Jacob Schantz on 11/14/17.
//  Copyright © 2017 Kenny Lim. All rights reserved.
//

import UIKit

class AuthViewController: UIViewController {
    

    var emailTextField : UITextField = UITextField()
    var passwordTextField : UITextField = UITextField()
    var loginButton : UIButton = UIButton()
    var signUpButton : UIButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        generateStackView()
        // Do any additional setup after loading the view.
    }
    
    
}
