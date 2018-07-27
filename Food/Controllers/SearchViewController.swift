//
//  SearchViewController.swift
//  Food
//
//  Created by Jun Hee Han on 7/23/18.
//  Copyright © 2018 Jun Hee Han. All rights reserved.
//

import Foundation
import UIKit
import CoreData

protocol SearchViewControllerDelegate: class {
    func search(_ viewController: SearchViewController, didSelectANew food: Food)
}

class SearchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    
    @IBOutlet var foodTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    let searchController = UISearchController(searchResultsController: nil)
    
    var foodsArray: [Food] = []
    
    weak var delegate: SearchViewControllerDelegate?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let request: NSFetchRequest<Food> = Food.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
        foodsArray = CoreDataHelper.loadFoods(with: request)
        searchBar.delegate = self
        foodTableView.delegate = self
        foodTableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = foodsArray[indexPath.row].name
        return cell
    }
    
//    @IBAction func findExpirationDateButtonTapped(_ sender: UIButton) {
////        let data = DatabaseHelper.obtainDatabase()
//        var food: Food? = nil
//
//        //call the getFood() function in databasehelper
//        food = DatabaseHelper.getFood(for: searchBar.text!)
//
//
//        if let foundFood = food {
//            //create timer save to coreData
//
//            //notift tghe delegate what food was selected by the user
//            delegate?.search(self, didSelectANew: foundFood)
//
//            //dismiss myself
//            self.navigationController?.popViewController(animated: true)
//        } else {
//            //not found
//        }
//
//    }
}

extension SearchViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text?.count == 0 {
             let request: NSFetchRequest<Food> = Food.fetchRequest()
            request.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
            foodsArray = CoreDataHelper.loadFoods(with: request)
            foodTableView.reloadData()
        }
        else {
            let request: NSFetchRequest<Food> = Food.fetchRequest()
            
           request.predicate = NSPredicate(format: "name BEGINSWITH[cd] %@", searchText)
            
            request.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
            foodsArray = CoreDataHelper.loadFoods(with: request)
            print(foodsArray.count)
            foodTableView.reloadData()
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        view.endEditing(true)
    }
    
}



