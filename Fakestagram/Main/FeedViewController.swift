//
//  FeedViewController.swift
//  Fakestagram
//
//  Created by Jacob Schantz on 11/14/17.
//  Copyright © 2017 Kenny Lim. All rights reserved.
//

import UIKit
import FirebaseDatabase


class FeedViewController: UIViewController {

    @IBOutlet weak var feedTableView: UITableView!
    var posts : [Post] = [Post]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    
    // grab all posts from database
    func observeFirebase(){
        let ref = Database.database().reference()
        ref.child("posts").observe(.childAdded) { (snapshot) in
            if let dict = snapshot.value as? [String:Any],
                let ownerId = dict["ownerId"] as? String,
                let pictureUrl = dict["pictureUrl"] as? String,
                let timeStamp = dict["timeStamp"] as? Double,
                let caption = dict["caption"] as? String {
                let newPost = Post(ownerId: ownerId, pictureUrl: pictureUrl, timeStamp: timeStamp)
                if caption != "" {
                    newPost.caption = caption
                }
                // add posts from database to posts array and insert the rows
                self.posts.append(newPost)
                let indexPath = IndexPath(row: self.posts.count-1, section: 0)
                self.feedTableView.insertRows(at: [indexPath], with: .fade)
            }
        }
    }
}

extension FeedViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = feedTableView.dequeueReusableCell(withIdentifier: "feedCell", for: indexPath)
        let post = posts[indexPath.row]
        cell.textLabel?.text = post.ownerId
        return cell
    }
}

