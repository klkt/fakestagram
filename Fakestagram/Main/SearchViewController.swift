//
//  SearchViewController.swift
//  Fakestagram
//
//  Created by Jacob Schantz on 11/14/17.
//  Copyright © 2017 Kenny Lim. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate, UISearchDisplayDelegate, UISearchResultsUpdating {
    

    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var tableView: UITableView!
    
    var userArray : [User] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        
        userSearchBar()
        
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        
        self.tableView.reloadData()
    
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let user = userArray[indexPath.row]
        cell.textLabel?.text = user.uid
        return cell
        }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let Storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let PvC = Storyboard.instantiateViewController(withIdentifier: "ProfileViewController") as? ProfileViewController
            else {return}
        self.navigationController?.pushViewController(PvC, animated: true)
    }
    
    func userSearchBar() {
        if searchBar.text! == "" {
            userArray = []
        } else {
            userArray = userArray.filter { $0.uid.lowercased().contains(searchBar.text!.lowercased()) }
        }
        self.tableView.reloadData()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        userSearchBar()
        }
    
    }
    


