//
//  extensions.swift
//  chatApp
//
//  Created by Jacob Schantz on 11/9/17.
//  Copyright © 2017 Jacob Schantz. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    func alert(_ title: String,_ message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
}

