//
//  NewPostViewController.swift
//  Fakestagram
//
//  Created by Jacob Schantz on 11/14/17.
//  Copyright © 2017 Kenny Lim. All rights reserved.
//

import UIKit

class NewPostViewController: UIViewController {

    @IBOutlet weak var postImageView: UIImageView! {
        didSet{
            postImageView.contentMode = .scaleAspectFit
        }
    }
    @IBOutlet weak var captionTextField: UITextField!
    @IBAction func postButtonTapped(_ sender: Any) {
        
    }
    
    func addTapRecognizer(){
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapGestureAction(_:)))
        postImageView?.isUserInteractionEnabled = true
        postImageView?.addGestureRecognizer(tap)
    }
    @objc func tapGestureAction(_ gesture: UITapGestureRecognizer) {
        guard let imageView = gesture.view as? UIImageView
            else{return}
        print("tapped")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
