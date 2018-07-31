//
//  ExpirationDateViewController.swift
//  Food
//
//  Created by Jun Hee Han on 7/23/18.
//  Copyright © 2018 Jun Hee Han. All rights reserved.
//

//TODO:
//1. array(array of two dictinaries repeating)
//go into array, check first dictionary's value. match it. then pull out second dictionaries value
//get name of food and expiration date and put them into the view controller side by side


import Foundation
import UIKit

//



class ExpirationDateTableViewController: UITableViewController, SearchViewControllerDelegate {
    
    func search(_ viewController: SearchViewController, didSelectANew food: Food) {
        print("helloooo")
        fridge.insert(food, at: 0)
        let fridgeItem = CoreDataHelper.newFridgeItem()
//        viewController.s
//        fridge.insert(food, at: 0)
//        tableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: .automatic)
        tableView.reloadData()
    }
    
    
    
    @IBAction func manualSearchPressed(_ sender: Any) {

        let searchStoryboard = UIStoryboard(name: "SearchScreen", bundle: nil)
        let searchVC = searchStoryboard.instantiateViewController(withIdentifier: "SearchViewController") as? SearchViewController
        searchVC?.delegate = self
        self.navigationController?.pushViewController(searchVC!, animated: true)
    

    }
    
    var fridge: [Food] = []
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            switch identifier {
            case "showsearchviewcontroller":
                guard let otherViewController = segue.destination as? SearchViewController else {
                    return assertionFailure("storyboard not setup correctly")
                }
                
                otherViewController.delegate = self
                CoreDataHelper.saveFood()
            default:
                break
            }
        }
    }
   
    
//    var foodName:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let num = 245
        print("The number is \(num)")
        fridge = []

//        print(foodName)
//        //access plist file as dictionary
//        if let fileUrl = Bundle.main.url(forResource: "output-onlinecsvtools", withExtension: "plist"),
//        let data = try? Data(contentsOf: fileUrl) {
//            if let result = try? PropertyListSerialization.propertyList(from: data, options: [], format: nil) as! [[String: Any]] { // [String: Any] which ever it is
//                for arr in result {
//                    let nameInArr = arr["Product"] as! String
//                    if nameInArr == foodName {
//                        print(arr["Extension period"] as! String)
//                    }
//                }
//            }
//        }
        
           
            
        
        }
   
        
    override func viewWillAppear(_ animated: Bool) {
        CoreDataHelper.retrieveFridgeItems()
    }
    override func didReceiveMemoryWarning() {
         super.didReceiveMemoryWarning()
    }
    
    
//    func obtainDatabase() -> [[String: Any]] {
//        //access plist file as dictionary
//        if let fileUrl = Bundle.main.url(forResource: "output-onlinecsvtools", withExtension: "plist"),
//        let data = try? Data(contentsOf: fileUrl) {
//        if let result = try? PropertyListSerialization.propertyList(from: data, options: [], format: nil) as! [[String: Any]] { // [String: Any] which ever it is
//            return result
//        }
//        }
//        return [[:]]
//    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fridge.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        if let foodInfo = data[foodName] {
//            let nOfDays = foodInfo.expirationTime
//            nOfDays
//
//        } else {
//            //no food was found
//        }
//
//        let
//        let expirationDate = Date(timeIntervalSinceNow: 60*60*24*nOfDaysUntilExpires)
//
//        let data = obtainDatabase()
//        var food: String = ""
//        var expiration: String = ""
//        for arr in data {
//            food = arr["Product"] as! String
//            if food == foodName {
//                expiration = arr["Extension period"] as! String
//                break
//            }
//        }
        
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "expirationTableViewCell", for: indexPath) as! ExpirationDateTableViewCell
        
        
        let foodForTheCurrentIndexPath = fridge[indexPath.row]
        
        cell.foodNameLabel.text = foodForTheCurrentIndexPath.name
        cell.expirationTimeLabel.text = foodForTheCurrentIndexPath.expiration
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let foodToDelete = fridge[indexPath.row]
            CoreDataHelper.delete(food: foodToDelete)
            
//            fridge = CoreDataHelper.retrieveFood(predicate: nil)
            tableView.reloadData()
//            self.fridge.remove(at: indexPath.row)
//            self.tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    
    

}
