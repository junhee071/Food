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
    //create and insert a new food item based on the food item's data
    
    
}




class SearchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
  
    
    

    
    @IBOutlet var foodTableView: UITableView!

    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var addCustom: UIBarButtonItem!
    
    let searchController = UISearchController(searchResultsController: nil)
    var foodsArray: [Food] = []
    var holder: String = ""
    //this was on tuesday july 31: weak var delegate: SearchViewControllerDelegate!
    weak var delegate: SearchViewControllerDelegate?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let request: NSFetchRequest<Food> = Food.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
        foodsArray = CoreDataHelper.loadFoods(with: request)
        searchBar?.delegate = self
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let subjectCell = tableView.cellForRow(at: indexPath), let destinationViewController = navigationController?.storyboard?.instantiateViewController(withIdentifier: "ExpirationDateTableViewController") as? ExpirationDateTableViewController {
            //notift tghe delegate what food was selected by the user
            var food: Food? = nil
//            food = DatabaseHelper.getFood(for: (subjectCell.textLabel?.text)!)
            food = foodsArray[indexPath.row]
            if let foundFood = food {
                print("hi")
                print(foundFood)
                self.delegate?.search(self, didSelectANew: foundFood)
            
            } else {

            }
            
            if self.presentingViewController != nil {
                self.dismiss(animated: false, completion: {
                    self.navigationController!.popToRootViewController(animated: true)
                })
            }
            else {
                self.navigationController!.popToRootViewController(animated: true)
            }
            
            func passFood(string: String) {
                print("notified")
            }
            //dismiss myself
//            self.navigationController?.popViewController(animated: true)
//            navigationController?.pushViewController(destinationViewController, animated: true)
            
            
        }

    }
    
    //declare searchvc.delegate = self
//    somewhere in expiration vc
//    i think putting it in the manual button action should work but tey it out
    
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
    
    
    

    @IBAction func addCustomButtonTapped(_ sender: UIBarButtonItem) {
        self.performSegue(withIdentifier: "showCustom", sender: nil)
    }
    
    
    @IBAction func unwindWithSegue(_ sender: UIStoryboardSegue) {
        if sender.source is AddCustomViewController {
            if let senderVC = sender.source as? AddCustomViewController {
                let holder2 = senderVC.character
                holder = holder2!
                addCustomFood(name: holder)
            }
        }
    }
    
    func addCustomFood(name: String) {
        let newFoodCoreDataIem = CoreDataHelper.newFood()
        newFoodCoreDataIem.name = name
        newFoodCoreDataIem.expiration = "3 months"
        CoreDataHelper.saveFood()
        let request: NSFetchRequest<Food> = Food.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
        foodsArray = CoreDataHelper.loadFoods(with: request)
        self.delegate?.search(self, didSelectANew: newFoodCoreDataIem)
        self.navigationController!.popToRootViewController(animated: true)

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showCustom" {
            print("it segued")
        }
    }
    
    
   
   
    
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



