//
//  SearchViewController.swift
//  Fakestagram
//
//  Created by Jacob Schantz on 11/14/17.
//  Copyright © 2017 Kenny Lim. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate, UISearchDisplayDelegate {

    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var tableView: UITableView!
    
    //@IBOutlet weak var textLabel: UILabel!
    
    var userArray = [User]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func arrayOfUsers() {
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else {
            return UITableViewCell()
        }
        
       // cell.textLabel?.text = userArray[indexPath.row].uid
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
