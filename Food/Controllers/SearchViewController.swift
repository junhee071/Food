//
//  SearchViewController.swift
//  Food
//
//  Created by Jun Hee Han on 7/23/18.
//  Copyright © 2018 Jun Hee Han. All rights reserved.
//

import Foundation
import UIKit

protocol SearchViewControllerDelegate: class {
    func search(_ viewController: SearchViewController, didSelectANew food: Food)
}

class SearchViewController: UITableViewController, UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    let searchController = UISearchController(searchResultsController: nil)
    
    var friendsArray: [Food] = []
    var filteredFriendsArray = [Food]()
    
    weak var delegate: SearchViewControllerDelegate?
    
    
    
    @IBOutlet weak var FindExpirationDate: UIButton!
    
    func searchBarIsEmpty() -> Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    func filterContentForSearchText(searchText: String, scope: String = "All") {
        filteredFriendsArray = friendsArray.filter({( food: Food) -> Bool in
            return food.name.lowercased().contains(searchText.lowercased())
        })
        tableView.reloadData()
        }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Foods"
        definesPresentationContext = true
        tableView.tableHeaderView = searchController.searchBar
    }
//
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.destination is ExpirationDateTableViewController {
//            let vc = segue.destination as? ExpirationDateTableViewController
//            vc?.foodName = searchBar.text!
//
//        }
//    }
    
   
    
    func isFiltering() ->  Bool {
        return searchController.isActive && !searchBarIsEmpty()
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering() {
            return filteredFriendsArray.count
        }
        return friendsArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath as IndexPath)
        
        let food: Food
        
        if isFiltering() {
            food = filteredFriendsArray[indexPath.row]
        } else {
            food = friendsArray[indexPath.row]
        }
        
        
        cell.textLabel!.text = food.name
        return cell
    }
    
    
    @IBAction func findExpirationDateButtonTapped(_ sender: UIButton) {
//        let data = DatabaseHelper.obtainDatabase()
        var food: Food? = nil
        
        //call the getFood() function in databasehelper
        food = DatabaseHelper.getFood(for: searchBar.text!)
   
        
        if let foundFood = food {
            //create timer save to coreData
            
            //notift tghe delegate what food was selected by the user
            delegate?.search(self, didSelectANew: foundFood)
            
            //dismiss myself
            self.navigationController?.popViewController(animated: true)
        } else {
            //not found
        }
        
    }
}

extension SearchViewController: UISearchResultsUpdating {
    // MARK: - UISearchResultsUpdating Delegate
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchText: nahsearchBar.text!)

    }
}



