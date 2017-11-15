//
//  LoginViewController.swift
//  
//
//  Created by Jacob Schantz on 11/14/17.
//

import UIKit

class LoginViewController: UIViewController {
    
    var emailTextField = UITextField()
    
    
    func createTextField() -> UITextField {
        let textField = UITextField()
        textField.frame = CGRect(x: 0, y: 0, width: 300, height: 50)
        textField.center = CGPoint(x: view.center.x, y: view.center.y)
        textField.backgroundColor = UIColor.gray
        view.addSubview(textField)
        return textField
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField = createTextField()

    }

}
